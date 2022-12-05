(define-module (gnu packages sim-additions)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages simulation)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 regex)
  #:use-module (srfi srfi-1))

(define-public openfoam-10
  (package
    (inherit openfoam)
    (name "openfoam")
    (version "10-20221128")
    (source (origin
	      (method url-fetch)
	      (uri (string-append
		    "http://dl.openfoam.org/source/"
		    (string-map (lambda (x) (if (eq? x #\.) #\- x)) version)))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32 "1kq083cci7y11vhn3ydwhb5yqkjkgk5hpibakfc4p94cg6x15msr"))
	      (patches
	       (parameterize
		   ((%patch-path
		     (map (lambda (directory)
			    (string-append directory "/gnu/packages/patches"))
			  %load-path)))
		 (search-patches "openfoam-10-cleanup-2.patch")))
	      (modules '((guix build utils)))
	      (snippet
    	       '(begin
    		  ;; do not source bash_completion
		  (substitute* "etc/bashrc"
		    (("^.*bash_completion.*$" all) (string-append "#" all)))
		  ;; set Gcc directly, somehow a bug in openfoam
		  (substitute* "wmake/rules/General/general"
		    (("^COMPILER_TYPE   = .*$") "COMPILER_TYPE   = Gcc\n"))))))
    (inputs (modify-inputs (package-inputs openfoam)
	      (append gnuplot gzip openmpi pt-scotch paraview-5.9)
	      (delete pt-scotch32)))
    (propagated-inputs (modify-inputs (package-propagated-inputs openfoam)
			 (delete openmpi gzip gnuplot)))
    (arguments
     `( ;; Executable files and shared libraries are located in the 'platforms'
       ;; subdirectory.
       #:strip-directories (list (string-append
                                  "lib/OpenFOAM-" ,version
                                  "/platforms/linux64GccDPInt32Opt/bin")
                                 (string-append
                                  "lib/OpenFOAM-" ,version
                                  "/platforms/linux64GccDPInt32Opt/lib"))

       #:modules ((ice-9 ftw)
                  (ice-9 regex)
		  (ice-9 string-fun)
		  (srfi srfi-1)
                  (guix build gnu-build-system)
                  (guix build utils))

       #:phases (modify-phases %standard-phases
		  (add-after 'unpack 'rename-build-directory
		    (lambda _
		      (chdir "..")
		      ;; Use 'OpenFOAM-version' convention to match the file
		      ;; name expectations in the build phase.
		      (let ((unpack-dir (string-append
		  			 (getcwd) "/OpenFOAM-" ,version "-version-" ,version))
		            (build-dir (string-append
		  			(getcwd) "/OpenFOAM-" ,version)))
			(rename-file unpack-dir build-dir) ; rename build directory
			(chdir (basename build-dir))) ; move to build directory
		      #t))
		  (add-after 'rename-build-directory 'patch-SHELL
		    (lambda _
		      (substitute* (list "wmake/src/Makefile"
		      			 "wmake/makefiles/general")
			(("/bin/sh") which "sh"))    
		      #t))
		  (add-after 'patch-SHELL 'patch-HOME
		    (lambda _
		      (setenv "HOME" "/tmp")
		      #t))
		  (add-after 'patch-HOME 'patch-gzip
		    (lambda _
		      (substitute* "bin/tools/scanpackages"
			(("gzip") (assoc-ref %build-inputs "gzip")))
		      #t))
		  (add-after 'patch-gzip 'patch-gnuplot
		    (lambda _
		      (substitute* "etc/bashrc"
			(("export GNUPLOT=gnuplot")
			 (string-append "export GNUPLOT=" (assoc-ref %build-inputs "gnuplot"))))
		      #t))
		  (delete 'configure)             ; no configure phase
		  (replace 'build
		    (lambda _
		      (letrec* ((libraries '("boost"
					     "cgal"
					     "gmp"
					     "metis"
					     "mpfr"
					     "pt-scotch"
					     "openmpi"
					     "zlib"
					     "paraview"))
				(rpaths (fold-right (lambda (library rpaths)
						      (string-append
						       rpaths
						       "-rpath="
						       (assoc-ref %build-inputs library)
						       "/lib,"))
						    "" libraries)))
			;; set variables to define store paths
			(for-each (lambda (library)
				    (letrec* ((name (string-replace-substring
						     (string-upcase library) "-" "_"))
					      (path (assoc-ref %build-inputs library)))
				      ;; set store path
				      (setenv (string-append name "_ROOT") path))) libraries)
			;; set package versions
			(setenv "SCOTCHVERSION" ,(package-version pt-scotch))
			(setenv "METISVERSION" ,(package-version metis))
			(setenv "OPENMPIVERSION" ,(package-version openmpi))
			(setenv "PARAVIEWVERSION" ,(package-version paraview-5.9))
			;; set variable to pass extra 'rpath' arguments to linker
			(setenv "LDFLAGS"
				(string-append
				 "-Wl,"
				 rpaths
				 "-rpath=" %output "/lib/OpenFOAM-" ,version
				 "/platforms/linux64GccDPInt32Opt/lib,"
				 "-rpath=" %output "/lib/OpenFOAM-" ,version
				 "/platforms/linux64GccDPInt32Opt/lib/dummy")))
		      
		      ;; compile OpenFOAM libraries and applications
		      (zero? (system (format #f
					     "source ./etc/bashrc && ./Allwmake -j~a"
					     (parallel-job-count))))))
		  (add-after 'build 'update-configuration-files
		    (lambda _
		      ;; record store paths and package versions in
		      ;; configuration files
		      (substitute* "etc/config.sh/CGAL"
			(("\\$BOOST_ROOT") (getenv "BOOST_ROOT")))
		      (substitute* "etc/config.sh/CGAL"
			(("\\$CGAL_ROOT") (getenv "CGAL_ROOT")))
		      (substitute* "etc/config.sh/metis"
			(("\\$METIS_ROOT") (getenv "METIS_ROOT")))
		      (substitute* "etc/config.sh/metis"
			(("\\$METISVERSION") (getenv "METISVERSION")))
		      (substitute* "etc/config.sh/scotch"
			(("\\$PT_SCOTCH_ROOT") (getenv "PT_SCOTCH_ROOT")))
		      (substitute* "etc/config.sh/scotch"
			(("\\$SCOTCHVERSION") (getenv "SCOTCHVERSION")))
		      (substitute* "etc/config.sh/settings"
			(("\\$GMP_ROOT") (getenv "GMP_ROOT")))
		      (substitute* "etc/config.sh/settings"
			(("\\$MPFR_ROOT") (getenv "MPFR_ROOT")))
		      (substitute* "etc/config.sh/mpi"
			(("\\$OPENMPI_ROOT") (getenv "OPENMPI_ROOT")))
		      (substitute* "etc/config.sh/mpi"
			(("\\$OPENMPIVERSION") (getenv "OPENMPIVERSION")))
		      (substitute* "etc/config.sh/paraview"
			(("\\$PARAVIEWVERSION") (getenv "PARAVIEWVERSION")))
		      (substitute* "etc/config.sh/paraview"
			(("\\$PARAVIEW_ROOT") (getenv "PARAVIEW_ROOT")))
		      ;; enable sourcing of bash_completion again
		      ;; gives error command "complete" not recognized?
		      ;;(substitute* "etc/bashrc"
		      ;;	(("^#(.*bash_completion.*$)" _ cmd) cmd))
		      #t))
		  (replace 'check
		    (lambda _
		      (zero? (system (format #f
					     "source ./etc/bashrc && ./test/Allrun -j~a"
					     (parallel-job-count))))
		      #t))
		  (add-after 'build 'cleanup
		    ;; Avoid unncessary, voluminous object and dep files.
		    (lambda _
		      (delete-file-recursively
		       "platforms/linux64GccDPInt32Opt/src")
		      (delete-file-recursively
		       "platforms/linux64GccDPInt32OptSYSTEMOPENMPI")
		      (for-each delete-file (find-files "." "\\.o$"))
		      #t))
		  (replace 'install
		    (lambda _
		      ;; use 'OpenFOAM-version' convention
		      (let ((install-dir (string-append
					  %output "/lib/OpenFOAM-" ,version)))
			(mkdir-p install-dir)     ; create install directory
			;; move contents of build directory to install directory
			(copy-recursively "." install-dir))))
		  (add-after 'install 'add-symbolic-link
		    (lambda _
		      ;; add symbolic link for standard 'bin' directory
		      (symlink
		       (string-append "./lib/OpenFOAM-" ,version
				      "/platforms/linux64GccDPInt32Opt/bin")
		       (string-append %output "/bin"))
		      ;; symlink bashrc to 'etc' directory
		      (mkdir-p (string-append %output "/etc/profile.d"))
		      (symlink
		       (string-append "./lib/OpenFOAM-" ,version "/etc/bashrc")
		       (string-append %output "/etc/profile.d/openfoam-10-init.sh"))
		      #t))
		  )))))

(define-public timpi
  (package
    (name "timpi")
    (version "1.8.5")
    (source (origin
	      (method url-fetch)
	      (uri (string-append
		    "https://github.com/libMesh/TIMPI/archive/refs/tags/v"
		    version ".tar.gz"))
	      (file-name (string-append "v" version ".tar.gz"))
	      (sha256
	       (base32 "191rcc96n6bb1skivv4q1py4r3kk8sdhrgj4v5azs736l79dkwc0"))))
    (build-system gnu-build-system)
    ;;(arguments
    ;; `(#:phases
    ;;   (modify-phases %standard-phases
    ;;	 (add-after 'unpack 'remove-packaged-dependencies
    ;;	   (lambda _
    ;;	     (delete-file-recursively "contrib"))
    ;;	   ))))
    ;;(native-inputs (list m4 gfortran-toolchain openmpi))
    (home-page "http://libmesh.github.io")
    (synopsis
     "Templated Interface to MPI")
    (description
     "Templated Interface to MPI")
    (license license:lgpl2.1)))

(define-public libmesh
  (package
    (name "libmesh")
    (version "1.7.1")
    (source (origin
	      (method url-fetch)
	      (uri (string-append
		    "https://github.com/libMesh/libmesh/releases/download/v"
		    version "/libmesh-" version ".tar.gz"))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32 "0q5hypvxvyk5bkjki7xk8pmf0xfzxmpd8kq6j25kgls9y59wq4yz"))
	      (modules '((guix build utils)))
	      (snippet
    	       '(begin
    		  ;; delete bundled dependencies
		  (delete-file-recursively "contrib")))))
    (build-system gnu-build-system)
    ;;(arguments
    ;; `(#:phases
    ;;   (modify-phases %standard-phases
    ;;	 (add-after 'unpack 'remove-packaged-dependencies
    ;;	   (lambda _
    ;;	     (delete-file-recursively "contrib"))
    ;;	   ))))
    (native-inputs (list m4 gfortran-toolchain openmpi))
    (home-page "http://libmesh.github.io")
    (synopsis
     "The libMesh library provides a framework for the numerical simulation of partial differential equations using arbitrary unstructured discretizations on serial and parallel platforms.")
    (description
     "The libMesh library provides a framework for the numerical simulation of partial differential equations using arbitrary unstructured discretizations on serial and parallel platforms. A major goal of the library is to provide support for adaptive mesh refinement (AMR) computations in parallel while allowing a research scientist to focus on the physics they are modeling.")
    (license license:lgpl2.1)))

;;timpi
openfoam-10
