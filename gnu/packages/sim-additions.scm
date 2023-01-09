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
  #:use-module (gnu packages engineering)
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
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages simulation)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
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
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 regex)
  #:use-module (srfi srfi-1))

(define-public utf8cpp
  (package
   (name "utf8cpp")
   (version "3.2.2")
   (source (origin
            (method url-fetch)
            (uri (string-append
		  "https://github.com/nemtrif/utfcpp/archive/refs/tags/v"
		  version ".tar.gz"))
            (sha256
	     (base32
              "1x8rrvx266p1c2ka9pxmrldpz57c77fbf34ak88ak9p25g5yg0bg"))
	    (modules '((guix build utils)))
	    (snippet
    	     '(begin
    		;; delete bundled dependencies
		(delete-file-recursively "extern")
		(substitute* (list "tests/test_unchecked_iterator.cpp"
				   "tests/test_checked_iterator.cpp"
				   "tests/test_unchecked_api.cpp"
				   "tests/test_checked_api.cpp"
				   "tests/test_cpp11.cpp"
				   "tests/test_cpp17.cpp")
			     (("\"\\.\\./extern/ftest/ftest.h\"") "<ftest/ftest.h>"))))))
   (build-system cmake-build-system)
   (native-inputs (list ftest))
   (arguments
    `(#:build-type "Release"
      ))
   (home-page "https://utfcpp.sourceforge.net/")
   (synopsis
    "UTF-8 with C++ in a Portable Way")
   (description
    "UTF-8 with C++ in a Portable Way")
   (license license:asl2.0)))

(define-public ftest
  (package
   (name "ftest")
   (version "bf75576064fce2e07f52cd63a3e410f12358728b")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/nemtrif/ftest")
		  (commit version)))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "01yjhjnlq2gci8hkc6favwj0axq7y1vvnradsgcffby6h09x00b4"))))
   (build-system copy-build-system)
   (native-inputs (list cmake-minimal))
   (arguments
    `(#:install-plan '(("ftest.h" "include/ftest/"))
      #:phases
      (modify-phases %standard-phases
    		     (add-before 'install 'check
    				 (lambda _
    				   (with-directory-excursion "tests"
							     (invoke "cmake" ".")
							     (invoke "make")
							     (invoke "ctest")))
    				 ))))
   (home-page "https://github.com/nemtrif/ftest")
   (synopsis
    "A simple and limited unit-test framework for C++")
   (description
    "A simple and limited unit-test framework for C++")
   (license license:asl2.0)))

