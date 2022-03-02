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
  #:use-module (srfi srfi-26))

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
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "sphinxcontrib-autoyaml" version))
        (sha256
          (base32 "1ghwyjl4414sn7d4z8bqfjy526d54hb1zfvlrgbfrnml61rcb3ri"))))
    (build-system python-build-system)
    (arguments
      (list #:tests? #f
            #:phases
            #~(modify-phases %standard-phases
                (delete 'sanity-check))))
    (propagated-inputs (list python-ruamel.yaml python-sphinx))
    (home-page "https://github.com/Jakski/sphinxcontrib-autoyaml")
    (synopsis
      "Sphinx autodoc extension for documenting YAML files from comments")
    (description
      "Sphinx autodoc extension for documenting YAML files from comments")
    (license license:expat)))
