(define-module (gnu packages python-additions)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages adns)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages django)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages docker)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages file)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gsasl)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages jupyter)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages man)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages openstack)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages regex)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages search)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages base)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages serialization)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:autoload   (guix git) (git-checkout))

(define-public python-pyudorandom
  (package
    (name "python-pyudorandom")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyudorandom" version))
       (sha256
        (base32 "0mbpqgl8klq68vfcddr8ancxwpqg3zvjksw7gyf5zhbh04x0j2pk"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
               (delete 'sanity-check))))
    (home-page "UNKNOWN")
    (synopsis "Generate pseudorandom numbers by using algebra")
    (description "Generate pseudorandom numbers by using algebra")
    (license #f)))

(define-public python-accumulation-tree
  (package
    (name "python-accumulation-tree")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "accumulation_tree" version))
       (sha256
        (base32 "0hbi85l9jw3f3ic476qhmc0v4r42jsx40ndgs0k23a2npa1z1q0d"))))
    (build-system python-build-system)
    (native-inputs (list python-cython))
    (home-page "https://github.com/tkluck/accumulation_tree")
    (synopsis
     "Red/black tree with support for fast accumulation of values in a key range")
    (description
     "Red/black tree with support for fast accumulation of values in a key range")
    (license license:expat)))

(define-public python-tdigest
  (package
    (name "python-tdigest")
    (version "0.5.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tdigest" version))
       (sha256
        (base32 "03jd6skj12063w2kwclhss6014bc7d749na3dxw62iq2mj5zrvwd"))))
    (build-system python-build-system)
    (propagated-inputs (list python-accumulation-tree python-pyudorandom))
    (native-inputs
     (list python-numpy
           python-pytest
           python-pytest-cov
           python-pytest-timeout))
    (home-page "https://github.com/CamDavidsonPilon/tdigest")
    (synopsis "T-Digest data structure")
    (description "T-Digest data structure")
    (license license:expat)))

(define-public python-ttictoc
  (package
    (name "python-ttictoc")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "ttictoc" version))
       (sha256
        (base32 "1nb436zyidwrqzzfz0r55s9nk05jjy7kysbiglzv36gjz8sabq4s"))))
    (build-system python-build-system)
    (home-page "https://github.com/hector-sab/ttictoc")
    (synopsis "Time parts of your code easily.")
    (description "Time parts of your code easily.")
    (license license:expat)))

