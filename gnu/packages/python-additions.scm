(define-module (gnu packages python-additions)
  #:use-module ((guix licenses)
                #:prefix license:)
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
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:autoload (guix git)
  (git-checkout))

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
     (list
      #:tests? #f
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
    (native-inputs (list python-numpy python-pytest python-pytest-cov
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
     (list
      #:tests? #f
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
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (native-inputs (list python-prompt-toolkit
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
     (list
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'sanity-check))))
    (propagated-inputs (list python-argcomplete
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

(define-public python-pyarrow-with-dataset
  (package
    (inherit apache-arrow)
    (name "python-pyarrow")
    (build-system python-build-system)
    (arguments
     '(#:tests? #f ;XXX There are no tests in the "python" directory
       #:phases (modify-phases %standard-phases
                  (delete 'build) ;XXX the build is performed again during the install phase
                  (add-after 'unpack 'enter-source-directory
                    (lambda _
                      (chdir "python")))
                  (add-after 'unpack 'make-git-checkout-writable
                    (lambda _
                      (for-each make-file-writable
                                (find-files "."))))
                  (add-before 'install 'set-PYARROW_WITH_PARQUET
                    (lambda _
                      (setenv "PYARROW_BUNDLE_ARROW_CPP_HEADERS" "0")
                      (setenv "PYARROW_WITH_PARQUET" "1")
                      (setenv "PYARROW_WITH_DATASET" "1"))))))
    (propagated-inputs (list (list apache-arrow "lib")
                             (list apache-arrow "include") python-numpy
                             python-pandas python-six))
    (native-inputs (list cmake-minimal
                         pkg-config
                         python-cython
                         python-pytest
                         python-pytest-runner
                         python-setuptools-scm))
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
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "numpy-stl" version))
       (sha256
        (base32 "0yjb74vjglgs5sn36fji8x6jgad5vndn4qqs15zxapa45wcj1j9n"))))
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

(define-public python-type-enforced
  (package
    (name "python-type-enforced")
    (version "0.0.15")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "type_enforced" version))
       (sha256
        (base32 "1zdk6grq0q0ipqgmhpdd8b9bd4f06kdyn9ipvx5dqm7qjc00amnp"))))
    (build-system pyproject-build-system)
    (home-page "https://github.com/connor-makowski/type_enforced")
    (synopsis "Enforce types in python functions.")
    (description
     "type_enforcer contains a basic Enforcer wrapper that can be used to enforce most basic python typing hints.

type_enforcer currently supports all single level python types, single level class instances and classes themselves. For example, you can force an input to be an int or an instance of the self defined MyClass, but not a vector of the format list(int). In this case, when using type_enforcer, you would only pass the format list and would not validate that the content of the list was indeed integers.")
    (license license:bsd-3)))

(define-public python-drawsvg
  (package
    (name "python-drawsvg")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/cduck/drawsvg/archive/tags/"
                           version ".tar.gz"))
       (sha256
        (base32 "07z5rfbgr4pfmbn65bhhn5km35r244p9rpkmgx1cy575pqpcryay"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:tests? #f))
    (native-inputs (list cairo python-ipywidgets))
    (home-page "https://github.com/cduck/drawsvg")
    (synopsis
     "Programmatically generate SVG (vector) images, animations, and interactive Jupyter widgets")
    (description
     "A Python 3 library for programmatically generating SVG images and animations that can render and display your drawings in a Jupyter notebook or Jupyter lab.

Most common SVG tags are supported and others can easily be added by writing a small subclass of DrawableBasicElement or DrawableParentElement. Nearly all SVG attributes are supported via keyword args (e.g. Python keyword argument fill_opacity=0.5 becomes SVG attribute fill-opacity=\"0.5\").

An interactive Jupyter notebook widget, drawsvg.widgets.DrawingWidget, is included that can update drawings based on mouse events. The widget does not yet work in Jupyter lab.")
    (license license:asl2.0)))
