(define-module (gnu packages nitro)
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
  ;;#:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:autoload   (guix git) (git-checkout))


(define-public python-nkdfu
  (package
   (name "python-nkdfu")
   (version "0.2")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "nkdfu" version))
     (sha256
	  (base32 "1y7m17k4l1ayigar6kr8xnb18yspa6gxwg4lns2p5i42sgfpapzj"))))
   (build-system pyproject-build-system)
   (arguments (list #:tests? #f))
   (native-inputs (list python-flit))
   (propagated-inputs (list python-fire python-intelhex python-libusb1
                            python-tqdm))
   (home-page "https://github.com/Nitrokey/nkdfu")
   (synopsis "DFU tool for updating Nitrokeys' firmware")
   (description "DFU tool for updating Nitrokeys firmware")
   (license license:gpl2)))

(define-public python-oath
  (package
   (name "python-oath")
   (version "1.4.4")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "oath" version))
     (sha256
	  (base32 "02qwzrsw3b6wv2gmlkrglznawxfa3lhh1s9ya99kykic1z920sxx"))))
   (build-system pyproject-build-system)
   (native-inputs (list python-setuptools
                        python-wheel))
   (home-page "https://github.com/bdauvergne/python-oath")
   (synopsis
    "Python implementation of the three main OATH specifications: HOTP, TOTP and OCRA")
   (description
    "Python implementation of the three main OATH specifications: HOTP, TOTP and OCRA")
   (license license:bsd-3)))

(define-public python-bincopy
  (package
   (name "python-bincopy")
   (version "19.1.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "bincopy" version))
     (sha256
	  (base32 "0mnj2zyl132lz3vccpf6y3qpxhk67lhr4gz7sk7v91j462nn8db8"))))
   (build-system pyproject-build-system)
   (propagated-inputs (list python-argparse-addons python-humanfriendly
                            python-pyelftools))
   (native-inputs (list python-setuptools
                        python-wheel))
   (home-page "https://github.com/eerimoq/bincopy")
   (synopsis
    "Mangling of various file formats that conveys binary information (Motorola S-Record, Intel HEX and binary files).")
   (description
    "Mangling of various file formats that conveys binary information (Motorola
S-Record, Intel HEX and binary files).")
   (license license:expat)))

(define-public python-click-command-tree
  (package
    (name "python-click-command-tree")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "click-command-tree" version))
       (sha256
	    (base32 "184r8q0n1aly45yp67m1zj2hlzzzw6kh56wl57yz5pvlc4w9rfpi"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click))
    (native-inputs (list python-setuptools
                         python-wheel))
    (home-page "https://github.com/whwright/click-command-tree")
    (synopsis "click plugin to show the command tree of your CLI")
    (description "click plugin to show the command tree of your CLI")
    (license license:expat)))

(define-public python-click-option-group
  (package
    (name "python-click-option-group")
    (version "0.5.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "click-option-group" version))
       (sha256
	    (base32 "0xz73kgavgq8zxrfmlb2fly9l1i55ds4752h718cq61mhw1ngl4p"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-click))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-coverage
                         python-coveralls
                         python-pytest
			             python-pytest-cov))
    (home-page "https://github.com/click-contrib/click-option-group")
    (synopsis "Option groups missing in Click")
    (description "Option groups missing in Click")
    (license license:expat)))

(define-public python-hexdump
  (package
   (name "python-hexdump")
   (version "3.3")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "hexdump" version ".zip"))
     (sha256
	  (base32 "1nr0dy3m8grdmd2hp3ym6x8vv9yki8zfgbba6vwy7b0n1hxs90fp"))))
   (build-system python-build-system)
   (native-inputs (list unzip))
   (arguments (list #:tests? #f ;; no tests packaged
                    #:phases #~(modify-phases %standard-phases
                                              (add-before 'build 'change-dir
                                                          (lambda _
                                                            ;; not clear why??
                                                            (chdir ".."))))))
   (home-page "https://bitbucket.org/techtonik/hexdump/")
   (synopsis "dump binary data to hex format and restore from there")
   (description "dump binary data to hex format and restore from there")
   (license license:expat)))