(define-public python-sphinxcontrib-autoyaml
  (package
    (name "python-sphinxcontrib-autoyaml")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinxcontrib-autoyaml" version))
       (sha256
	(base32 "1il2d1725x5z19yggdspzz1j2d8gxpbxl83x00h7p0g1ybjwxs3v"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
	       (delete 'sanity-check))))
    (native-inputs (list python-ruamel.yaml python-sphinx))
    (propagated-inputs (list python-ruamel.yaml))
    (home-page "https://github.com/Jakski/sphinxcontrib-autoyaml")
    (synopsis
     "Sphinx autodoc extension for documenting YAML files from comments")
    (description
     "Sphinx autodoc extension for documenting YAML files from comments")
    (license license:expat)))

(define-public python-iapws
  (package
    (name "python-iapws")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "iapws" version))
       (sha256
        (base32 "0ls1prmm4d9zxpjr196chvs1gjppmf531aklq1r9vx6zmsn8a4kq"))))
    (build-system python-build-system)
    (native-inputs (list python-scipy))
    (home-page "https://github.com/jjgomera/iapws")
    (synopsis
     "Python implementation of standards from The InternationalAssociation for the Properties of Water and Steam")
    (description
     "Python implementation of standards from The InternationalAssociation for the
Properties of Water and Steam")
    (license #f)))

(define-public python-pint
  (package
    (name "python-pint")
    (version "0.18")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Pint" version))
       (sha256
	(base32 "00d8icpj59z86ahkvj5bck3w00w4s6zrvimbnzz534169j4cwjwc"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
	       (delete 'sanity-check))))
    (native-inputs (list python-setuptools-scm))
    (home-page "https://github.com/hgrecco/pint")
    (synopsis "Physical quantities module")
    (description "Physical quantities module")
    (license license:bsd-3)))

(define-public python-sphinx-autodoc-defaultargs
  (package
    (name "python-sphinx-autodoc-defaultargs")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "sphinx-autodoc-defaultargs" version))
       (sha256
	(base32 "1qsvpv9xrx47k6vprrmr5jyf5fz6f2ink51zk8g1y32i8fndj75i"))))
    (build-system python-build-system)
    (propagated-inputs (list python-sphinx))
    (native-inputs
     (list
      python-setuptools-scm
      python-dataclasses
      python-pytest
      python-sphinx
      python-sphobjinv
      python-typing-extensions))
    (home-page "https://github.com/zwang123/sphinx-autodoc-defaultargs")
    (synopsis
     "Automatic generation of default arguments for the Sphinx autodoc extension.")
    (description
     "Automatic generation of default arguments for the Sphinx autodoc extension.")
    (license license:expat)))

(define-public python-questionary
  (package
    (name "python-questionary")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "questionary" version))
       (sha256
	(base32 "143dji1lyb193vfvcfjcjdzw4jvfnvykdsgfjy6x89nfxkpkl3b0"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
	       (delete 'sanity-check))))
    (native-inputs
     (list python-prompt-toolkit
	   python-sphinx
	   python-sphinx-autobuild
	   python-sphinx-autodoc-typehints
	   python-sphinx-copybutton
	   python-sphinx-rtd-theme))
    (home-page "https://github.com/tmbo/questionary")
    (synopsis "Python library to build pretty command line user prompts ⭐️")
    (description "Python library to build pretty command line user prompts ⭐️")
    (license license:expat)))

(define-public python-decli
  (package
    (name "python-decli")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "decli" version))
       (sha256
	(base32 "1bb3simdyr842sci5hj2iicz44n68jl5axhccff82p576i8fbkgj"))))
    (build-system python-build-system)
    (home-page "")
    (synopsis "Minimal, easy-to-use, declarative cli tool")
    (description "Minimal, easy-to-use, declarative cli tool")
    (license license:expat)))

(define-public python-commitizen
  (package
    (name "python-commitizen")
    (version "2.21.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "commitizen" version))
       (sha256
	(base32 "0z7hqkwmjckpx6z8am0aarrbcbv086v8q0ic8b9d7lkrsvcsizb4"))))
    (build-system python-build-system)
    (arguments
     (list #:tests? #f
           #:phases
           #~(modify-phases %standard-phases
	       (delete 'sanity-check))))
    (propagated-inputs
     (list python-argcomplete
	   python-colorama
	   python-decli
	   python-jinja2
	   python-packaging
	   python-prompt-toolkit
	   python-pyyaml
	   python-questionary
	   python-termcolor
	   python-tomlkit
	   python-typing-extensions))
    (home-page "https://github.com/commitizen-tools/commitizen")
    (synopsis "Python commitizen client tool")
    (description "Python commitizen client tool")
    (license license:expat)))

(define-public python-plac
  (package
    (name "python-plac")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "plac" version))
       (sha256
	(base32 "1x9pn6903cawzshxvy7qxbjszl2wl473p0mn2dr7wz66kjglq6n9"))))
    (build-system python-build-system)
    (arguments
     (list #:phases
	   #~(modify-phases %standard-phases
	       (delete 'sanity-check))))
    (home-page "https://github.com/ialbert/plac")
    (synopsis "The smartest command line arguments parser in the world")
    (description "The smartest command line arguments parser in the world")
    (license license:bsd-3)))

(define-public python-tefw-ml
  (package
    (name "python-tefw-ml")
    (version "v1.3.1")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://gitlab+deploy-token-280:wxLe5fs3dhSaxxz2ZYvM@gitlab.ost.ch/sciceg/hitachiinovazosen/tefw-ml.git")
		    (commit version)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"1i0x7lmf22dyq72mzc6vi4gwmp7ysnj3irvpnjin7284fbmn0ly0"))))
    (build-system python-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
	 (replace 'check
	   (lambda* (#:key tests? #:allow-other-keys)
	     (when tests?
	       (invoke "python" "-m" "unittest")))))))
    (native-inputs (list
		    python-numpy
		    python-scipy
		    python-matplotlib))
    (propagated-inputs (list
			python-pyaml
			python-pyarrow-with-dataset
			python-pandas
			python-tdigest
			python-scikit-learn
			;; testing
			python-hypothesis
			;; scripts
			python-ttictoc
			python-plac
			python-colorama
			python-seaborn))
    (home-page "https://gitlab.ost.ch/sciceg/hitachiinovazosen/tefw-ml")
    (synopsis
     "Library for the data-driven modelling and monitoring of boiler signals")
    (description
     "Library for the data-driven modelling and monitoring of boiler signals")
    (license license:gpl3)))