(define-public openfoam-10
  (package
    (inherit openfoam)
    (name "openfoam")
    (version "10.20221128")
    (source (origin
	      (method url-fetch)
	      (uri (string-append
		    "http://dl.openfoam.org/source/" version))
	      (file-name
	       (string-append name "-"
			      (string-replace-substring version "." "-") ".tar.gz"))
	      (sha256
	       (base32 "0yd924nhck4jh9gf1wrdnk8svj38yicg4803q79nnjqhn6lcq8c5"))
	      (patches
	       (parameterize
		   ((%patch-path
		     (map (lambda (directory)
			    (string-append directory "/gnu/packages/patches"))
			  %load-path)))
		 (search-patches "openfoam-10-cleanup-21.patch")))
	      (modules '((guix build utils)))
	      (snippet
    	       '(begin
    		  ;; do not source bash_completion
		  (substitute* "etc/bashrc"
		    (("^.*bash_completion.*$" all) (string-append "#" all)))
		  ;; set Gcc directly, somehow a bug in openfoam
		  (substitute* "wmake/rules/General/general"
		    (("^COMPILER_TYPE   = .*$") "COMPILER_TYPE   = Gcc\n"))))))
    (native-inputs (modify-inputs (package-native-inputs openfoam)
		     ;; paraview plugin dependencies
		     (append cmake-minimal
			     vtk
			     libxml2
			     libogg
			     libtheora
			     ffmpeg
			     gl2ps
			     libpng
			     libharu
			     jsoncpp
			     netcdf
			     hdf5
			     gdal
			     libx11
			     qtbase-5
			     eigen
			     glew
			     python
			     expat
			     xz
			     utf8cpp
			     lz4
			     double-conversion
			     libjpeg-turbo
			     libtiff
			     freetype
			     pugixml
			     cgns
			     qtsvg-5
			     qttools-5
			     protobuf
			     qtxmlpatterns)))
    (inputs (modify-inputs (package-inputs openfoam)
	      (append gnuplot gzip openmpi pt-scotch32 paraview-5.9 openssh)
	      (delete pt-scotch32)))
    (propagated-inputs (modify-inputs (package-propagated-inputs openfoam)
			 (delete openmpi gzip gnuplot)))
    (arguments
     `( ;; Executable files and shared libraries are located in the 'platforms'
       ;; subdirectory.
       #:strip-directories (list (string-append
                                  "share/OpenFOAM-" ,(version-major version)
                                  "/platforms/linux64GccDPInt32Opt/bin")
				 (string-append
                                  "share/OpenFOAM-" ,(version-major version)
                                  "/platforms/linux64GccDPInt32Opt/lib"))

       #:modules ((ice-9 ftw)
                  (ice-9 regex)
		  (ice-9 string-fun)
		  (srfi srfi-1)
                  (guix build gnu-build-system)
                  (guix build utils))

       #:phases
       (modify-phases
	   %standard-phases
	 (add-after 'unpack 'rename-build-directory
	   (lambda _
	     (chdir "..")
	     ;; Use 'OpenFOAM-version' convention to match the file
	     ;; name expectations in the build phase.
	     (let ((unpack-dir (string-append
		  		(getcwd) "/OpenFOAM-"
				,(string-replace-substring version "." "-")))
		   (build-dir (string-append
		  	       (getcwd) "/OpenFOAM-"
			       ,(version-major version))))
	       (rename-file unpack-dir build-dir) ; rename build directory
	       (chdir (basename build-dir))) ; move to build directory
	     #t))
	 (add-after 'rename-build-directory 'make-files-writable-for-tests
	   (lambda _
	     (for-each make-file-writable (find-files "test"))
	     (for-each make-file-writable (find-files "tutorials"))
	     #t))
	 (add-after 'make-files-writable-for-tests 'patch-SHELL
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
		(string-append "export GNUPLOT="
			       (assoc-ref %build-inputs "gnuplot")
			       "/bin/gnuplot")))
	     #t))
	 (delete 'configure)             ; no configure phase
	 (replace 'build
	   (lambda _
	     (letrec* ((libraries '("boost"
				    "cgal"
				    "gmp"
				    "metis"
				    "mpfr"
				    "pt-scotch32"
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
	       (setenv "PT_SCOTCH32VERSION" ,(package-version pt-scotch32))
	       (setenv "METISVERSION" ,(package-version metis))
	       (setenv "OPENMPIVERSION" ,(package-version openmpi))
	       (setenv "PARAVIEWVERSION" ,(package-version paraview-5.9))
	       ;; set variable to pass extra 'rpath' arguments to linker
	       (setenv "LDFLAGS"
		       (string-append
			"-Wl,"
			rpaths
			"-rpath=" %output "/share/OpenFOAM-"
			,(version-major version)
			"/platforms/linux64GccDPInt32Opt/lib,"
			"-rpath=" %output "/share/OpenFOAM-"
			,(version-major version)
			"/platforms/linux64GccDPInt32Opt/lib/dummy,"
			"-rpath=" %output "/share/OpenFOAM-"
			,(version-major version)
			"/platforms/linux64GccDPInt32Opt/lib/paraview-"
			,(version-major+minor (package-version paraview-5.9)))))
	     
	     ;; compile OpenFOAM libraries and applications
	     (invoke "bash" "-c"
		     (format #f
		      	     "source ./etc/bashrc && ./Allwmake -j~a"
		      	     (parallel-job-count)))))
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
	       (("\\$PT_SCOTCH32_ROOT") (getenv "PT_SCOTCH32_ROOT")))
	     (substitute* "etc/config.sh/scotch"
	       (("\\$PT_SCOTCH32VERSION") (getenv "PT_SCOTCH32VERSION")))
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
	 (add-after 'build 'cleanup
	   ;; Avoid unncessary, voluminous object and dep files.
	   (lambda _
	     (delete-file-recursively
	      "platforms/linux64GccDPInt32Opt/src")
	     (delete-file-recursively
	      "platforms/linux64GccDPInt32OptSYSTEMOPENMPI")
	     (for-each delete-file (find-files "." "\\.o$"))
	     #t))
	 (replace 'check
	   (lambda _
	     (with-directory-excursion "test"
	       (invoke "bash" "-x" "-c"
		       (format #f
			       "source ../etc/bashrc && ./Allrun -j~a"
			       (parallel-job-count))))
	     ;; too many tutorials are failing at the moment
	     ;;(with-directory-excursion "tutorials"
	     ;;  (invoke "bash" "-c" "source ../etc/bashrc && ./Alltest"))
	     #t))
	 (replace 'install
	   (lambda _
	     ;; use 'OpenFOAM-version' convention
	     (let ((install-dir (string-append
				 %output "/share/OpenFOAM-"
				 ,(version-major version))))
	       (mkdir-p install-dir)     ; create install directory
	       ;; move contents of build directory to install directory
	       (copy-recursively "." install-dir))))
	 (add-after 'install 'add-symbolic-link
	   (lambda _
	     ;; add symbolic link for standard 'bin' directory
	     (symlink
	      (string-append "./share/OpenFOAM-"
		      	     ,(version-major version)
		      	     "/platforms/linux64GccDPInt32Opt/bin")
	      (string-append %output "/bin"))
	     ;; add symbolic link for standard 'lib' directory
	     (symlink
	      (string-append "./share/OpenFOAM-"
		      	     ,(version-major version)
		      	     "/platforms/linux64GccDPInt32Opt/lib")
	      (string-append %output "/lib"))
	     #t))
	 )))))

openfoam-10