(define-public python-oscrypto
  (package
   (name "python-oscrypto")
   (version "1.3.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "oscrypto" version))
     (sha256
	  (base32 "1927dmhfqq6g3ycyfl9khmifdmwaxmmabk5p3lr0hdsvrdcyypvg"))))
   (build-system pyproject-build-system)
   ;; no tests packaged
   (arguments (list #:tests? #f))
   (propagated-inputs (list python-asn1crypto))
   (native-inputs (list python-setuptools
                        python-wheel
                        python-pytest))
   (home-page "https://github.com/wbond/oscrypto")
   (synopsis
    "TLS (SSL) sockets, key generation, encryption, decryption, signing, verification and KDFs using the OS crypto libraries. Does not require a compiler, and relies on the OS for patching. Works on Windows, OS X and Linux/BSD.")
   (description
    "TLS (SSL) sockets, key generation, encryption, decryption, signing, verification
and KDFs using the OS crypto libraries.  Does not require a compiler, and relies
on the OS for patching.  Works on Windows, OS X and Linux/BSD.")
   (license license:expat)))

(define-public python-sly
  (package
    (name "python-sly")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (string-append
		            "https://github.com/dabeaz/sly/archive/tags/"
		            version ".tar.gz"))
	          (sha256
	           (base32 "183xngwc34hkbsla9agiv7f8mf44773d76q39n95ifmbnxppisgy"))))
    (build-system pyproject-build-system)
    ;;(arguments (list #:tests? #f))
    (propagated-inputs (list python-ruamel.yaml))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest))
    (home-page "https://github.com/dabeaz/sly")
    (synopsis "\"SLY - Sly Lex Yacc\"")
    (description "\"SLY - Sly Lex Yacc\"")
    (license license:expat)))

(define-public python-ruamel.yaml.clib-0.2.7
  (package
    (inherit python-ruamel.yaml.clib)
    (version "0.2.7")
    (source
     (origin
       ;; pypi release code has cythonized code without corresponding source.
       (method hg-fetch)
       (uri (hg-reference
             (url "http://hg.code.sf.net/p/ruamel-yaml-clib/code")
             (changeset version)))
       (file-name (string-append "python-ruamel.yaml.clib-" version "-checkout"))
       (sha256
        (base32
         "119vvz2f6m5i0443r82j2r4hqqlmryffp25spv2cqky2cwjp5lj0"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           (delete-file "_ruamel_yaml.c")))))))

(define-public python-ruamel.yaml-0.17
  (package
   (inherit python-ruamel.yaml)
   (version "0.17.40")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "ruamel.yaml" version))
     (sha256
	  (base32
	   "0g9irxrlim93z9ccgjyx4bfhbkdlqin0hzmhnn1d8rb7y23bj930"))))
   (propagated-inputs
    (list python-ruamel.yaml.clib-0.2.7))))