(define-public python-pyarrow-with-dataset
  (package
    (inherit apache-arrow)
    (name "python-pyarrow-with-dataset")
    (build-system python-build-system)
    (arguments
     '(#:tests? #f          ; XXX There are no tests in the "python" directory
       #:phases
       (modify-phases %standard-phases
	 (delete 'build) ; XXX the build is performed again during the install phase
	 (add-after 'unpack 'enter-source-directory
	   (lambda _ (chdir "python")))
	 (add-after 'unpack 'make-git-checkout-writable
	   (lambda _
	     (for-each make-file-writable (find-files "."))))
	 (add-before 'install 'patch-cmake-variables
	   (lambda* (#:key inputs #:allow-other-keys)
	     ;; Replace cmake locations with hardcoded guix links for the
	     ;; underlying C++ library and headers.  This is a pretty awful
	     ;; hack.
	     (substitute* "cmake_modules/FindParquet.cmake"
	       (("# Licensed to the Apache Software Foundation" m)
		(string-append "set(PARQUET_INCLUDE_DIR \""
			       (assoc-ref inputs "apache-arrow:include")
			       "/share/include\")\n" m))
	       (("find_package_handle_standard_args" m)
		(string-append "set(PARQUET_LIB_DIR \""
			       (assoc-ref inputs "apache-arrow:lib")
			       "/lib\")\n" m)))))
	 (add-before 'install 'patch-parquet-library
	   (lambda _
	     (substitute* "CMakeLists.txt"
	       (("parquet_shared") "parquet"))))
	 (add-before 'install 'set-PYARROW_WITH_PARQUET
	   (lambda _
	     (setenv "PYARROW_WITH_PARQUET" "1")
	     (setenv "PYARROW_WITH_DATASET" "1"))))))
    (propagated-inputs
     `(("apache-arrow:lib" ,apache-arrow "lib")
       ("apache-arrow:include" ,apache-arrow "include")
       ("python-numpy" ,python-numpy)
       ("python-pandas" ,python-pandas)
       ("python-six" ,python-six)))
    (native-inputs
     `(("cmake" ,cmake-minimal)
       ("pkg-config" ,pkg-config)
       ("python-cython" ,python-cython)
       ("python-pytest" ,python-pytest)
       ("python-pytest-runner" ,python-pytest-runner)
       ("python-setuptools-scm" ,python-setuptools-scm)))
    (outputs '("out"))
    (home-page "https://arrow.apache.org/docs/python/")
    (synopsis "Python bindings for Apache Arrow")
    (description
     "This library provides a Pythonic API wrapper for the reference Arrow C++
implementation, along with tools for interoperability with pandas, NumPy, and
other traditional Python scientific computing packages.")
    (license license:asl2.0)))

(define-public python-numpy-stl
  (package
    (name "python-numpy-stl")
    (version "2.17.1")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "numpy-stl" version))
              (sha256
               (base32
		"0yjb74vjglgs5sn36fji8x6jgad5vndn4qqs15zxapa45wcj1j9n"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (propagated-inputs (list python-numpy python-utils python-six))
    (home-page "https://github.com/WoLpH/numpy-stl/")
    (synopsis
     "Library to make reading, writing and modifying both binary and ascii STL files easy.")
    (description
     "Library to make reading, writing and modifying both binary and ascii STL files
easy.")
    (license license:bsd-3)))

(define-public fmtlib-4.1.0
  (package
    (name "fmtlib")
    (version "4.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fmtlib/fmt/releases/download/"
                    version "/fmt-" version ".zip"))
              (sha256
               (base32
                "1swyqw3dn2vx5sw2yh5vk0vrvrkp7fv07cj4272yxl5rrq1byjcx"))))
    (build-system cmake-build-system)
    (native-inputs (list unzip))
    (home-page "https://fmt.dev/")
    (synopsis
     "A modern formatting library")
    (description
     "{fmt} is an open-source formatting library providing a fast and safe alternative to C stdio and C++ iostreams.")
    (license license:bsd-3)))

(define-public fmtlib
  (package
    (inherit fmtlib-4.1.0)
    (name "fmtlib")
    (version "9.1.0")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/fmtlib/fmt/releases/download/"
                    version "/fmt-" version ".zip"))
              (sha256
               (base32
                "15n9yi6xzzs7g9rm87kg8y5yhl2zrqj3bjr845saa63f6swlrsyc"))))))

 (define-public if97
   (package
     (name "if97")
     (version "2.1.3")
     (source (origin
               (method url-fetch)
               (uri (string-append
		     "https://github.com/CoolProp/IF97/archive/refs/tags/v"
		     version ".tar.gz"))
               (sha256
		(base32
                 "07vd7z09rm6fyyszalv9lm1qr3kvry90rhf9hm83myzf1b5ah92x"))))
     (build-system cmake-build-system)
     (arguments
      `(#:build-type "Release"
	#:configure-flags (list "-DIF97_HEADER_MODULE:BOOL=ON")
	#:tests? #f))
     (home-page "https://github.com/CoolProp/IF97")
     (synopsis
      "Open-source C++ implementation of the IAPWS-IF97 equations")
     (description
      "Open-source C++ implementation of the IAPWS-IF97 equations")
     (license license:asl2.0)))

(define-public rapidjson-latest
  (package
    (inherit rapidjson)
    (name "rapidjson-latest")
    (version "06d58b9e848c650114556a23294d0b6440078c61")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/Tencent/rapidjson.git")
		    (commit version)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"05973r7839mdfd3hz3nfbnjybajiqwd4jfnvdy08jx0i495062g7"))))))

(define-public refprop-headers
  (package
    (name "refprop-headers")
    (version "828e8741af0697dc35f9447b1b66ec2aa11a881a")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/CoolProp/REFPROP-headers.git")
		    (commit version)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"0cg48wvh8pqbrf4zm52bhzz3ddi2jrn3bzd0xc5fjpw7pa855gzc"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
	  ;; append an install target to the CMakeLists.txt file (ugly hack)
	  (add-after 'unpack 'add-install-target
	    (lambda _
	      (substitute* "CMakeLists.txt"
		(("(.*)" all)
		 (string-append all "\n" "install(FILES REFPROP_lib.h DESTINATION include)\n")))
	      #t)))))
    (home-page "https://github.com/CoolProp/REFPROP-headers")
    (synopsis
     "This is a tiny repository that contains header files for the REFPROP fluid property library. The header files should work with both C++ and C, but they have only been tested with C++ so far.")
    (description
     "This is a tiny repository that contains header files for the REFPROP fluid property library. The header files should work with both C++ and C, but they have only been tested with C++ so far.")
    (license license:asl2.0)))

(define-public python-coolprop
  (package
    (name "python-coolprop")
    (version "6.4.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
		    "https://github.com/CoolProp/CoolProp/archive/refs/tags/v"
		    version ".tar.gz"))
              (sha256
               (base32
                "101rnzljf0h2n636a0lfdipvhn83jdqs3frfb14fcg1y2icz7d0r"))))
    (build-system python-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
	  (add-after 'unpack 'remove-externals
	    (lambda _
	      (delete-file-recursively "externals")))
	  (add-after 'unpack 'fix-rapidjson-includes
	    (lambda _
	      (substitute* "include/rapidjson_include.h"
		(("externals/rapidjson/include/rapidjson/(.*).h" _ filename)
		 (string-append "rapidjson/" filename ".h")))
	      #t))
	  (add-after 'unpack 'fix-eigen-includes
	    (lambda _
	      (substitute* (list "include/CoolPropFluid.h"
				 "include/MatrixMath.h"
				 "include/Ancillaries.h"
				 "include/IncompressibleFluid.h"
				 "src/Backends/Tabular/BicubicBackend.h"
				 "src/ODEIntegrators.cpp"
				 "src/Backends/Helmholtz/MixtureDerivatives.h"
				 "src/Backends/Incompressible/IncompressibleFluid.cpp"
				 "include/TestObjects.h"
				 "src/Tests/TestObjects.cpp")
		(("Eigen/Core") "eigen3/Eigen/Core"))
	      (substitute* (list "src/Solvers.cpp"
				 "src/Backends/PCSAFT/PCSAFTBackend.cpp")
		(("Eigen/Dense") "eigen3/Eigen/Dense"))
	      (substitute* (list "include/PolyMath.h"
				 "src/CPnumerics.cpp"
				 "src/PolyMath.cpp")
		(("unsupported/Eigen/Polynomials") "eigen3/unsupported/Eigen/Polynomials"))
	      #t))
	  (add-after 'unpack 'fix-if97-includes
	    (lambda _
	      ;; some files are encoded in ISO-8859-1
	      (with-fluids ((%default-port-encoding "ISO-8859-1"))
		(substitute* (list "src/Backends/IF97/IF97Backend.h"
				   "src/HumidAirProp.cpp")
		  (("externals/IF97/IF97.h") "IF97.h")))
	      #t))
	  (add-after 'unpack 'fix-REFPROP-includes
	    (lambda _
	      (substitute* "src/Backends/REFPROP/REFPROPMixtureBackend.cpp"
		(("externals/REFPROP-headers/REFPROP_lib.h" _) "REFPROP_lib.h"))))
	  (add-after 'unpack 'dont-copy-catch2-header-file
	    (lambda _
	      (substitute* "dev/generate_headers.py"
		(("shutil.copy2.*$") ""))
	      #t))
	  (add-after 'unpack 'do-not-copy-from-externals-folder
	    (lambda _
	      (substitute* "wrappers/Python/setup.py"
		(("^.*externals/fmtlib/fmt.*$" _) ""))))
	  (replace 'build
	    (lambda _
	      (with-directory-excursion "wrappers/Python"
		(invoke "python" "setup.py" "build"))))
	  (replace 'install
	    (lambda _
	      (with-directory-excursion "wrappers/Python"
		(invoke "python" "setup.py" "install"
			(string-append "--prefix=" #$output)
			"--no-compile"
			"--single-version-externally-managed"
                        "--root=/"))))
	  (delete 'check))))
    (native-inputs
     (list cmake-minimal
	   python
	   python-cython
	   fmtlib-4.1.0
	   rapidjson-latest
	   eigen
	   catch2
	   if97
	   msgpack
	   refprop-headers))
    (home-page "http://www.coolprop.org")
    (synopsis "Open-source thermodynamic and transport properties database")
    (description "Open-source thermodynamic and transport properties database")
    (license license:asl2.0)))

