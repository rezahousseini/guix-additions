(define-module (rhou packages nitro)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages adns)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bioinformatics)
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
  #:use-module (gnu packages engineering)
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
  #:use-module (gnu packages libusb)
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
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages search)
  #:use-module (gnu packages security-token)
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
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system trivial)
  #:use-module (srfi srfi-26)
  #:autoload   (guix git) (git-checkout))

(define-public python-nkdfu
  (package
   (name "python-nkdfu")
   (version "0.2")
   (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Nitrokey/nkdfu")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1252gdpbfxd4bfzr6wqzcfvc0lyr8kkx1293s4b1cwqfxv1gbp0c"))))
   (build-system pyproject-build-system)
   (native-inputs (list python-flit))
   (propagated-inputs (list python-fire
                            python-intelhex
                            python-libusb1
                            python-tqdm))
   (home-page "https://github.com/Nitrokey/nkdfu")
   (synopsis "Python tool for Nitrokeys' firmware update")
   (description "nkdfu is a Python DFU tool for updating Nitrokeys' firmware. Currently supports Nitrokey Pro only.")
   (license license:gpl2)))

(define-public python-tlv8
  (package
    (name "python-tlv8")
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/jlusiardi/tlv8_python")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q25y5lz7cigfk7l30rdm2z8as8662pzd8ki5vvs1c0saqq72zhv"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest))
    (home-page "https://github.com/jlusiardi/tlv8_python")
    (synopsis
     "Python module to handle type-length-value (TLV) encoded data")
    (description
     "Python module to handle type-length-value (TLV) encoded data 8-bit type, 8-bit length, and N-byte value as described within the Apple HomeKit Accessory Protocol Specification Non-Commercial Version Release R2.")
    (license license:asl2.0)))

(define-public python-podman
  (package
    (name "python-podman")
    (version "5.7.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/containers/podman-py")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bxw3fabbdnsb6r1ld2nj67j90cqvjvaakkpj4vp21851fmy0rp4"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-requests
                             python-urllib3))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest
                         python-coverage
                         python-requests-mock
                         python-fixtures))
    (arguments (list #:tests? #f)) ;; tests expect a fhs compatible filesystem
    (home-page "https://github.com/containers/podman-py")
    (synopsis "Python bindings for Podman's RESTful API")
    (description "This python package is a library of bindings to use the RESTful API of Podman. It is currently under development and contributors are welcome!")
    (license license:asl2.0)))

(define-public python-nethsm
  (package
    (name "python-nethsm")
    (version "2.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Nitrokey/nethsm-sdk-py")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1361xjasf54vs4zwz685wb9z0iyr7nwjcnxkbg81gc16lhiz5af2"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-certifi
                             python-cryptography
                             python-pycryptodome
                             python-dateutil
                             python-typing-extensions
                             python-urllib3))
    (native-inputs (list python-flit-core
                         python-pytest
                         python-pytest-cov
                         python-docker
                         python-requests
                         python-podman))
    (arguments (list #:tests? #f)) ;; tests with docker fail
    (home-page "https://docs.nitrokey.com/nethsm/")
    (synopsis "Python Library to manage NetHSM(s).")
    (description "Python Library to manage @code{NetHSM(s}).")
    (license license:asl2.0)))

(define-public python-nitrokey-sdk
  (package
    (name "python-nitrokey-sdk")
    (version "0.4.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Nitrokey/nitrokey-sdk-py")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1s68jy284fi33af09aj80pndsn1x9gxx253hgi91xnqyg2lhv4yx"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-crcmod
                             python-cryptography
                             python-fido2
                             python-hidapi
                             python-protobuf
                             python-pyserial
                             python-requests                            
                             python-tlv8))
    (native-inputs (list python-poetry-core))
    (home-page "https://github.com/Nitrokey/nitrokey-sdk-py")
    (synopsis "Python SDK for Nitrokey devices ")
    (description "The Nitrokey Python SDK can be used to use and configure Nitrokey devices.")
    (license license:asl2.0)))

(define-public python-click-8.3
  (package
    (inherit python-click)
    (version "8.3.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/pallets/click")
              (commit version)))
       (file-name (git-file-name "python-click" version))
       (sha256
        (base32 "041w6s8w11za2jlws7sxvrcfmi0bvr354nq74wyb66gsk908idii"))))))

(define-public python-pynitrokey
  (package
    (name "python-pynitrokey")
    (version "0.11.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Nitrokey/pynitrokey")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "009r2c60krm29rlaf5jvpiv534rp1y3ai5mgl9wcfblrdq32913n"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-poetry-core
                         python-pytest))
    (propagated-inputs (list python-cffi
                             python-click-8.3
                             python-cryptography
                             python-fido2
                             python-hidapi
                             python-intelhex
                             python-libusb1
                             python-nethsm
                             python-nitrokey-sdk
                             python-nkdfu
                             python-pyusb
                             python-pyserial
                             python-requests
                             python-semver
                             python-tqdm
                             python-tlv8))
    (arguments
     (list
      #:tests? #f ;; need hardware device
      #:phases #~(modify-phases %standard-phases
                   (add-before 'check 'set-home
                     (lambda _
                       (setenv "HOME" "/tmp"))))))
    (home-page "https://docs.nitrokey.com/software/nitropy/")
    (synopsis "Python client for Nitrokey devices.")
    (description "A command line interface for the Nitrokey FIDO2, Nitrokey Start, Nitrokey 3 and NetHSM.")
    (license license:asl2.0)))

python-pynitrokey