(define-public rust-rxml-proc-0.11
  (package
   (name "rust-rxml-proc")
   (version "0.11.0")
   (source
    (origin
     (method url-fetch)
     (uri (crate-uri "rxml_proc" version))
     (file-name (string-append name "-" version ".tar.gz"))
     (sha256
      (base32 "11l5cdh7g9n4ayxk05gbrdy0lmklk78jy5l4qamwa56gpivd2b0k"))))
   (build-system cargo-build-system)
   (arguments
    `(#:cargo-inputs (("rust-quote" ,rust-quote-1)
                      ("rust-rxml-validation" ,rust-rxml-validation-0.11)
                      ("rust-syn" ,rust-syn-2))))
   (home-page "https://codeberg.org/jssfr/rxml")
   (synopsis
    "Macros to, at compile time, validate strings against the CData, Name and NCName productions from the XML 1.0 grammar")
   (description
    "This package provides Macros to, at compile time, validate strings against the CData, Name and NCName
productions from the XML 1.0 grammar.")
   (license license:expat)))

(define-public rust-rxml-validation-0.11
  (package
    (name "rust-rxml-validation")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rxml_validation" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1964jrabw23si29lp50mkmazd5fg0jndrcqp6b9yjdcs7d0q0vl2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-compact-str" ,rust-compact-str-0.7))))
    (home-page "https://codeberg.org/jssfr/rxml")
    (synopsis "Plumbing crate for rxml and rxml_proc crates")
    (description
     "This package provides Plumbing crate for rxml and rxml_proc crates.")
    (license license:expat)))

(define-public rust-weak-table-0.3
  (package
    (name "rust-weak-table")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "weak-table" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0ja5zqr1bp5z8wv928y670frnxlj71v6x75g3sg6d6iyaallsgrj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-ahash" ,rust-ahash-0.7))
       #:cargo-development-inputs (("rust-quickcheck" ,rust-quickcheck-1)
                                   ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/tov/weak-table-rs")
    (synopsis "Weak hash maps and sets")
    (description "This package provides Weak hash maps and sets.")
    (license license:expat)))

(define-public rust-rxml-0.12
  (package
    (name "rust-rxml")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "rxml" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "183g6vr8z5yrvpa1hx0hw6yfniddjw4m6yr5c94b4sx5hb1sjgnd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-bytes" ,rust-bytes-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
                       ("rust-rxml-proc" ,rust-rxml-proc-0.11)
                       ("rust-rxml-validation" ,rust-rxml-validation-0.11)
                       ("rust-tokio" ,rust-tokio-1)
                       ("rust-weak-table" ,rust-weak-table-0.3))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.5)
                                   ("rust-tokio" ,rust-tokio-1)
                                   ("rust-tokio-test" ,rust-tokio-test-0.4))))
    (home-page "https://codeberg.org/jssfr/rxml")
    (synopsis
     "Minimalistic, restricted XML 1.0 parser which does not include dangerous XML features")
    (description
     "This package provides Minimalistic, restricted XML 1.0 parser which does not include dangerous XML
features.")
    (license license:expat)))

(define-public rust-minidom-0.12
  (package
    (name "rust-minidom")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "minidom" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "06nbqscsv2clc4mvdzzl1syn89plsqvmxn2lqxjfrxbllqar2m7y"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-rxml" ,rust-rxml-0.12))))
    (home-page "https://gitlab.com/xmpp-rs/xmpp-rs")
    (synopsis
     "small, simple DOM implementation on top of rxml, targeting the subset of XML useful for XMPP")
    (description
     "This package provides a small, simple DOM implementation on top of rxml,
targeting the subset of XML useful for XMPP.")
    (license license:mpl2.0)))

(define-public rust-cmsis-pack-0.7
  (package
    (name "rust-cmsis-pack")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "cmsis-pack" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1l4w5s63mpfhxjawz0rn508giwvp59c6axfvj8g4ksb8j3g9lkri"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-bytes" ,rust-bytes-1)
                       ("rust-futures" ,rust-futures-0.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-minidom" ,rust-minidom-0.12)
                       ("rust-reqwest" ,rust-reqwest-0.12)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-tokio" ,rust-tokio-1))
       #:cargo-development-inputs (("rust-time" ,rust-time-0.3))))
    (home-page "https://github.com/pyocd/cmsis-pack-manager")
    (synopsis "Rust crate for managing CMSIS Packs")
    (description "This package provides Rust crate for managing CMSIS Packs.")
    (license license:asl2.0)))

(define-public rust-quick-xml-0.17
  (package
    (name "rust-quick-xml")
    (version "0.17.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "quick-xml" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1c5vqqbxr4bx7mw6qyv1yhm6g95ikd2rqfq54pf9y37kvh5l67py"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
                       ("rust-document-features" ,rust-document-features-0.2)
                       ("rust-encoding-rs" ,rust-encoding-rs-0.8)
                       ("rust-memchr" ,rust-memchr-2)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-tokio" ,rust-tokio-1))
       #:cargo-development-inputs (("rust-criterion" ,rust-criterion-0.4)
                                   ("rust-pretty-assertions" ,rust-pretty-assertions-1)
                                   ("rust-regex" ,rust-regex-1)
                                   ("rust-serde-value" ,rust-serde-value-0.7)
                                   ("rust-serde-derive" ,rust-serde-derive-1)
                                   ("rust-tokio" ,rust-tokio-1)
                                   ("rust-tokio-test" ,rust-tokio-test-0.4))))
    (home-page "https://github.com/tafia/quick-xml")
    (synopsis "High performance xml reader and writer")
    (description
     "This package provides High performance xml reader and writer.")
    (license license:expat)))

(define-public python-cmsis-pack-manager
  (package
    (name "python-cmsis-pack-manager")
    (version "032a73a93e108e1b0e268ea47d92dbe573002846")
    (source (origin
	          (method git-fetch)
	          (uri (git-reference
		            (url "https://github.com/pyocd/cmsis-pack-manager.git")
		            (commit version)))
	          (sha256
	           (base32
		        "09xhcfq18q56m268zxvkqdaf9df7hrric5xxa6zyqqkf4020pjfl"))))
    (build-system cargo-build-system)
    (arguments
     (list
      #:imported-modules `(,@%cargo-build-system-modules
                           ,@%pyproject-build-system-modules)
      #:modules '((guix build cargo-build-system)
                  ((guix build pyproject-build-system) #:prefix py:)
                  (guix build utils))
      ;;#:phases
      ;;#~(modify-phases %standard-phases
      ;;    (add-after 'prepare-python-module 'build-python-module
      ;;      (assoc-ref py:%standard-phases 'build))
      ;;    (add-after 'build-python-module 'install-python-module
      ;;      (assoc-ref py:%standard-phases 'install)))
      #:phases #~(modify-phases %standard-phases
                   ;; We use Maturin to build the project.
                   (replace 'build
                     (assoc-ref py:%standard-phases
                                'build))
                   ;; Before being able to run Python tests, we need to
                   ;; install the module and add it to PYTHONPATH.
                   (delete 'install)
                   (add-after 'build 'install
                     (assoc-ref py:%standard-phases
                                'install))
                   (add-after 'install 'add-install-to-pythonpath
                     (assoc-ref py:%standard-phases
                                'add-install-to-pythonpath)))
      #:cargo-inputs
      `(("rust-anyhow" ,rust-anyhow-1)
	    ("rust-ctor" ,rust-ctor-0.2)
	    ("rust-simplelog" ,rust-simplelog-0.12)
        ("rust-cmsis-pack" ,rust-cmsis-pack-0.7)

        ("rust-quick-xml" ,rust-quick-xml-0.17)
        
	    ;;("rust-futures" ,rust-futures-0.3)
	    ;;("rust-minidom" ,rust-minidom-0.15)
	    ;;  ("rust-beef" ,rust-beef-0.5)
	    ;;  ("rust-bytecount" ,rust-bytecount-0.6)
	    ;;  ("rust-chrono" ,rust-chrono-0.4)
	    ;;  ("rust-compact-str" ,rust-compact-str-0.7)
	    ;;  ("rust-encoding-rs" ,rust-encoding-rs-0.8)
	    ;;  ("rust-itoa" ,rust-itoa-1)
	    ;;  ("rust-itoap" ,rust-itoap-1)
	    ;;  ("rust-once-cell" ,rust-once-cell-1)
	    ;;  ("rust-pyo3-ffi" ,rust-pyo3-ffi-0.19)
	    ;;  ("rust-ryu" ,rust-ryu-1)
	    ;;  ("rust-serde" ,rust-serde-1)
	    ;;  ("rust-serde-json" ,rust-serde-json-1)
	    ;;  ("rust-simdutf8" ,rust-simdutf8-0.1)
	    ;;  ("rust-smallvec" ,rust-smallvec-1)
	    ;;  ("rust-cc" ,rust-cc-1)
	    ;;  ("rust-pyo3-build-config" ,rust-pyo3-build-config-0.19)
	    ;;  ("rust-version-check" ,rust-version-check-0.9)
	    )
      #:install-source? #false))
    (propagated-inputs (list python-appdirs
                             python-cffi
                             python-pyyaml))
    (native-inputs (list maturin
                         python-wrapper
			             python-hypothesis
			             python-jinja2
			             python-pytest))
    (home-page "https://github.com/pyocd/cmsis-pack-manager")
    (synopsis
     "Python manager for CMSIS-Pack index and cache with fast Rust backend")
    (description
     "Python manager for CMSIS-Pack index and cache with fast Rust backend")
    (license license:asl2.0)))

(define-public python-libusb-package
  (package
   (name "python-libusb-package")
   (version "1.0.26.2")
   (source
    (origin
     (method url-fetch)
     (uri
      (string-append "https://github.com/pyocd/libusb-package/archive/tags/v"
                     version ".tar.gz"))
     (sha256
      (base32 "0w6x5iwqw22arl5cjaq8ipdnxv5ahxspnbjn6llrg1a178aqlz03"))))
   (build-system pyproject-build-system)
   (propagated-inputs (list python-pyusb))
   (native-inputs (list python-setuptools
                        python-setuptools-scm
                        python-wheel
                        python-pytest
                        python-importlib-resources
                        libusb))
   (arguments (list
               #:phases
               #~(modify-phases
                  %standard-phases
                  (add-after 'unpack 'disable-backend-test
                             (lambda _
                               (substitute* "test.py"
                                            (("    main\\(\\)")
                                             (string-append "    path = libusb_package.get_library_path()\n"
                                                            "    print(f\"Path to included library: {path}\")")))))
                  (add-before 'build 'disable-libusb-build
                              (lambda _
                                (let* ((libusb-version #$(version-major+minor (package-version libusb)))
                                       (libusb-lib (string-append #$libusb "/lib/libusb-" libusb-version ".so"))
                                       (libusb-dest (string-append "./src/libusb_package/libusb-" libusb-version ".so")))
                                  (delete-file "setup.py")
                                  (symlink libusb-lib libusb-dest))))
                  (replace 'check
                           (lambda _
                             (invoke "python" "test.py"))))))
   (home-page "https://github.com/pyocd/libusb-package")
   (synopsis "Container package for libusb.")
   (description "Container package for libusb.")
   (license license:asl2.0)))

(define-public python-pylink-square
  (package
    (name "python-pylink-square")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pylink-square" version))
       (sha256
        (base32 "0dqzppbpkc87ljdjacf7gq1anqvj77p66032yhizgw7b1cw0zn4q"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-psutil python-six))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest
                         python-mock))
    (home-page "http://www.github.com/Square/pylink")
    (synopsis "Python interface for SEGGER J-Link.")
    (description "Python interface for SEGGER J-Link.")
    (license license:asl2.0)))

(define-public python-natsort-8
  (package
    (name "python-natsort")
    (version "8.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "natsort" version))
       (sha256
        (base32 "10d53q50zn2s8iiszv01nr9r4imimc2dvplkl4ymj1sm1r52qca5"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list glibc-utf8-locales ;; Tests want en_US.UTF-8
           python-setuptools
           python-wheel
           python-hypothesis
           python-pytest-cov
           python-pytest-mock
           python-pytest))
    (propagated-inputs ; TODO: Add python-fastnumbers.
     (list python-pyicu))
    (home-page "https://github.com/SethMMorton/natsort")
    (synopsis "Natural sorting for python and shell")
    (description
     "Natsort lets you apply natural sorting on lists instead of
lexicographical.  If you use the built-in @code{sorted} method in python on a
list such as @code{[@code{a20}, @code{a9}, @code{a1}, @code{a4}, @code{a10}]},
it would be returned as @code{[@code{a1}, @code{a10}, @code{a20}, @code{a4},
@code{a9}]}.  Natsort provides a function @code{natsorted} that identifies
numbers and sorts them separately from strings.  It can also sort version
numbers, real numbers, mixed types and more, and comes with a shell command
@command{natsort} that exposes this functionality in the command line.")
    (license license:expat)))

(define-public python-pyocd
  (package
   (name "python-pyocd")
   (version "0.36.0")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "pyocd" version))
     (sha256
	  (base32 "0j464acdr6dbmidg518b1zw88jnriiw6yz7va16hbzysr6n84xwk"))))
   (build-system pyproject-build-system)
   (propagated-inputs (list python-capstone
                            python-cmsis-pack-manager
                            python-colorama
                            python-hidapi
                            python-importlib-metadata
                            python-importlib-resources
                            python-intelhex
                            python-intervaltree
                            python-lark-parser
                            python-natsort-8
                            python-prettytable
                            python-pyelftools
                            python-pylink-square
                            python-pyusb
                            python-pyyaml
                            python-six
                            python-typing-extensions
                            python-libusb-package))
   (native-inputs (list python-setuptools
                        python-setuptools-scm
                        python-wheel
			            python-coverage
			            python-flake8
			            python-pylint
			            python-pytest
			            python-pytest-cov
			            python-tox))
   (arguments (list #:phases #~(modify-phases %standard-phases
                                              (add-after 'unpack 'fix-dependency-versions
                                                         (lambda _
                                                           (substitute* "setup.cfg"
                                                                        (("capstone>=4\\.0,<5\\.0")
                                                                         "capstone>=4.0,<=5.1")))))))
   (home-page "https://github.com/pyocd/pyOCD")
   (synopsis "Cortex-M debugger for Python")
   (description "Cortex-M debugger for Python")
   (license license:asl2.0)))

(define-public libusbsio
  (package
    (name "libusbsio")
    (version "2.1.13")
    (source
     (origin
       (method url-fetch)
       (uri "https://www.nxp.com/downloads/en/libraries/libusbsio-Host-library.zip")
       (sha256
        (base32 "0swghrp5dj5yb8wlng6dxv6bmifmmkwdmb02qsz2byn0kp51c9hk"))))
    (build-system gnu-build-system)
    (native-inputs (list unzip
                         eudev
                         pkg-config
                         libusb))
    (arguments (list #:tests? #f ;; no usb device for testing
                     #:phases #~(modify-phases %standard-phases
                                  (delete 'configure)
                                  (add-after 'unpack 'remove-bundled-artifacts
                                    (lambda _
                                      (delete-file-recursively "bin")))
                                  (add-before 'check 'build-test
                                    (lambda _
                                      (with-directory-excursion "test/testapp"
                                        (invoke "make"))))
                                  (replace 'check
                                    (lambda _
                                      (invoke "./bin/linux_x86_64/testapp")))
                                  (replace 'install
                                    (lambda _
                                      (let* ((lib (string-append #$output "/lib"))
                                             (inc (string-append #$output "/include")))
                                        (install-file "bin/linux_x86_64/libusbsio.a" lib)
                                        (install-file "bin/linux_x86_64/libusbsio.so" lib)
                                        (install-file "include/lpcusbsio.h" inc)
                                        (install-file "include/lpcusbsio_protocol.h" inc)))))))
    (home-page "https://www.nxp.com/design/software/development-software/library-for-windows-macos-and-ubuntu-linux:LIBUSBSIO")
    (synopsis "NXP LIBUSBSIO library")
    (description "NXP LIBUSBSIO library.")
    (license license:bsd-3)))

(define-public python-libusbsio
  (package
   (name "python-libusbsio")
   (version "2.1.13")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "libusbsio" version))
     (sha256
      (base32 "09avjw0nvsk4hra1z3sr8dix4n9bhqbq0kjpn3qasplz595rs6yz"))))
   (build-system pyproject-build-system)
   (native-inputs (list python-setuptools
                        python-wheel
                        python-pytest
                        libusbsio))
   (arguments (list #:tests? #f ;; needs usb access
                    #:phases
                    #~(modify-phases %standard-phases
                                     (add-after 'unpack 'remove-bundled-artifacts
                                                (lambda _
                                                  (delete-file-recursively "libusbsio/bin")))
                                     (add-after 'remove-bundled-artifacts 'symlink-libs
                                                (lambda _
                                                  (mkdir-p "libusbsio/bin/linux_x86_64")
                                                  (symlink (string-append #$libusbsio "/lib/libusbsio.so")
                                                           "libusbsio/bin/linux_x86_64/libusbsio.so")))
                                     (delete 'ensure-no-mtimes-pre-1980))))
   (home-page "https://www.nxp.com/design/software/development-software/library-for-windows-macos-and-ubuntu-linux:LIBUSBSIO")
   (synopsis "Python wrapper around NXP LIBUSBSIO library")
   (description "Python wrapper around NXP LIBUSBSIO library.")
   (license license:bsd-3)))

(define-public uuu
  (package
    (name "uuu")
    (version "1.5.201")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nxp-imx/mfgtools/archive/tags/uuu_"
             version ".tar.gz"))
       (sha256
        (base32 "1zp1n52nbl0x892v7ibgdclgsxr450awpqgz81fzy7p9k2vqcrcj"))))
    (build-system cmake-build-system)
    (native-inputs (list pkg-config))
    (inputs (list libusb
                  (list zstd "lib")
                  tinyxml2
                  zlib
                  openssl))
    (arguments (list
                #:tests? #f ;; no tests packaged
                #:phases
                #~(modify-phases %standard-phases
                    (add-after 'unpack 'add-missing-version-file
                      (lambda _
                        (with-output-to-file ".tarball-version"
                          (lambda _
                            (display #$version))))))))
    (home-page "https://github.com/nxp-imx/mfgtools")
    (synopsis "Freescale/NXP I.MX Chip image deploy tools")
    (description "Freescale/NXP I.MX Chip image deploy tools.")
    (license license:bsd-3)))

(define-public python-libuuu
  (package
    (name "python-libuuu")
    (version "1.5.201")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/nxp-imx/mfgtools/archive/tags/uuu_"
             version ".tar.gz"))
       (sha256
        (base32 "1zp1n52nbl0x892v7ibgdclgsxr450awpqgz81fzy7p9k2vqcrcj"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools
                         python-wheel
                         cmake-minimal
                         pkg-config
                         python-nose2))
    (inputs (list libusb
                  tinyxml2
                  bzip2
                  (list zstd "lib")
                  openssl
                  zlib))
    (arguments (list
                #:tests? #f ;; no usb access
                #:phases
                #~(modify-phases %standard-phases
                    (add-after 'unpack 'change-dir
                      (lambda _
                        (chdir "wrapper")))
                    (add-after 'change-dir 'fix-version
                      (lambda _
                        (substitute* "pyproject.toml"
                          ((", \"setuptools-scm>=8\"") "")
                          (("tool\\.setuptools_scm") "tool._setuptools_scm"))
                        (substitute* "requirements.txt"
                          (("setuptools-scm>=8") ""))
                        (substitute* "libuuu/misc.py"
                          (("from setuptools_scm import get_version") ""))
                        (with-output-to-file "libuuu/__version__.py"
                          (lambda _
                            (display
                             (string-append "__version__ = '" #$version "'"))))))
                    (add-before 'build 'build-library
                      (lambda _
                        (mkdir-p "libuuu/lib")
                        (invoke "cmake" "-S." "-Blibuuu/lib")
                        (invoke "cmake" "--build" "libuuu/lib")))
                    (add-after 'change-dir 'fix-bzip2-dependency
                      (lambda _
                        (substitute* "CMakeLists.txt"
                          (("pkg_check_modules\\(bzip2 REQUIRED IMPORTED_TARGET bzip2\\)")
                           "find_package(BZip2 REQUIRED)")
                          (("PkgConfig::bzip2") "${BZip2_LIBRARIES}"))))
                    (add-after 'change-dir 'debug-test
                      (lambda _
                        (substitute* "libuuu/libuuu.py"
                          (("self\\._response\\.value = b\"\"" all)
                           (string-append all "\n        print(self.DLL)"))))))))
    (home-page "https://github.com/nxp-imx/mfgtools/wrapper")
    (synopsis "A python wraper for libuuu.")
    (description "This package provides a python wraper for libuuu.")
    (license license:bsd-3)))

(define-public python-spsdk-pyocd
  (package
    (name "python-spsdk-pyocd")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "spsdk_pyocd" version))
       (sha256
        (base32 "1ygsnlcnvc55barqhn217s0rhd6hfvqsrharvxg5r3478r7dj1an"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-pyocd
                             python-click))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest))
    (arguments (list #:tests? #f)) ;; depends on python-spsdk; circular dependency
    (home-page "https://github.com/nxp-mcuxpresso/spsdk_plugins/tree/master/pemicro")
    (synopsis "PyOCD SW Debugger. A debugger probe plugin for SPSDK.")
    (description
     "@code{PyOCD} SW Debugger.  A debugger probe plugin for SPSDK.")
    (license license:bsd-3)))

(define-public python-pyasn1-0.6
  (package
    (name "python-pyasn1")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyasn1" version))
       (sha256
        (base32 "0d5h500ig8sp72pabd1wcyglc4951xalbkqahf056dl4vlmhsn3g"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/pyasn1/pyasn1")
    (synopsis
     "Pure-Python implementation of ASN.1 types and DER/BER/CER codecs (X.208)")
    (description
     "Pure-Python implementation of ASN.1 types and DER/BER/CER codecs (X.208).")
    (license license:bsd-2)))

(define-public python-pyscard
  (package
    (name "python-pyscard")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pyscard" version))
       (sha256
        (base32 "154d7z0q8glphz8gz1wm6ymd3wvwxbbkyp4ikfqlq8h8a656h3lj"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools
                         swig
                         python-wheel
                         pkg-config
                         pcsc-lite))
    (home-page "https://github.com/LudovicRousseau/pyscard")
    (synopsis "Smartcard module for Python.")
    (description "Smartcard module for Python.")
    (license license:lgpl2.0)))

(define-public python-spsdk
  (package
    (name "python-spsdk")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "spsdk" version))
       (sha256
        (base32 "1ndk964pmcg72ksy8mb40lap7zk6cfapjjrc8clzq27x1x0zz6xl"))))
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f ;; no tests packaged
           #:phases
           #~(modify-phases %standard-phases
	           (add-after 'unpack 'remove-debugger-dependencies
	             (lambda _
	               (substitute* "requirements.txt"
	                 (("spsdk-mcu-link<=0\\.5,>=0\\.3\\.2") "")
                     (("spsdk-pyocd<=0\\.3,>=0\\.2\\.0") "")
                     (("setuptools_scm<8\\.2") "")
                     (("requests<2\\.33,>=2\\.32\\.3") "requests<2.33,>=2.31.0")
                     (("packaging<24\\.2,>=23\\.2") "packaging<=24.2,>=23.2")
                     (("cryptography<43\\.1,>=42\\.0\\.0") "cryptography<=44.0.0,>=42.0.0"))))
               (add-after 'unpack 'fix-setuptools-scm
                 (lambda _
                   (substitute* "spsdk/versioning.py"
                     (("from setuptools_scm.*$" all) (string-append "#" all)))))
               (add-after 'unpack 'set-home
                 (lambda _
                   (setenv "HOME" "/tmp"))))))
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest))
    (propagated-inputs (list python-asn1crypto
                             python-bincopy
                             python-bitstring
                             python-click
                             python-click-command-tree
                             python-click-option-group
                             python-colorama
                             python-crcmod
                             python-cryptography
                             python-deepmerge
                             python-fastjsonschema
                             python-filelock
                             python-hexdump
                             python-importlib-metadata
                             python-libusbsio
                             python-libuuu
                             python-oscrypto
                             python-packaging
                             python-platformdirs
                             python-prettytable
                             python-pyasn1-0.6
                             python-pyscard
                             python-pyserial
                             python-requests
                             python-ruamel.yaml-0.17
                             python-sly
                             ;;python-spsdk-mcu-link
                             ;;python-spsdk-pyocd
                             python-typing-extensions
                             python-pyaml))
    (home-page "https://github.com/NXPmicro/spsdk")
    (synopsis "Open Source Secure Provisioning SDK for NXP MCU/MPU")
    (description "Open Source Secure Provisioning SDK for NXP MCU/MPU")
    (license license:bsd-3)))

(define-public python-tlv8
  (package
    (name "python-tlv8")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "tlv8" version))
       (sha256
	    (base32 "11164vjaw38f0l4blbpsj58yr68vx1za5hia4x99k03v4s8aac3r"))))
    (build-system pyproject-build-system)
    (arguments (list #:tests? #f)) ;; no tests packaged
    (native-inputs (list python-setuptools
                         python-wheel))
    (home-page "https://github.com/jlusiardi/tlv8_python")
    (synopsis
     "Python module to handle type-length-value (TLV) encoded data 8-bit type, 8-bit length, and N-byte value as described within the Apple HomeKit Accessory Protocol Specification Non-Commercial Version Release R2.")
    (description
     "Python module to handle type-length-value (TLV) encoded data 8-bit type, 8-bit
length, and N-byte value as described within the Apple @code{HomeKit} Accessory
Protocol Specification Non-Commercial Version Release R2.")
    (license license:asl2.0)))

(define-public python-types-tqdm
  (package
    (name "python-types-tqdm")
    (version "4.66.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "types-tqdm" version))
       (sha256
        (base32 "0pylandfajknxprd2y06hxzfihy0cnyvh1gm3775yj0x9kjaalwm"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools
                         python-wheel))    
    (home-page "https://github.com/python/typeshed")
    (synopsis "Typing stubs for tqdm")
    (description "Typing stubs for tqdm")
    (license license:asl2.0)))

(define-public python-semver-3
  (package
    (name "python-semver")
    (version "3.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "semver" version))
       (sha256
        (base32 "00lnb1mpppgq041kwcbg405rqsi2mzl8dw1s0c8hmvd5hk2xiixg"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools
                         python-wheel
                         python-pytest
                         python-pytest-cov))
    (home-page "https://github.com/python-semver/python-semver")
    (synopsis "Python helper for Semantic Versioning (https://semver.org)")
    (description "Python helper for Semantic Versioning (https://semver.org).")
    (license license:bsd-3)))

(define-public python-nethsm
  (package
    (name "python-nethsm")
    (version "2.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "nethsm" version))
       (sha256
        (base32 "0jpvi22c4594007xn47034m1ldv29n4lnqiggk2cm0abpyy78fx5"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-certifi
                             python-cryptography
                             python-pycryptodome
                             python-dateutil
                             python-typing-extensions
                             python-urllib3))
    (native-inputs (list python-flit-core
                         python-pytest
                         python-pytest-cov))
    (arguments (list #:tests? #f)) ;; no tests packaged
    (home-page "https://docs.nitrokey.com/nethsm/")
    (synopsis "Python Library to manage NetHSM(s).")
    (description "Python Library to manage @code{NetHSM(s}).")
    (license license:asl2.0)))

(define-public python-click-aliases
(package
(name "python-click-aliases")
(version "1.0.5")
(source
 (origin
   (method url-fetch)
   (uri (pypi-uri "click_aliases" version))
   (sha256
    (base32 "07c8piabkx743jyh3j8f8pkz05gsknjn7w60iv2f2s5dpamlqzg3"))))
(build-system pyproject-build-system)
(propagated-inputs (list python-click))
(native-inputs (list python-poetry-core
                     python-pytest))
(arguments (list #:tests? #f)) ;; no tests packaged
(home-page "https://github.com/click-contrib/click-aliases")
(synopsis "Add (mutiple) aliases to a click group or command")
(description "Add (mutiple) aliases to a click group or command.")
(license license:expat)))

(define-public python-fido2-2
  (package
    (inherit python-fido2)
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Yubico/python-fido2")
              (commit version)))
       (file-name (git-file-name "python-fido2" version))
       (sha256
        (base32 "043ldwaxryndh6nwi0j4ysk6phzpkzdik8i15mmahnx3gl1qibif"))
       ;; (snippet
       ;;  ;; Remove bundled dependency.
       ;;  '(delete-file "fido2/public_suffix_list.dat"))
       ))
    ;; test stuck...
    (arguments (list #:tests? #f))))

(define-public python-nitrokey
  (package
    (name "python-nitrokey")
    (version "0.4.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Nitrokey/nitrokey-sdk-py")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hnlkrpwna9lq8f9v1l9xvwxf65lp642jbacb2g6dcdsz1lldm0c"))))
    (build-system pyproject-build-system)
    ;; (arguments (list #:tests? #f)) ;; no tests packaged
    (propagated-inputs (list python-crcmod
                             python-cryptography
                             python-fido2-2
                             python-hidapi
                             python-protobuf
                             python-pyserial
                             python-requests                            
                             python-tlv8))
    (native-inputs (list python-poetry-core))
    (home-page "https://github.com/Nitrokey/nitrokey-sdk-py")
    (synopsis "Nitrokey Python SDK")
    (description "Nitrokey Python SDK.")
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
    (version "0.11.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Nitrokey/pynitrokey")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18kgxxd06qm2qla37xnmqzr3zkby3lqwyg8p1bzz80jqzwbslhc7"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-poetry-core python-pytest))
    (inputs (list libnitrokey))
    (propagated-inputs (list python-cffi
                             python-click-8.3
                             python-cryptography
                             python-ecdsa
                             python-fido2-2                           
                             python-hidapi
                             python-intelhex
                             python-libusb1
                             python-nethsm
                             python-nitrokey
                             python-nkdfu
                             python-pyusb
                             python-pyserial
                             python-requests
                             python-semver
                             python-tlv8
                             python-tqdm))
    (arguments
     (list
      #:tests? #f ;; need hardware device
      #:phases #~(modify-phases %standard-phases
                   (add-before 'check 'set-home
                     (lambda _
                       (setenv "HOME" "/tmp"))))))
    (home-page "https://docs.nitrokey.com/software/nitropy/")
    (synopsis "Python Library for Nitrokey devices.")
    (description "Python Library for Nitrokey devices.")
    (license license:asl2.0)))

python-pynitrokey
