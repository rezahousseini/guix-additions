(define-module (gnu packages rust-additions)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages jemalloc)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages webkit)
  #:use-module (gnu packages xorg))

;;(define-public rust-yasna-0.4
;;  (package
;;    (name "rust-yasna")
;;    (version "0.4.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "yasna" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0xgsvxqnycdakh6j3hg4dk3mylrpnba50w0d36vg5k311sfs4qp2"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bit-vec" ,rust-bit-vec-0.6)
;;        ("rust-chrono" ,rust-chrono-0.4)
;;        ("rust-num-bigint" ,rust-num-bigint-0.4))))
;;    (home-page "https://github.com/qnighy/yasna.rs")
;;    (synopsis "ASN.1 library for Rust")
;;    (description "ASN.1 library for Rust")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-rcgen-0.8
;;  (package
;;    (name "rust-rcgen")
;;    (version "0.8.14")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "rcgen" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "19qvlcz8kl046q85xa40p3xg7l78jganj83hdbawjhs17x0d24ar"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-chrono" ,rust-chrono-0.4)
;;        ("rust-pem" ,rust-pem-1)
;;        ("rust-ring" ,rust-ring-0.16)
;;        ("rust-x509-parser" ,rust-x509-parser-0.12)
;;        ("rust-yasna" ,rust-yasna-0.4)
;;        ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/est31/rcgen")
;;    (synopsis "Rust X.509 certificate generator")
;;    (description "Rust X.509 certificate generator")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-pcsc-sys-1
;;  (package
;;   (name "rust-pcsc-sys")
;;   (version "1.2.0")
;;   (source
;;    (origin
;;     (method url-fetch)
;;     (uri (crate-uri "pcsc-sys" version))
;;     (file-name (string-append name "-" version ".tar.gz"))
;;     (sha256
;;      (base32 "1si37v9n07r3csqcnnqn4i82j75b6dssyz0fzdg1n3rcpbnbzdz1"))))
;;   (build-system cargo-build-system)
;;   (arguments
;;    `(#:skip-build?
;;      #t
;;      #:cargo-inputs
;;      (("rust-pkg-config" ,rust-pkg-config-0.3))))
;;   (native-inputs
;;    (list pkg-config))
;;   (inputs
;;    (list pcsc-lite))
;;   (home-page "https://github.com/bluetech/pcsc-rust")
;;   (synopsis "Low-level bindings to the PC/SC C API")
;;   (description "Low-level bindings to the PC/SC C API")
;;   (license license:expat)))
;;
;;(define-public rust-pcsc-2
;;  (package
;;    (name "rust-pcsc")
;;    (version "2.7.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "pcsc" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1i7xqknwfwi990nw452sr0fy3zgrl1avvdbgs3nawcx4g3gf8aby"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bitflags" ,rust-bitflags-1)
;;        ("rust-pcsc-sys" ,rust-pcsc-sys-1))))
;;    (home-page "https://github.com/bluetech/pcsc-rust")
;;    (synopsis "Bindings to the PC/SC API for smart card communication")
;;    (description "Bindings to the PC/SC API for smart card communication")
;;    (license license:expat)))
;;
;;(define-public rust-signature-derive-1
;;  (package
;;    (name "rust-signature-derive")
;;    (version "1.0.0-pre.3")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "signature_derive" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "140dc985ah274xz4y362lry51z6m0205lcngsa07dy3kbc4pdfpz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-proc-macro2" ,rust-proc-macro2-1)
;;        ("rust-quote" ,rust-quote-1)
;;        ("rust-syn" ,rust-syn-1)
;;        ("rust-synstructure" ,rust-synstructure-0.12))))
;;    (home-page
;;     "https://github.com/RustCrypto/traits/tree/master/signature/derive")
;;    (synopsis "Custom derive support for the 'signature' crate")
;;    (description "Custom derive support for the 'signature' crate")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-signature-1
;;  (package
;;    (name "rust-signature")
;;    (version "1.4.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "signature" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "123790yjdsqsmqpw2kkcda6nycaczaffcy4s3ycyqawzv148wr82"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-digest" ,rust-digest-0.9)
;;         ("rust-rand-core" ,rust-rand-core-0.6)
;;         ("rust-signature-derive" ,rust-signature-derive-1))))
;;    (home-page "https://github.com/RustCrypto/traits/tree/master/signature")
;;    (synopsis
;;      "Traits for cryptographic signature algorithms (e.g. ECDSA, Ed25519)")
;;    (description
;;      "Traits for cryptographic signature algorithms (e.g.  ECDSA, Ed25519)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-rfc6979-0.1
;;  (package
;;    (name "rust-rfc6979")
;;    (version "0.1.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "rfc6979" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "09850my3yx9hshwhk4c3kb992r880068kxzcz692ffgnfn2n1vwn"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-crypto-bigint" ,rust-crypto-bigint-0.3)
;;         ("rust-hmac" ,rust-hmac-0.11)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/signatures/tree/master/rfc6979")
;;    (synopsis
;;      "Pure Rust implementation of RFC6979: Deterministic Usage of the
;;Digital Signature Algorithm (DSA) and Elliptic Curve Digital Signature Algorithm (ECDSA)
;;")
;;    (description
;;      "Pure Rust implementation of RFC6979: Deterministic Usage of the Digital
;;Signature Algorithm (DSA) and Elliptic Curve Digital Signature Algorithm (ECDSA)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-sha2-0.9
;;  (package
;;    (name "rust-sha2")
;;    (version "0.9.9")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "sha2" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "006q2f0ar26xcjxqz8zsncfgz86zqa5dkwlwv03rhx1rpzhs2n2d"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-block-buffer" ,rust-block-buffer-0.9)
;;         ("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-cpufeatures" ,rust-cpufeatures-0.2)
;;         ("rust-digest" ,rust-digest-0.9)
;;         ("rust-opaque-debug" ,rust-opaque-debug-0.3)
;;         ("rust-sha2-asm" ,rust-sha2-asm-0.6))))
;;    (home-page "https://github.com/RustCrypto/hashes")
;;    (synopsis
;;      "Pure Rust implementation of the SHA-2 hash function family
;;including SHA-224, SHA-256, SHA-384, and SHA-512.
;;")
;;    (description
;;      "Pure Rust implementation of the SHA-2 hash function family including SHA-224,
;;SHA-256, SHA-384, and SHA-512.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-spki-0.5
;;  (package
;;    (name "rust-spki")
;;    (version "0.5.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "spki" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "09qaddm4kw01xm9638910bm4yqnshzh2p38lvc3kxkvc5b01ml24"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-base64ct" ,rust-base64ct-1)
;;         ("rust-der" ,rust-der-0.5)
;;         ("rust-sha2" ,rust-sha2-0.9))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/spki")
;;    (synopsis
;;      "X.509 Subject Public Key Info (RFC5280) describing public keys as well as their
;;associated AlgorithmIdentifiers (i.e. OIDs)
;;")
;;    (description
;;      "X.509 Subject Public Key Info (RFC5280) describing public keys as well as their
;;associated AlgorithmIdentifiers (i.e.  OIDs)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-sha-1-0.9
;;  (package
;;    (name "rust-sha-1")
;;    (version "0.9.8")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "sha-1" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "19jibp8l9k5v4dnhj5kfhaczdfd997h22qz0hin6pw9wvc9ngkcr"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-block-buffer" ,rust-block-buffer-0.9)
;;         ("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-cpufeatures" ,rust-cpufeatures-0.2)
;;         ("rust-digest" ,rust-digest-0.9)
;;         ("rust-opaque-debug" ,rust-opaque-debug-0.3)
;;         ("rust-sha1-asm" ,rust-sha1-asm-0.5))))
;;    (home-page "https://github.com/RustCrypto/hashes")
;;    (synopsis "SHA-1 hash function")
;;    (description "SHA-1 hash function")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-pkcs5-0.4
;;  (package
;;    (name "rust-pkcs5")
;;    (version "0.4.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "pkcs5" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0xhyi3k5p6lxb28ivcd1f3skdbmhzk0gamfry7q56pifx9xi8g6n"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-aes" ,rust-aes-0.7)
;;         ("rust-block-modes" ,rust-block-modes-0.8)
;;         ("rust-der" ,rust-der-0.5)
;;         ("rust-des" ,rust-des-0.7)
;;         ("rust-hmac" ,rust-hmac-0.11)
;;         ("rust-pbkdf2" ,rust-pbkdf2-0.9)
;;         ("rust-scrypt" ,rust-scrypt-0.8)
;;         ("rust-sha-1" ,rust-sha-1-0.9)
;;         ("rust-sha2" ,rust-sha2-0.9)
;;         ("rust-spki" ,rust-spki-0.5))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/pkcs5")
;;    (synopsis
;;      "Pure Rust implementation of Public-Key Cryptography Standards (PKCS) #5:
;;Password-Based Cryptography Specification Version 2.1 (RFC 8018)
;;")
;;    (description
;;      "Pure Rust implementation of Public-Key Cryptography Standards (PKCS) #5:
;;Password-Based Cryptography Specification Version 2.1 (RFC 8018)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-pkcs8-0.8
;;  (package
;;    (name "rust-pkcs8")
;;    (version "0.8.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "pkcs8" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1l29h4mrgi2kpsl98jzky3ni5by3xa1sc6db9yd8l1i1p0zxmavw"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-der" ,rust-der-0.5)
;;         ("rust-pkcs5" ,rust-pkcs5-0.4)
;;         ("rust-rand-core" ,rust-rand-core-0.6)
;;         ("rust-spki" ,rust-spki-0.5)
;;         ("rust-subtle" ,rust-subtle-2)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/pkcs8")
;;    (synopsis
;;      "Pure Rust implementation of Public-Key Cryptography Standards (PKCS) #8:
;;Private-Key Information Syntax Specification (RFC 5208), with additional
;;support for PKCS#8v2 asymmetric key packages (RFC 5958)
;;")
;;    (description
;;      "Pure Rust implementation of Public-Key Cryptography Standards (PKCS) #8:
;;Private-Key Information Syntax Specification (RFC 5208), with additional support
;;for PKCS#8v2 asymmetric key packages (RFC 5958)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-sec1-0.2
;;  (package
;;    (name "rust-sec1")
;;    (version "0.2.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "sec1" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1ld2w428lgz9i6qgpx864lg5xa6bikk3jrmxnramanlnn2w6dnh8"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-der" ,rust-der-0.5)
;;         ("rust-generic-array" ,rust-generic-array-0.14)
;;         ("rust-pkcs8" ,rust-pkcs8-0.8)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-subtle" ,rust-subtle-2)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/sec1")
;;    (synopsis
;;      "Pure Rust implementation of SEC1: Elliptic Curve Cryptography encoding formats
;;including ASN.1 DER-serialized private keys as well as the
;;Elliptic-Curve-Point-to-Octet-String encoding
;;")
;;    (description
;;      "Pure Rust implementation of SEC1: Elliptic Curve Cryptography encoding formats
;;including ASN.1 DER-serialized private keys as well as the
;;Elliptic-Curve-Point-to-Octet-String encoding")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-group-0.11
;;  (package
;;    (name "rust-group")
;;    (version "0.11.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "group" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "128crxgid9fa2a7pxiwgkpgndyirqhymy1v0hkkrv4h8n5sc6nmw"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-byteorder" ,rust-byteorder-1)
;;         ("rust-ff" ,rust-ff-0.11)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-rand-core" ,rust-rand-core-0.6)
;;         ("rust-rand-xorshift" ,rust-rand-xorshift-0.3)
;;         ("rust-subtle" ,rust-subtle-2))))
;;    (home-page "https://github.com/zkcrypto/group")
;;    (synopsis "Elliptic curve group traits and utilities")
;;    (description "Elliptic curve group traits and utilities")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-addchain-0.2
;;  (package
;;    (name "rust-addchain")
;;    (version "0.2.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "addchain" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0w45hpybsx9gzhlxf6x9451kycg8xwj3x8qzjnk8wqm55926jbiv"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-num-bigint" ,rust-num-bigint-0.3)
;;         ("rust-num-integer" ,rust-num-integer-0.1)
;;         ("rust-num-traits" ,rust-num-traits-0.2))))
;;    (home-page "https://github.com/str4d/addchain")
;;    (synopsis "Generate addition chains")
;;    (description "Generate addition chains")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-ff-derive-0.11
;;  (package
;;    (name "rust-ff-derive")
;;    (version "0.11.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "ff_derive" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0p7qbgh12r0m31ar4v5xq4ifj9isakv9nb09qwxgkkmdccl9f8x9"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-addchain" ,rust-addchain-0.2)
;;         ("rust-num-bigint" ,rust-num-bigint-0.3)
;;         ("rust-num-integer" ,rust-num-integer-0.1)
;;         ("rust-num-traits" ,rust-num-traits-0.2)
;;         ("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/zkcrypto/ff")
;;    (synopsis
;;      "Procedural macro library used to build custom prime field implementations")
;;    (description
;;      "Procedural macro library used to build custom prime field implementations")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-ff-0.11
;;  (package
;;    (name "rust-ff")
;;    (version "0.11.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ff" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "17jvl09izh92pbcaszl3mac600ix72grmszafpqjg7sb2828v5dj"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bitvec" ,rust-bitvec-0.22)
;;        ("rust-byteorder" ,rust-byteorder-1)
;;        ("rust-ff-derive" ,rust-ff-derive-0.11)
;;        ("rust-rand-core" ,rust-rand-core-0.6)
;;        ("rust-subtle" ,rust-subtle-2))))
;;    (home-page "https://github.com/zkcrypto/ff")
;;    (synopsis "Library for building and interfacing with finite fields")
;;    (description "Library for building and interfacing with finite fields")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-base16ct-0.1
;;  (package
;;    (name "rust-base16ct")
;;    (version "0.1.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "base16ct" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1klccxr7igf73wpi0x3asjd8n0xjg0v6a7vxgvfk5ybvgh1hd6il"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/base16ct")
;;    (synopsis
;;     "Pure Rust implementation of Base16 a.k.a hexadecimal (RFC 4648) which avoids
;;any usages of data-dependent branches/LUTs and thereby provides portable
;;\"best effort\" constant-time operation and embedded-friendly no_std support
;;")
;;    (description
;;     "Pure Rust implementation of Base16 a.k.a hexadecimal (RFC 4648) which avoids any
;;usages of data-dependent branches/LUTs and thereby provides portable \"best
;;effort\" constant-time operation and embedded-friendly no_std support")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-elliptic-curve-0.11
;;  (package
;;    (name "rust-elliptic-curve")
;;    (version "0.11.12")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "elliptic-curve" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1mh64cngdn1z92ijpwfk198v4n709569cq3s7f5d7zib7ib7gd15"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-base16ct" ,rust-base16ct-0.1)
;;        ("rust-base64ct" ,rust-base64ct-1)
;;        ("rust-crypto-bigint" ,rust-crypto-bigint-0.3)
;;        ("rust-der" ,rust-der-0.5)
;;        ("rust-digest" ,rust-digest-0.9)
;;        ("rust-ff" ,rust-ff-0.11)
;;        ("rust-generic-array" ,rust-generic-array-0.14)
;;        ("rust-group" ,rust-group-0.11)
;;        ("rust-hex-literal" ,rust-hex-literal-0.3)
;;        ("rust-pem-rfc7468" ,rust-pem-rfc7468-0.3)
;;        ("rust-rand-core" ,rust-rand-core-0.6)
;;        ("rust-sec1" ,rust-sec1-0.2)
;;        ("rust-serde" ,rust-serde-1)
;;        ("rust-serde-json" ,rust-serde-json-1)
;;        ("rust-subtle" ,rust-subtle-2)
;;        ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page
;;     "https://github.com/RustCrypto/traits/tree/master/elliptic-curve")
;;    (synopsis
;;     "General purpose Elliptic Curve Cryptography (ECC) support, including types
;;and traits for representing various elliptic curve forms, scalars, points,
;;and public/secret keys composed thereof.
;;")
;;    (description
;;     "General purpose Elliptic Curve Cryptography (ECC) support, including types and
;;traits for representing various elliptic curve forms, scalars, points, and
;;public/secret keys composed thereof.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-pem-rfc7468-0.3
;;  (package
;;    (name "rust-pem-rfc7468")
;;    (version "0.3.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "pem-rfc7468" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0c7vrrksg8fqzxb7q4clzl14f0qnqky7jqspjqi4pailiybmvph1"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-base64ct" ,rust-base64ct-1))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/pem-rfc7468")
;;    (synopsis
;;     "PEM Encoding (RFC 7468) for PKIX, PKCS, and CMS Structures, implementing a
;;strict subset of the original Privacy-Enhanced Mail encoding intended
;;specifically for use with cryptographic keys, certificates, and other messages.
;;Provides a no_std-friendly, constant-time implementation suitable for use with
;;cryptographic private keys.
;;")
;;    (description
;;     "PEM Encoding (RFC 7468) for PKIX, PKCS, and CMS Structures, implementing a
;;strict subset of the original Privacy-Enhanced Mail encoding intended
;;specifically for use with cryptographic keys, certificates, and other messages.
;;Provides a no_std-friendly, constant-time implementation suitable for use with
;;cryptographic private keys.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-der-derive-0.5
;;  (package
;;    (name "rust-der-derive")
;;    (version "0.5.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "der_derive" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1zw4p6yqklv4i76ms2a0gcmna648337r379d5ljgpbir5cyqylrs"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-proc-macro-error" ,rust-proc-macro-error-1)
;;        ("rust-proc-macro2" ,rust-proc-macro2-1)
;;        ("rust-quote" ,rust-quote-1)
;;        ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/der/derive")
;;    (synopsis
;;     "Custom derive support for the `der` crate's `Choice` and `Sequence` traits")
;;    (description
;;     "Custom derive support for the `der` crate's `Choice` and `Sequence` traits")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-crypto-bigint-0.3
;;  (package
;;    (name "rust-crypto-bigint")
;;    (version "0.3.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "crypto-bigint" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "08gx92sj93hk2smqy4nvk8lmpjjjqm7a9ps22q3pxqqxzbas3ih3"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-generic-array" ,rust-generic-array-0.14)
;;        ("rust-rand-core" ,rust-rand-core-0.6)
;;        ("rust-rlp" ,rust-rlp-0.5)
;;        ("rust-subtle" ,rust-subtle-2)
;;        ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/crypto-bigint")
;;    (synopsis
;;     "Pure Rust implementation of a big integer library which has been designed from
;;the ground-up for use in cryptographic applications. Provides constant-time,
;;no_std-friendly implementations of modern formulas using const generics.
;;")
;;    (description
;;     "Pure Rust implementation of a big integer library which has been designed from
;;the ground-up for use in cryptographic applications.  Provides constant-time,
;;no_std-friendly implementations of modern formulas using const generics.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-const-oid-0.7
;;  (package
;;    (name "rust-const-oid")
;;    (version "0.7.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "const-oid" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1wwl3cncd8p2fa54vzmghflh4nh9ml02xfbv38nf5ziifh28riz4"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/const-oid")
;;    (synopsis
;;     "Const-friendly implementation of the ISO/IEC Object Identifier (OID) standard
;;as defined in ITU X.660, with support for BER/DER encoding/decoding as well as
;;heapless no_std (i.e. embedded) support
;;")
;;    (description
;;     "Const-friendly implementation of the ISO/IEC Object Identifier (OID) standard as
;;defined in ITU X.660, with support for BER/DER encoding/decoding as well as
;;heapless no_std (i.e.  embedded) support")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-der-0.5
;;  (package
;;    (name "rust-der")
;;    (version "0.5.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "der" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0p3h7nszn7jhjacpmkjrcyx5g8p3ma1qhxfy3397m7l3fdfq26b9"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-const-oid" ,rust-const-oid-0.7)
;;        ("rust-crypto-bigint" ,rust-crypto-bigint-0.3)
;;        ("rust-der-derive" ,rust-der-derive-0.5)
;;        ("rust-pem-rfc7468" ,rust-pem-rfc7468-0.3)
;;        ("rust-time" ,rust-time-0.3))))
;;    (home-page "https://github.com/RustCrypto/formats/tree/master/der")
;;    (synopsis
;;     "Pure Rust embedded-friendly implementation of the Distinguished Encoding Rules
;;(DER) for Abstract Syntax Notation One (ASN.1) as described in ITU X.690 with
;;full support for heapless no_std targets
;;")
;;    (description
;;     "Pure Rust embedded-friendly implementation of the Distinguished Encoding Rules
;;(DER) for Abstract Syntax Notation One (ASN.1) as described in ITU X.690 with
;;full support for heapless no_std targets")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-ecdsa-0.13
;;  (package
;;    (name "rust-ecdsa")
;;    (version "0.13.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ecdsa" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1jcxmqq7wvb3fyb5ss7c1k3siwgszqakax40cgaq5r8c5vk9mmnh"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-der" ,rust-der-0.5)
;;        ("rust-elliptic-curve" ,rust-elliptic-curve-0.11)
;;        ("rust-rfc6979" ,rust-rfc6979-0.1)
;;        ("rust-signature" ,rust-signature-1))))
;;    (home-page "https://github.com/RustCrypto/signatures/tree/master/ecdsa")
;;    (synopsis
;;     "Pure Rust implementation of the Elliptic Curve Digital Signature Algorithm
;;(ECDSA) as specified in FIPS 186-4 (Digital Signature Standard)
;;")
;;    (description
;;     "Pure Rust implementation of the Elliptic Curve Digital Signature Algorithm
;;(ECDSA) as specified in FIPS 186-4 (Digital Signature Standard)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-p256-0.10
;;  (package
;;    (name "rust-p256")
;;    (version "0.10.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "p256" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0fsfnanz6pn82wxa58pwbj7zp8sip58829i66kirzgjzcy06swqr"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-ecdsa" ,rust-ecdsa-0.13)
;;        ("rust-elliptic-curve" ,rust-elliptic-curve-0.11)
;;        ("rust-hex-literal" ,rust-hex-literal-0.3)
;;        ("rust-sec1" ,rust-sec1-0.2)
;;        ("rust-sha2" ,rust-sha2-0.9))))
;;    (home-page
;;     "https://github.com/RustCrypto/elliptic-curves/tree/master/p256")
;;    (synopsis
;;     "Pure Rust implementation of the NIST P-256 (a.k.a. secp256r1, prime256v1)
;;elliptic curve with support for ECDH, ECDSA signing/verification, and general
;;purpose curve arithmetic
;;")
;;    (description
;;     "Pure Rust implementation of the NIST P-256 (a.k.a.  secp256r1, prime256v1)
;;elliptic curve with support for ECDH, ECDSA signing/verification, and general
;;purpose curve arithmetic")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-tiny-http-0.9
;;  (package
;;    (name "rust-tiny-http")
;;    (version "0.9.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "tiny_http" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0l54wxrjahs4ac7mqj5lc2mnxcjhh99nqlaxxacpmfj9f5gmn5cn"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-ascii" ,rust-ascii-1)
;;        ("rust-chrono" ,rust-chrono-0.4)
;;        ("rust-chunked-transfer" ,rust-chunked-transfer-1)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-openssl" ,rust-openssl-0.10)
;;        ("rust-url" ,rust-url-2))))
;;    (home-page "https://github.com/tiny-http/tiny-http")
;;    (synopsis "Low level HTTP server library")
;;    (description "Low level HTTP server library")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-uriparse-0.6
;;  (package
;;    (name "rust-uriparse")
;;    (version "0.6.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "uriparse" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1zsjwc715x4720y4b3dsdras50imvaakqgyl59n3j2fq0kyd0002"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-fnv" ,rust-fnv-1)
;;        ("rust-lazy-static" ,rust-lazy-static-1)
;;        ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/sgodwincs/uriparse-rs")
;;    (synopsis "A URI parser including relative references")
;;    (description
;;     "This package provides a URI parser including relative references")
;;    (license license:expat)))
;;
;;(define-public rust-pkcs11-uri-0.1
;;  (package
;;    (name "rust-pkcs11-uri")
;;    (version "0.1.3")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "pkcs11-uri" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0nkl6l0r70cfdm1grlkwlk2g5s1sg6n80ris905np6rjmswqnvdr"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-anyhow" ,rust-anyhow-1)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-percent-encoding" ,rust-percent-encoding-2)
;;        ("rust-pkcs11" ,rust-pkcs11-0.5)
;;        ("rust-uriparse" ,rust-uriparse-0.6))))
;;    (home-page "")
;;    (synopsis "PKCS #11 URI parser")
;;    (description "PKCS #11 URI parser")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-pkcs11-0.5
;;  (package
;;    (name "rust-pkcs11")
;;    (version "0.5.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "pkcs11" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1bqhdd4w0ymvv6zzc090vy2mywq07lix16am8pz3nqf8wiknvjis"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-libloading" ,rust-libloading-0.5)
;;         ("rust-num-bigint" ,rust-num-bigint-0.2))))
;;    (home-page "https://github.com/mheese/rust-pkcs11")
;;    (synopsis "Rust PKCS#11 Library")
;;    (description "Rust PKCS#11 Library")
;;    (license license:asl2.0)))
;;
;;(define-public rust-pem-parser-0.1
;;  (package
;;    (name "rust-pem-parser")
;;    (version "0.1.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "pem-parser" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1l3splkmb125vqrgj2agi6047afaa45id3mrs45drhn16aj9hda4"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-regex" ,rust-regex-1)
;;         ("rust-rustc-serialize" ,rust-rustc-serialize-0.3))))
;;    (home-page "https://github.com/filsmick/pem-parser-rs")
;;    (synopsis "A simple tool to convert RSA keys from PEM to DER.
;;")
;;    (description
;;      "This package provides a simple tool to convert RSA keys from PEM to DER.")
;;    (license license:expat)))
;;
;;(define-public rust-enum-iterator-derive-0.7
;;  (package
;;    (name "rust-enum-iterator-derive")
;;    (version "0.7.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "enum-iterator-derive" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0ndihb41kmi6pxc2bs097abxliw2pgnnw412lhdqfymjc1vw6d61"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/stephaneyfx/enum-iterator")
;;    (synopsis
;;      "Procedural macro to iterate over the variants of a field-less enum")
;;    (description
;;      "Procedural macro to iterate over the variants of a field-less enum")
;;    (license license:bsd-0)))
;;
;;(define-public rust-enum-iterator-0.7
;;  (package
;;    (name "rust-enum-iterator")
;;    (version "0.7.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "enum-iterator" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1rldnx6avpz39i1bwb65d4gs303p40syyfc4zqwlx7mpxp2wbsjf"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-enum-iterator-derive" ,rust-enum-iterator-derive-0.7))))
;;    (home-page "https://github.com/stephaneyfx/enum-iterator")
;;    (synopsis "Tools to iterate over the variants of a field-less enum")
;;    (description "Tools to iterate over the variants of a field-less enum")
;;    (license license:bsd-0)))
;;
;;(define-public rust-lpc55-0.1
;;  (package
;;    (name "rust-lpc55")
;;    (version "0.1.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "lpc55" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0aqw391921zlzqav3d9nf8h1cnbp66ybxi11qmbnfv4bbd74drbc"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-aes" ,rust-aes-0.7)
;;         ("rust-anyhow" ,rust-anyhow-1)
;;         ("rust-atty" ,rust-atty-0.2)
;;         ("rust-base64" ,rust-base64-0.13)
;;         ("rust-bitflags" ,rust-bitflags-1)
;;         ("rust-chrono" ,rust-chrono-0.4)
;;         ("rust-clap" ,rust-clap-3)
;;         ("rust-clap" ,rust-clap-3)
;;         ("rust-clap-complete" ,rust-clap-complete-3)
;;         ("rust-ctr" ,rust-ctr-0.8)
;;         ("rust-delog" ,rust-delog-0.1)
;;         ("rust-enum-iterator" ,rust-enum-iterator-0.7)
;;         ("rust-hex" ,rust-hex-0.4)
;;         ("rust-hidapi" ,rust-hidapi-1)
;;         ("rust-hmac" ,rust-hmac-0.12)
;;         ("rust-indicatif" ,rust-indicatif-0.16)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-nom" ,rust-nom-7)
;;         ("rust-oid-registry" ,rust-oid-registry-0.2)
;;         ("rust-pem-parser" ,rust-pem-parser-0.1)
;;         ("rust-pkcs11" ,rust-pkcs11-0.5)
;;         ("rust-pkcs11-uri" ,rust-pkcs11-uri-0.1)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-rsa" ,rust-rsa-0.5)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-serde-big-array" ,rust-serde-big-array-0.3)
;;         ("rust-serde-json" ,rust-serde-json-1)
;;         ("rust-serde-yaml" ,rust-serde-yaml-0.8)
;;         ("rust-sha2" ,rust-sha2-0.10)
;;         ("rust-signature" ,rust-signature-1)
;;         ("rust-thiserror" ,rust-thiserror-1)
;;         ("rust-tiny-http" ,rust-tiny-http-0.9)
;;         ("rust-toml" ,rust-toml-0.5)
;;         ("rust-uriparse" ,rust-uriparse-0.6)
;;         ("rust-uuid" ,rust-uuid-0.8)
;;         ("rust-x509-parser" ,rust-x509-parser-0.12))))
;;    (home-page "https://github.com/lpc55/lpc55-host")
;;    (synopsis
;;      "Host-side tooling to interact with LPC55 chips via the ROM bootloader")
;;    (description
;;      "Host-side tooling to interact with LPC55 chips via the ROM bootloader")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-iso7816-0.1
;;  (package
;;    (name "rust-iso7816")
;;    (version "0.1.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "iso7816" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "07f7zz7w79r9mhkw7qvsynqls1lkh7nxx5k9pv45sfqnyqpr88d9"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-delog" ,rust-delog-0.1) ("rust-heapless" ,rust-heapless-0.7))))
;;    (home-page "https://github.com/ycrypto/iso7816")
;;    (synopsis "Types for ISO 7816")
;;    (description "Types for ISO 7816")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-number-prefix-0.4
;;  (package
;;    (name "rust-number-prefix")
;;    (version "0.4.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "number_prefix" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1wvh13wvlajqxkb1filsfzbrnq0vrmrw298v2j3sy82z1rm282w3"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/ogham/rust-number-prefix")
;;    (synopsis "Library for numeric prefixes (kilo, giga, kibi).")
;;    (description "Library for numeric prefixes (kilo, giga, kibi).")
;;    (license license:expat)))
;;
;;(define-public rust-indicatif-0.16
;;  (package
;;    (name "rust-indicatif")
;;    (version "0.16.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "indicatif" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "06xyjs0kzqiqkjn60n1miwm2l87sa9p2lmzz0ymq18y72z37s81d"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-console" ,rust-console-0.15)
;;        ("rust-lazy-static" ,rust-lazy-static-1)
;;        ("rust-number-prefix" ,rust-number-prefix-0.4)
;;        ("rust-rayon" ,rust-rayon-1)
;;        ("rust-regex" ,rust-regex-1)
;;        ("rust-unicode-segmentation" ,rust-unicode-segmentation-1)
;;        ("rust-unicode-width" ,rust-unicode-width-0.1))))
;;    (home-page "https://github.com/console-rs/indicatif")
;;    (synopsis "A progress bar and cli reporting library for Rust")
;;    (description
;;     "This package provides a progress bar and cli reporting library for Rust")
;;    (license license:expat)))
;;
;;(define-public rust-hidapi-1
;;  (package
;;    (name "rust-hidapi")
;;    (version "1.3.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "hidapi" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1c4pskf88y3xwr5z2qa7zb778z8aakg2k85jgc2azhx54ps6pv62"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-cc" ,rust-cc-1)
;;        ("rust-libc" ,rust-libc-0.2)
;;        ("rust-pkg-config" ,rust-pkg-config-0.3))))
;;    (home-page "https://github.com/ruabmbua/hidapi-rs")
;;    (synopsis "Rust-y wrapper around hidapi")
;;    (description "Rust-y wrapper around hidapi")
;;    (license license:expat)))
;;
;;(define-public rust-flexiber-derive-0.1
;;  (package
;;    (name "rust-flexiber-derive")
;;    (version "0.1.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "flexiber_derive" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "09pqsagj7f5cwgjvy8c6g7hcc3f9ggrxg7bn40bp2kp78dzi832h"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-proc-macro2" ,rust-proc-macro2-1)
;;        ("rust-quote" ,rust-quote-1)
;;        ("rust-syn" ,rust-syn-1)
;;        ("rust-synstructure" ,rust-synstructure-0.12))))
;;    (home-page "https://github.com/nickray/flexiber/tree/main/derive")
;;    (synopsis
;;     "Procedural macros to derive `Decodable` and `Encodable` from `flexiber`.")
;;    (description
;;     "Procedural macros to derive `Decodable` and `Encodable` from `flexiber`.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-delog-0.1
;;  (package
;;    (name "rust-delog")
;;    (version "0.1.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "delog" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0gxhjgycg95r15p244hj6yvgrbwd515yhgzraf1x6b6h7bhclwyb"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-log" ,rust-log-0.4))))
;;    (home-page "https://github.com/nickray/delog")
;;    (synopsis
;;     "Deferred logging, an implementation and extension of Rust's standard logging facade.")
;;    (description
;;     "Deferred logging, an implementation and extension of Rust's standard logging
;;facade.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-flexiber-0.1
;;  (package
;;    (name "rust-flexiber")
;;    (version "0.1.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "flexiber" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1r9qg4bsdhl7p9hxn435lahhnnlpk65kin28b0zv1izfcqa5ppz3"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-delog" ,rust-delog-0.1)
;;        ("rust-flexiber-derive" ,rust-flexiber-derive-0.1)
;;        ("rust-heapless" ,rust-heapless-0.7))))
;;    (home-page "https://github.com/nickray/flexiber")
;;    (synopsis
;;     "Encoding and decoding of BER-TLV as described in ISO 7816-4, without allocations.")
;;    (description
;;     "Encoding and decoding of BER-TLV as described in ISO 7816-4, without
;;allocations.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-dialoguer-0.9
;;  (package
;;    (name "rust-dialoguer")
;;    (version "0.9.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "dialoguer" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1sxy4nd9kd9wslxnjdjyxgmsg5fil3dnzy63z8f07in09vd9lmv1"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-console" ,rust-console-0.15)
;;         ("rust-fuzzy-matcher" ,rust-fuzzy-matcher-0.3)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-tempfile" ,rust-tempfile-3)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/mitsuhiko/dialoguer")
;;    (synopsis "A command line prompting library.")
;;    (description "This package provides a command line prompting library.")
;;    (license license:expat)))
;;
;;(define-public rust-data-encoding-2
;;  (package
;;    (name "rust-data-encoding")
;;    (version "2.3.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "data-encoding" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0mvd8bjq5mq50fcf931cff57vwmbsvs1kpxynkzrshli98y3kqiy"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/ia0/data-encoding")
;;    (synopsis
;;     "Efficient and customizable data-encoding functions like base64, base32, and hex")
;;    (description
;;     "Efficient and customizable data-encoding functions like base64, base32, and hex")
;;    (license license:expat)))
;;
;;(define-public rust-ctrlc-3
;;  (package
;;    (name "rust-ctrlc")
;;    (version "3.2.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "ctrlc" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1gy73qwcchh802nc4vdr5cv16nnq1fr3wwkd6jih736wzznnr751"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-nix" ,rust-nix-0.23) ("rust-winapi" ,rust-winapi-0.3))))
;;    (home-page "https://github.com/Detegr/rust-ctrlc")
;;    (synopsis "Easy Ctrl-C handler for Rust projects")
;;    (description "Easy Ctrl-C handler for Rust projects")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-clap-complete-3
;;  (package
;;    (name "rust-clap-complete")
;;    (version "3.1.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "clap_complete" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "09cf3dlrbnyklw4gig8cc2dv4b1jxc1h5ca1igbxzkd3q09kcvyz"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t #:cargo-inputs (("rust-clap" ,rust-clap-3))))
;;    (home-page "https://github.com/clap-rs/clap/tree/master/clap_complete")
;;    (synopsis "Generate shell completion scripts for your clap::Command")
;;    (description "Generate shell completion scripts for your clap::Command")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-unicode-linebreak-0.1
;;  (package
;;    (name "rust-unicode-linebreak")
;;    (version "0.1.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "unicode-linebreak" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0grq6bsn967q4vpifld53s7a140nlmpq5vy8ghgr73f4n2mdqlis"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-regex" ,rust-regex-1))))
;;    (home-page "https://github.com/axelf4/unicode-linebreak")
;;    (synopsis "Implementation of the Unicode Line Breaking Algorithm")
;;    (description "Implementation of the Unicode Line Breaking Algorithm")
;;    (license license:asl2.0)))
;;
;;(define-public rust-terminal-size-0.1
;;  (package
;;    (name "rust-terminal-size")
;;    (version "0.1.17")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "terminal_size" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1pq60ng1a7fjp597ifk1cqlz8fv9raz9xihddld1m1pfdia1lg33"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-libc" ,rust-libc-0.2) ("rust-winapi" ,rust-winapi-0.3))))
;;    (home-page "https://github.com/eminence/terminal-size")
;;    (synopsis "Gets the size of your Linux or Windows terminal")
;;    (description "Gets the size of your Linux or Windows terminal")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-openblas-src-0.9
;;  (package
;;    (name "rust-openblas-src")
;;    (version "0.9.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "openblas-src" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0syy38a5bgv5mj6mb1n1zk1d6l5gqqrswvbmwkwx6h4z9wfrsql4"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/blas-lapack-rs/openblas-src")
;;    (synopsis "The package provides a source of BLAS and LAPACK via OpenBLAS.")
;;    (description
;;     "The package provides a source of BLAS and LAPACK via OpenBLAS.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-netlib-src-0.8
;;  (package
;;    (name "rust-netlib-src")
;;    (version "0.8.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "netlib-src" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "04l2ggdaq0bjc64prsw2f8ddxn84m1rmpnkjb9nr0ijdpcv1zx1r"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-cmake" ,rust-cmake-0.1))))
;;    (home-page "https://github.com/blas-lapack-rs/netlib-src")
;;    (synopsis "The package provides a source of BLAS and LAPACK via Netlib.")
;;    (description
;;     "The package provides a source of BLAS and LAPACK via Netlib.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-intel-mkl-tool-0.1
;;  (package
;;   (name "rust-intel-mkl-tool")
;;   (version "0.1.0")
;;   (source
;;    (origin
;;     (method url-fetch)
;;     (uri (crate-uri "intel-mkl-tool" version))
;;     (file-name (string-append name "-" version ".tar.gz"))
;;     (sha256
;;      (base32 "1myyrxvmyij4c60w9x15npwzhlbjm8y8c94lvfsnrl5pbyakz8md"))))
;;   (build-system cargo-build-system)
;;   (arguments
;;    `(#:skip-build?
;;      #t
;;      #:cargo-inputs
;;      (("rust-curl" ,rust-curl-0.4)
;;       ("rust-dirs" ,rust-dirs-2)
;;       ("rust-env-logger" ,rust-env-logger-0.7)
;;       ("rust-failure" ,rust-failure-0.1)
;;       ("rust-glob" ,rust-glob-0.3)
;;       ("rust-log" ,rust-log-0.4)
;;       ("rust-pkg-config" ,rust-pkg-config-0.3)
;;       ("rust-structopt" ,rust-structopt-0.3)
;;       ("rust-tar" ,rust-tar-0.4)
;;       ("rust-zstd" ,rust-zstd-safe))))
;;   (home-page "https://github.com/rust-math/intel-mkl-src")
;;   (synopsis "CLI utility for redistributiing Intel(R) MKL")
;;   (description "CLI utility for redistributiing Intel(R) MKL")
;;   (license license:expat)))
;;
;;(define-public rust-accelerate-src-0.3
;;  (package
;;    (name "rust-accelerate-src")
;;    (version "0.3.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "accelerate-src" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "17fiqyq7f9k41pbsyrvk9pxyx9z6fw399wq036cvwkbmb14xcpj1"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/blas-lapack-rs/accelerate-src")
;;    (synopsis
;;     "The package provides a source of BLAS and LAPACK via the Accelerate framework.")
;;    (description
;;     "The package provides a source of BLAS and LAPACK via the Accelerate framework.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-blas-src-0.6
;;  (package
;;    (name "rust-blas-src")
;;    (version "0.6.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "blas-src" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0a134wadi4rslfqk4mafi6y7bbvacjh12x87621w4vyc3dni6px2"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-accelerate-src" ,rust-accelerate-src-0.3)
;;        ("rust-netlib-src" ,rust-netlib-src-0.8)
;;        ("rust-openblas-src" ,rust-openblas-src-0.9))))
;;    (home-page "https://github.com/blas-lapack-rs/blas-src")
;;    (synopsis "The package provides a BLAS source of choice.")
;;    (description "The package provides a BLAS source of choice.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-ndarray-0.14
;;  (package
;;    (name "rust-ndarray")
;;    (version "0.14.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ndarray" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "011wqzmrd9gpfcfvy1xfbskqfiahn96pmi2d0r9x34d682amq3bc"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-approx" ,rust-approx-0.4)
;;        ("rust-blas-src" ,rust-blas-src-0.6)
;;        ("rust-cblas-sys" ,rust-cblas-sys-0.1)
;;        ("rust-matrixmultiply" ,rust-matrixmultiply-0.2)
;;        ("rust-num-complex" ,rust-num-complex-0.3)
;;        ("rust-num-integer" ,rust-num-integer-0.1)
;;        ("rust-num-traits" ,rust-num-traits-0.2)
;;        ("rust-rawpointer" ,rust-rawpointer-0.2)
;;        ("rust-rayon" ,rust-rayon-1)
;;        ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/rust-ndarray/ndarray")
;;    (synopsis
;;     "An n-dimensional array for general elements and for numerics. Lightweight array views and slicing; views support chunking and splitting.")
;;    (description
;;     "An n-dimensional array for general elements and for numerics.  Lightweight array
;;views and slicing; views support chunking and splitting.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-smawk-0.3
;;  (package
;;    (name "rust-smawk")
;;    (version "0.3.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "smawk" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0hv0q1mw1r1brk7v3g4a80j162p7g1dri4bdidykrakzfqjd4ypn"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-ndarray" ,rust-ndarray-0.14))))
;;    (home-page "https://github.com/mgeisler/smawk")
;;    (synopsis "Functions for finding row-minima in a totally monotone matrix.")
;;    (description
;;     "This package provides functions for finding row-minima in a totally monotone
;;matrix.")
;;    (license license:expat)))
;;
;;(define-public rust-hyphenation-commons-0.8
;;  (package
;;    (name "rust-hyphenation-commons")
;;    (version "0.8.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "hyphenation_commons" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1gq59h9h8597k04yl53an0j56cvb0in98pxpp27dkiz5mnifgssz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-fst" ,rust-fst-0.4) ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/tapeinosyne/hyphenation")
;;    (synopsis "Proemial code for the `hyphenation` library")
;;    (description "Proemial code for the `hyphenation` library")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-fst-0.4
;;  (package
;;    (name "rust-fst")
;;    (version "0.4.7")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "fst" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "06mnksicgv9rp8b7w0ykkshf355l05zym3ygm74qr5z30ndmpf3s"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-utf8-ranges" ,rust-utf8-ranges-1))))
;;    (home-page "https://github.com/BurntSushi/fst")
;;    (synopsis
;;     "Use finite state transducers to compactly represents sets or maps of many
;;strings (> 1 billion is possible).
;;")
;;    (description
;;     "Use finite state transducers to compactly represents sets or maps of many
;;strings (> 1 billion is possible).")
;;    (license (list license:unlicense license:expat))))
;;
;;(define-public rust-hyphenation-0.8
;;  (package
;;    (name "rust-hyphenation")
;;    (version "0.8.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "hyphenation" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1w2hib167vpz7jbg3zs92ifihj4akirlhb5509aib1df8i6dvx5w"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bincode" ,rust-bincode-1)
;;        ("rust-bincode" ,rust-bincode-1)
;;        ("rust-fst" ,rust-fst-0.4)
;;        ("rust-fst" ,rust-fst-0.4)
;;        ("rust-hyphenation-commons" ,rust-hyphenation-commons-0.8)
;;        ("rust-hyphenation-commons" ,rust-hyphenation-commons-0.8)
;;        ("rust-pocket-resources" ,rust-pocket-resources-0.3)
;;        ("rust-serde" ,rust-serde-1)
;;        ("rust-serde" ,rust-serde-1)
;;        ("rust-unicode-normalization" ,rust-unicode-normalization-0.1))))
;;    (home-page "https://github.com/tapeinosyne/hyphenation")
;;    (synopsis "Knuth-Liang hyphenation for a variety of languages")
;;    (description "Knuth-Liang hyphenation for a variety of languages")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-textwrap-0.15
;;  (package
;;    (name "rust-textwrap")
;;    (version "0.15.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "textwrap" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1yw513k61lfiwgqrfvsjw1a5wpvm0azhpjr2kr0jhnq9c56is55i"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-hyphenation" ,rust-hyphenation-0.8)
;;        ("rust-smawk" ,rust-smawk-0.3)
;;        ("rust-terminal-size" ,rust-terminal-size-0.1)
;;        ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
;;        ("rust-unicode-width" ,rust-unicode-width-0.1))))
;;    (home-page "https://github.com/mgeisler/textwrap")
;;    (synopsis
;;     "Powerful library for word wrapping, indenting, and dedenting strings")
;;    (description
;;     "Powerful library for word wrapping, indenting, and dedenting strings")
;;    (license license:expat)))
;;
;;(define-public rust-uniquote-3
;;  (package
;;    (name "rust-uniquote")
;;    (version "3.0.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "uniquote" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0gqwq3kbzdsj5qsc8jfm5v4qwzgnp4rrfvdpm71ch1593h22y664"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/dylni/uniquote")
;;    (synopsis "Quote strings for clear display in output
;;")
;;    (description "Quote strings for clear display in output")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-print-bytes-0.5
;;  (package
;;    (name "rust-print-bytes")
;;    (version "0.5.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "print_bytes" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0d4i9y3jx1chi6w97a8rgdbwm9g3cppr53rw53zl6fcaq31qx0b6"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-winapi" ,rust-winapi-0.3))))
;;    (home-page "https://github.com/dylni/print_bytes")
;;    (synopsis "Print bytes as losslessly as possible
;;")
;;    (description "Print bytes as losslessly as possible")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-os-str-bytes-6
;;  (package
;;    (name "rust-os-str-bytes")
;;    (version "6.0.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "os_str_bytes" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0r5z5xds2wzzqlqjaw96dpjsz5nqyzc1rflm4mh09aa32qyl88lf"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-memchr" ,rust-memchr-2)
;;        ("rust-print-bytes" ,rust-print-bytes-0.5)
;;        ("rust-uniquote" ,rust-uniquote-3))))
;;    (home-page "https://github.com/dylni/os_str_bytes")
;;    (synopsis
;;     "Utilities for converting between byte sequences and platform-native strings
;;")
;;    (description
;;     "Utilities for converting between byte sequences and platform-native strings")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-clap-derive-3
;;  (package
;;    (name "rust-clap-derive")
;;    (version "3.1.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "clap_derive" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "05mz2y6k73wc1gvv9r4mllfqslzvlwkvx77lk7769ag1xlwd15fs"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-heck" ,rust-heck-0.4)
;;        ("rust-proc-macro-error" ,rust-proc-macro-error-1)
;;        ("rust-proc-macro2" ,rust-proc-macro2-1)
;;        ("rust-quote" ,rust-quote-1)
;;        ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/clap-rs/clap/tree/master/clap_derive")
;;    (synopsis
;;     "Parse command line argument by defining a struct, derive crate.")
;;    (description
;;     "Parse command line argument by defining a struct, derive crate.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-clap-3
;;  (package
;;    (name "rust-clap")
;;    (version "3.1.6")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "clap" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "08q1hkksfixybnrwrpm44xq028wbn9yr2hnzrax9hihyq8v39jfq"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-atty" ,rust-atty-0.2)
;;        ("rust-backtrace" ,rust-backtrace-0.3)
;;        ("rust-bitflags" ,rust-bitflags-1)
;;        ("rust-clap-derive" ,rust-clap-derive-3)
;;        ("rust-indexmap" ,rust-indexmap-1)
;;        ("rust-lazy-static" ,rust-lazy-static-1)
;;        ("rust-os-str-bytes" ,rust-os-str-bytes-6)
;;        ("rust-regex" ,rust-regex-1)
;;        ("rust-strsim" ,rust-strsim-0.10)
;;        ("rust-termcolor" ,rust-termcolor-1)
;;        ("rust-terminal-size" ,rust-terminal-size-0.1)
;;        ("rust-textwrap" ,rust-textwrap-0.15)
;;        ("rust-unicase" ,rust-unicase-2)
;;        ("rust-yaml-rust" ,rust-yaml-rust-0.4))))
;;    (home-page "https://github.com/clap-rs/clap")
;;    (synopsis
;;     "A simple to use, efficient, and full-featured Command Line Argument Parser")
;;    (description
;;     "This package provides a simple to use, efficient, and full-featured Command Line
;;Argument Parser")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-solo2-0.1
;;  (package
;;    (name "rust-solo2")
;;    (version "0.1.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "solo2" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1g53qqnzwh6zb8f5lbdq8hpkvp9j6x23a59hps7hsvx6cgj0micw"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:cargo-inputs
;;       (("rust-anyhow" ,rust-anyhow-1)
;;        ("rust-atty" ,rust-atty-0.2)
;;        ("rust-chrono" ,rust-chrono-0.4)
;;        ("rust-clap" ,rust-clap-3)
;;        ("rust-clap" ,rust-clap-3)
;;        ("rust-clap-complete" ,rust-clap-complete-3)
;;        ("rust-ctrlc" ,rust-ctrlc-3)
;;        ("rust-data-encoding" ,rust-data-encoding-2)
;;        ("rust-dialoguer" ,rust-dialoguer-0.9)
;;        ("rust-flexiber" ,rust-flexiber-0.1)
;;        ("rust-getrandom" ,rust-getrandom-0.2)
;;        ("rust-hex" ,rust-hex-0.4)
;;        ("rust-hex-literal" ,rust-hex-literal-0.3)
;;        ("rust-hidapi" ,rust-hidapi-1)
;;        ("rust-indicatif" ,rust-indicatif-0.16)
;;        ("rust-iso7816" ,rust-iso7816-0.1)
;;        ("rust-lazy-static" ,rust-lazy-static-1)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-lpc55" ,rust-lpc55-0.1)
;;        ("rust-p256" ,rust-p256-0.10)
;;        ("rust-pcsc" ,rust-pcsc-2)
;;        ("rust-pkcs8" ,rust-pkcs8-0.8)
;;        ("rust-pretty-env-logger" ,rust-pretty-env-logger-0.4)
;;        ("rust-rand-core" ,rust-rand-core-0.6)
;;        ("rust-rcgen" ,rust-rcgen-0.8)
;;        ("rust-serde-json" ,rust-serde-json-1)
;;        ("rust-sha-1" ,rust-sha-1-0.10)
;;        ("rust-sha2" ,rust-sha2-0.10)
;;        ("rust-ureq" ,rust-ureq-2)
;;        ("rust-x509-parser" ,rust-x509-parser-0.12)
;;        ("rust-yasna" ,rust-yasna-0.4))))
;;    (native-inputs
;;     (list pkg-config))
;;    (inputs
;;     (list eudev))
;;    (home-page "https://github.com/solokeys/solo2-cli")
;;    (synopsis "Library and CLI for the SoloKeys Solo 2 security key")
;;    (description "Library and CLI for the SoloKeys Solo 2 security key")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-zeroize-1
;;  (package
;;    (name "rust-zeroize")
;;    (version "1.4.3")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "zeroize" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "068nvl3n5hk6lfn5y24grf2c7anzzqfzjjccscq3md7rqp79v3fn"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:cargo-inputs (("rust-zeroize-derive" ,rust-zeroize-derive-1))))
;;    (home-page "https://github.com/RustCrypto/utils/tree/master/zeroize")
;;    (synopsis
;;     "Securely clear secrets from memory with a simple trait built on
;;stable Rust primitives which guarantee memory is zeroed using an
;;operation will not be 'optimized away' by the compiler.
;;Uses a portable pure Rust implementation that works everywhere,
;;even WASM!
;;")
;;    (description
;;     "Securely clear secrets from memory with a simple trait built on stable Rust
;;primitives which guarantee memory is zeroed using an operation will not be
;;'optimized away' by the compiler.  Uses a portable pure Rust implementation that
;;works everywhere, even WASM!")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-urlencoding-2
;;  (package
;;    (name "rust-urlencoding")
;;    (version "2.1.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "urlencoding" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "08cq5w84imxrpyifhmx719026dzjih29gdq0ncsb1fcs08qhkfb8"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://lib.rs/urlencoding")
;;    (synopsis "A Rust library for doing URL percentage encoding.")
;;    (description
;;     "This package provides a Rust library for doing URL percentage encoding.")
;;    (license license:expat)))
;;
;;(define-public rust-tokio-uring-0.2
;;  (package
;;    (name "rust-tokio-uring")
;;    (version "0.2.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "tokio-uring" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1psnsa11dppc46zvv94sdnv94i5ipqsmnqyrai84qd4p7mhk6ah6"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bytes" ,rust-bytes-1)
;;         ("rust-io-uring" ,rust-io-uring-0.5)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-scoped-tls" ,rust-scoped-tls-1)
;;         ("rust-slab" ,rust-slab-0.4)
;;         ("rust-tokio" ,rust-tokio-1))))
;;    (home-page "https://tokio.rs")
;;    (synopsis "io-uring support for the Tokio asynchronous runtime.
;;")
;;    (description "io-uring support for the Tokio asynchronous runtime.")
;;    (license license:expat)))
;;
;;(define-public rust-http-range-0.1
;;  (package
;;    (name "rust-http-range")
;;    (version "0.1.5")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "http-range" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0wvm2p9jhbj6f9fbl1i7a0iz85nga37kx739v4p8fpqg27dwkpi1"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/bancek/rust-http-range.git")
;;    (synopsis "HTTP Range header parser")
;;    (description "HTTP Range header parser")
;;    (license license:expat)))
;;
;;(define-public rust-typenum-1
;;  (package
;;    (name "rust-typenum")
;;    (version "1.15.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "typenum" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "11yrvz1vd43gqv738yw1v75rzngjbs7iwcgzjy3cq5ywkv2imy6w"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-scale-info" ,rust-scale-info-1))))
;;    (home-page "https://github.com/paholg/typenum")
;;    (synopsis
;;      "Typenum is a Rust library for type-level numbers evaluated at
;;    compile time. It currently supports bits, unsigned integers, and signed
;;    integers. It also provides a type-level array of type-level numbers, but its
;;    implementation is incomplete.")
;;    (description
;;      "Typenum is a Rust library for type-level numbers evaluated at     compile time.
;;It currently supports bits, unsigned integers, and signed     integers.  It also
;;provides a type-level array of type-level numbers, but its     implementation is
;;incomplete.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-crypto-common-0.1
;;  (package
;;    (name "rust-crypto-common")
;;    (version "0.1.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "crypto-common" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1s1wpm88qlrp079mzh3dlxm9vbqs4ch016yp9pzhcdjygfi2r5ap"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-generic-array" ,rust-generic-array-0.14)
;;         ("rust-rand-core" ,rust-rand-core-0.6)
;;         ("rust-typenum" ,rust-typenum-1))))
;;    (home-page "https://github.com/RustCrypto/traits")
;;    (synopsis "Common cryptographic traits")
;;    (description "Common cryptographic traits")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-digest-0.10
;;  (package
;;    (name "rust-digest")
;;    (version "0.10.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "digest" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "01nmj9cci5qdm4q4wlmz104rzr68d5m823kdzd95bypslq68dyzj"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-blobby" ,rust-blobby-0.3)
;;         ("rust-block-buffer" ,rust-block-buffer-0.10)
;;         ("rust-crypto-common" ,rust-crypto-common-0.1)
;;         ("rust-subtle" ,rust-subtle-2))))
;;    (home-page "https://github.com/RustCrypto/traits")
;;    (synopsis "Traits for cryptographic hash functions")
;;    (description "Traits for cryptographic hash functions")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-hmac-0.12
;;  (package
;;    (name "rust-hmac")
;;    (version "0.12.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "hmac" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0pmbr069sfg76z7wsssfk5ddcqd9ncp79fyz6zcm6yn115yc6jbc"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build? #t #:cargo-inputs (("rust-digest" ,rust-digest-0.10))))
;;    (home-page "https://github.com/RustCrypto/MACs")
;;    (synopsis
;;      "Generic implementation of Hash-based Message Authentication Code (HMAC)")
;;    (description
;;      "Generic implementation of Hash-based Message Authentication Code (HMAC)")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-hkdf-0.12
;;  (package
;;    (name "rust-hkdf")
;;    (version "0.12.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "hkdf" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0dyl16cf15hka32hv3l7dwgr3xj3brpfr27iyrbpdhlzdfgh46kr"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build? #t #:cargo-inputs (("rust-hmac" ,rust-hmac-0.12))))
;;    (home-page "https://github.com/RustCrypto/KDFs/")
;;    (synopsis "HMAC-based Extract-and-Expand Key Derivation Function (HKDF)")
;;    (description
;;      "HMAC-based Extract-and-Expand Key Derivation Function (HKDF)")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-zeroize-1
;;  (package
;;    (name "rust-zeroize")
;;    (version "1.3.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zeroize" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1z8yix823b6lz878qwg6bvwhg3lb0cbw3c9yij9p8mbv7zdzfmj7"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-zeroize-derive" ,rust-zeroize-derive-1))))
;;    (home-page "https://github.com/RustCrypto/utils/tree/master/zeroize")
;;    (synopsis
;;      "Securely clear secrets from memory with a simple trait built on
;;stable Rust primitives which guarantee memory is zeroed using an
;;operation will not be 'optimized away' by the compiler.
;;Uses a portable pure Rust implementation that works everywhere,
;;even WASM!
;;")
;;    (description
;;      "Securely clear secrets from memory with a simple trait built on stable Rust
;;primitives which guarantee memory is zeroed using an operation will not be
;;'optimized away' by the compiler.  Uses a portable pure Rust implementation that
;;works everywhere, even WASM!")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-polyval-0.5
;;  (package
;;    (name "rust-polyval")
;;    (version "0.5.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "polyval" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1890wqvc0csc9y9k9k4gsbz91rgdnhn6xnfmy9pqkh674fvd46c4"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-cpufeatures" ,rust-cpufeatures-0.2)
;;         ("rust-opaque-debug" ,rust-opaque-debug-0.3)
;;         ("rust-universal-hash" ,rust-universal-hash-0.4)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/universal-hashes")
;;    (synopsis
;;      "POLYVAL is a GHASH-like universal hash over GF(2^128) useful for constructing
;;a Message Authentication Code (MAC)
;;")
;;    (description
;;      "POLYVAL is a GHASH-like universal hash over GF(2^128) useful for constructing a
;;Message Authentication Code (MAC)")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-ghash-0.4
;;  (package
;;    (name "rust-ghash")
;;    (version "0.4.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "ghash" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "169wvrc2k9lw776x3pmqp76kc0w5717wz01bfg9rz0ypaqbcr0qm"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-opaque-debug" ,rust-opaque-debug-0.3)
;;         ("rust-polyval" ,rust-polyval-0.5)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/universal-hashes")
;;    (synopsis
;;      "Universal hash over GF(2^128) useful for constructing a Message Authentication Code (MAC),
;;as in the AES-GCM authenticated encryption cipher.
;;")
;;    (description
;;      "Universal hash over GF(2^128) useful for constructing a Message Authentication
;;Code (MAC), as in the AES-GCM authenticated encryption cipher.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-aead-0.4
;;  (package
;;    (name "rust-aead")
;;    (version "0.4.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "aead" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0xw8kp9j1whfdxhgmr2qf9xgslkg52zh6gzmhsh13y9w3s73nq8b"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-blobby" ,rust-blobby-0.3)
;;         ("rust-generic-array" ,rust-generic-array-0.14)
;;         ("rust-heapless" ,rust-heapless-0.7)
;;         ("rust-rand-core" ,rust-rand-core-0.6))))
;;    (home-page "https://github.com/RustCrypto/traits")
;;    (synopsis
;;      "Traits for Authenticated Encryption with Associated Data (AEAD) algorithms,
;;such as AES-GCM as ChaCha20Poly1305, which provide a high-level API
;;")
;;    (description
;;      "Traits for Authenticated Encryption with Associated Data (AEAD) algorithms, such
;;as AES-GCM as ChaCha20Poly1305, which provide a high-level API")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-aes-gcm-0.9
;;  (package
;;    (name "rust-aes-gcm")
;;    (version "0.9.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "aes-gcm" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1xndncn1phjb7pjam63vl0yp7h8jh95m0yxanr1092vx7al8apyz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-aead" ,rust-aead-0.4)
;;         ("rust-aes" ,rust-aes-0.7)
;;         ("rust-cipher" ,rust-cipher-0.3)
;;         ("rust-ctr" ,rust-ctr-0.8)
;;         ("rust-ghash" ,rust-ghash-0.4)
;;         ("rust-subtle" ,rust-subtle-2)
;;         ("rust-zeroize" ,rust-zeroize-1))))
;;    (home-page "https://github.com/RustCrypto/AEADs")
;;    (synopsis
;;      "Pure Rust implementation of the AES-GCM (Galois/Counter Mode)
;;Authenticated Encryption with Associated Data (AEAD) Cipher
;;with optional architecture-specific hardware acceleration
;;")
;;    (description
;;      "Pure Rust implementation of the AES-GCM (Galois/Counter Mode) Authenticated
;;Encryption with Associated Data (AEAD) Cipher with optional
;;architecture-specific hardware acceleration")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-cookie-0.16
;;  (package
;;    (name "rust-cookie")
;;    (version "0.16.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "cookie" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "01fa6z8sqqg19ya0l9ifh8vn05l5hpxdzkbh489mpymhw5np1m4l"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-aes-gcm" ,rust-aes-gcm-0.9)
;;         ("rust-base64" ,rust-base64-0.13)
;;         ("rust-hkdf" ,rust-hkdf-0.12)
;;         ("rust-hmac" ,rust-hmac-0.12)
;;         ("rust-percent-encoding" ,rust-percent-encoding-2)
;;         ("rust-rand" ,rust-rand-0.8)
;;         ("rust-sha2" ,rust-sha2-0.10)
;;         ("rust-subtle" ,rust-subtle-2)
;;         ("rust-time" ,rust-time-0.3)
;;         ("rust-version-check" ,rust-version-check-0.9))))
;;    (home-page "https://github.com/SergioBenitez/cookie-rs")
;;    (synopsis
;;      "HTTP cookie parsing and cookie jar management. Supports signed and private
;;(encrypted, authenticated) jars.
;;")
;;    (description
;;      "HTTP cookie parsing and cookie jar management.  Supports signed and private
;;(encrypted, authenticated) jars.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-web-codegen-4
;;  (package
;;    (name "rust-actix-web-codegen")
;;    (version "4.0.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-web-codegen" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1g4imsr56b82lp76k2krg0vzfv92x7kxg24y8qfvnjkhakgvw9bm"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-actix-router" ,rust-actix-router-0.5)
;;         ("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://actix.rs")
;;    (synopsis "Routing and runtime macros for Actix Web")
;;    (description "Routing and runtime macros for Actix Web")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-server-2
;;  (package
;;    (name "rust-actix-server")
;;    (version "2.1.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-server" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "096q1hj88kgzfk6zv251sn57dlswh65r8ds6pdvv18cycn74z8qd"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-actix-rt" ,rust-actix-rt-2)
;;         ("rust-actix-service" ,rust-actix-service-2)
;;         ("rust-actix-utils" ,rust-actix-utils-3)
;;         ("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-futures-util" ,rust-futures-util-0.3)
;;         ("rust-mio" ,rust-mio-0.8)
;;         ("rust-num-cpus" ,rust-num-cpus-1)
;;         ("rust-socket2" ,rust-socket2-0.4)
;;         ("rust-tokio" ,rust-tokio-1)
;;         ("rust-tokio-uring" ,rust-tokio-uring-0.3)
;;         ("rust-tracing" ,rust-tracing-0.1))))
;;    (home-page "https://actix.rs")
;;    (synopsis "General purpose TCP server built for the Actix ecosystem")
;;    (description "General purpose TCP server built for the Actix ecosystem")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-memchr-2
;;  (package
;;    (name "rust-memchr")
;;    (version "2.5.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "memchr" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0vanfk5mzs1g1syqnj03q8n0syggnhn55dq535h2wxr7rwpfbzrd"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
;;    (home-page "https://github.com/BurntSushi/memchr")
;;    (synopsis "Safe interface to memchr.")
;;    (description "Safe interface to memchr.")
;;    (license (list license:unlicense license:expat))))
;;
;;(define-public rust-quick-xml-0.23
;;  (package
;;    (name "rust-quick-xml")
;;    (version "0.23.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "quick-xml" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1k6y8q4sqy4mywdg66lk2km30vnhqfnf1awckmasyfxdrbdgnycj"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-encoding-rs" ,rust-encoding-rs-0.8)
;;         ("rust-memchr" ,rust-memchr-2)
;;         ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/tafia/quick-xml")
;;    (synopsis "High performance xml reader and writer")
;;    (description "High performance xml reader and writer")
;;    (license license:expat)))
;;
;;(define-public rust-inferno-0.11
;;  (package
;;    (name "rust-inferno")
;;    (version "0.11.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "inferno" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "07i7a6wq6mj2dznpqk1bhzb0ivgs9za22r36j7sch0crb4av4g0s"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-ahash" ,rust-ahash-0.7)
;;         ("rust-atty" ,rust-atty-0.2)
;;         ("rust-clap" ,rust-clap-3)
;;         ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
;;         ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
;;         ("rust-dashmap" ,rust-dashmap-5)
;;         ("rust-env-logger" ,rust-env-logger-0.9)
;;         ("rust-indexmap" ,rust-indexmap-1)
;;         ("rust-itoa" ,rust-itoa-1)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-num-format" ,rust-num-format-0.4)
;;         ("rust-num-cpus" ,rust-num-cpus-1)
;;         ("rust-quick-xml" ,rust-quick-xml-0.23)
;;         ("rust-rgb" ,rust-rgb-0.8)
;;         ("rust-str-stack" ,rust-str-stack-0.1))))
;;    (home-page "https://github.com/jonhoo/inferno.git")
;;    (synopsis "Rust port of the FlameGraph performance profiling tool suite")
;;    (description
;;      "Rust port of the FlameGraph performance profiling tool suite")
;;    (license license:cddl1.0)))
;;
;;(define-public rust-firestorm-enabled-0.5
;;  (package
;;    (name "rust-firestorm-enabled")
;;    (version "0.5.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm-enabled" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0cxg3llgcglsqbpp3liqmfm0j4q507k4qbzykszwxgm6s0vmam94"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-firestorm-core" ,rust-firestorm-core-0.1)
;;         ("rust-inferno" ,rust-inferno-0.11))))
;;    (home-page "")
;;    (synopsis "A dependency of firestorm. Do not use directly.")
;;    (description
;;      "This package provides a dependency of firestorm.  Do not use directly.")
;;    (license license:expat)))
;;
;;(define-public rust-firestorm-enabled-0.4
;;  (package
;;    (name "rust-firestorm-enabled")
;;    (version "0.4.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm-enabled" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1mnxldrs2fk0a0n1q9mvp5z92r945mzzg14m50jdckw1gm6xsqwi"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-firestorm-core" ,rust-firestorm-core-0.1)
;;         ("rust-inferno" ,rust-inferno-0.10))))
;;    (home-page "")
;;    (synopsis "A dependency of firestorm. Do not use directly.")
;;    (description
;;      "This package provides a dependency of firestorm.  Do not use directly.")
;;    (license license:expat)))
;;
;;(define-public rust-str-stack-0.1
;;  (package
;;    (name "rust-str-stack")
;;    (version "0.1.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "str_stack" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1sxl8xd8kiaffsryqpfwcb02lnd3djfin7gf38ag5980908vd4ch"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/Stebalien/str_stack")
;;    (synopsis
;;      "A string allocator for allocating many write-once strings.
;;
;;This library is primarily useful for parsing where you need to repeatedly build
;;many strings, use them, and then throw them away. Instead of allocating many independent strings, this library will put them all in the same buffer.
;;")
;;    (description
;;      "This package provides a string allocator for allocating many write-once strings.
;;
;;This library is primarily useful for parsing where you need to repeatedly build
;;many strings, use them, and then throw them away.  Instead of allocating many
;;independent strings, this library will put them all in the same buffer.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-unicode-ident-1
;;  (package
;;    (name "rust-unicode-ident")
;;    (version "1.0.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "unicode-ident" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1vlksh7rxnkakdc5qiwxix6fng9a5cw9v8dfnkf5xsx1zdlg0anj"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/dtolnay/unicode-ident")
;;    (synopsis
;;      "Determine whether characters have the XID_Start or XID_Continue properties according to Unicode Standard Annex #31")
;;    (description
;;      "Determine whether characters have the XID_Start or XID_Continue properties
;;according to Unicode Standard Annex #31")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-proc-macro2-1
;;  (package
;;    (name "rust-proc-macro2")
;;    (version "1.0.39")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "proc-macro2" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0vzm2m7rq6sym9w73ca3hpc5m9wkwm500hyya6bgrdr5j1b2ajy5"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-unicode-ident" ,rust-unicode-ident-1))))
;;    (home-page "https://github.com/dtolnay/proc-macro2")
;;    (synopsis
;;      "A substitute implementation of the compiler's `proc_macro` API to decouple
;;token-based libraries from the procedural macro use case.
;;")
;;    (description
;;      "This package provides a substitute implementation of the compiler's `proc_macro`
;;API to decouple token-based libraries from the procedural macro use case.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-syn-1
;;  (package
;;    (name "rust-syn")
;;    (version "1.0.95")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "syn" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0hprqgqywlv4z9piq6ygjh0shq7xfkxkc8braafz6949mcb63bzv"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-unicode-ident" ,rust-unicode-ident-1))))
;;    (home-page "https://github.com/dtolnay/syn")
;;    (synopsis "Parser for Rust source code")
;;    (description "Parser for Rust source code")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-serde-derive-1
;;  (package
;;    (name "rust-serde-derive")
;;    (version "1.0.137")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde_derive" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1gkqhpw86zvppd0lwa8ljzpglwczxq3d7cnkfwirfn9r1jxgl9hz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://serde.rs")
;;    (synopsis "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
;;    (description
;;      "Macros 1.1 implementation of #[derive(Serialize, Deserialize)]")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-serde-1
;;  (package
;;    (name "rust-serde")
;;    (version "1.0.137")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "serde" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1l8pynxnmld179a33l044yvkigq3fhiwgx0518a1b0vzqxa8vsk1"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-serde-derive" ,rust-serde-derive-1))))
;;    (home-page "https://serde.rs")
;;    (synopsis "A generic serialization/deserialization framework")
;;    (description
;;      "This package provides a generic serialization/deserialization framework")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-rayon-core-1
;;  (package
;;    (name "rust-rayon-core")
;;    (version "1.9.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "rayon-core" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0gv8k6612gc24kqqm4440f5qfx6gnyv2v6dj3d4libbdmjswv2r5"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
;;         ("rust-crossbeam-deque" ,rust-crossbeam-deque-0.8)
;;         ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
;;         ("rust-num-cpus" ,rust-num-cpus-1))))
;;    (home-page "https://github.com/rayon-rs/rayon")
;;    (synopsis "Core APIs for Rayon")
;;    (description "Core APIs for Rayon")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-crossbeam-deque-0.8
;;  (package
;;    (name "rust-crossbeam-deque")
;;    (version "0.8.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "crossbeam-deque" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "07nypn86id2lf912ahiww1jvqp0zbk2xa25ra7vzplph375c0mb4"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-crossbeam-epoch" ,rust-crossbeam-epoch-0.9)
;;         ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8))))
;;    (home-page
;;      "https://github.com/crossbeam-rs/crossbeam/tree/master/crossbeam-deque")
;;    (synopsis "Concurrent work-stealing deque")
;;    (description "Concurrent work-stealing deque")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-rayon-1
;;  (package
;;    (name "rust-rayon")
;;    (version "1.5.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "rayon" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0z9sjcy1hnnvgkwx3cn1x44pf24jpwarp3172m9am2xd5rvyb6dx"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-autocfg" ,rust-autocfg-1)
;;         ("rust-crossbeam-deque" ,rust-crossbeam-deque-0.8)
;;         ("rust-either" ,rust-either-1)
;;         ("rust-rayon-core" ,rust-rayon-core-1))))
;;    (home-page "https://github.com/rayon-rs/rayon")
;;    (synopsis "Simple work-stealing parallelism for Rust")
;;    (description "Simple work-stealing parallelism for Rust")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-simd-adler32-0.3
;;  (package
;;    (name "rust-simd-adler32")
;;    (version "0.3.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "simd-adler32" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "060b9v15s3miq06582cj2ywam92ph6xs34s62mc8az3xc4wxz98l"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/mcountryman/simd-adler32")
;;    (synopsis
;;      "A SIMD-accelerated Adler-32 rolling hash algorithm implementation.")
;;    (description
;;      "This package provides a SIMD-accelerated Adler-32 rolling hash algorithm
;;implementation.")
;;    (license license:expat)))
;;
;;(define-public rust-adler-1
;;  (package
;;    (name "rust-adler")
;;    (version "1.0.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "adler" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1zim79cvzd5yrkzl3nyfx0avijwgk9fqv3yrscdy1cc79ih02qpj"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
;;    (home-page "https://github.com/jonas-schievink/adler.git")
;;    (synopsis "A simple clean-room implementation of the Adler-32 checksum")
;;    (description
;;      "This package provides a simple clean-room implementation of the Adler-32
;;checksum")
;;    (license (list license:bsd-0 license:expat license:asl2.0))))
;;
;;(define-public rust-miniz-oxide-0.5
;;  (package
;;    (name "rust-miniz-oxide")
;;    (version "0.5.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "miniz_oxide" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1k1wfxb35v129mhqy14yqhrj3wvknafrwygiq7zvi0m5iml7ap3g"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-adler" ,rust-adler-1)
;;         ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
;;         ("rust-simd-adler32" ,rust-simd-adler32-0.3))))
;;    (home-page "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
;;    (synopsis
;;      "DEFLATE compression and decompression library rewritten in Rust based on miniz")
;;    (description
;;      "DEFLATE compression and decompression library rewritten in Rust based on miniz")
;;    (license (list license:expat license:zlib license:asl2.0))))
;;
;;(define-public rust-object-0.27
;;  (package
;;    (name "rust-object")
;;    (version "0.27.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "object" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1ygv9zgi9wz6q5f2z9xn72i0c97jjr1dgj30kbyicdhxk8zivb37"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-crc32fast" ,rust-crc32fast-1)
;;         ("rust-flate2" ,rust-flate2-1)
;;         ("rust-indexmap" ,rust-indexmap-1)
;;         ("rust-memchr" ,rust-memchr-2)
;;         ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
;;         ("rust-wasmparser" ,rust-wasmparser-0.57))))
;;    (home-page "https://github.com/gimli-rs/object")
;;    (synopsis
;;      "A unified interface for reading and writing object file formats.")
;;    (description
;;      "This package provides a unified interface for reading and writing object file
;;formats.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-gimli-0.26
;;  (package
;;    (name "rust-gimli")
;;    (version "0.26.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "gimli" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1m0vi36ypv4gx9gzcw6y456yqnlypizhwlcqrmg6vkwd0lnkgk3q"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
;;         ("rust-indexmap" ,rust-indexmap-1)
;;         ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
;;         ("rust-stable-deref-trait" ,rust-stable-deref-trait-1))))
;;    (home-page "https://github.com/gimli-rs/gimli")
;;    (synopsis "A library for reading and writing the DWARF debugging format.")
;;    (description
;;      "This package provides a library for reading and writing the DWARF debugging
;;format.")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-addr2line-0.17
;;  (package
;;    (name "rust-addr2line")
;;    (version "0.17.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "addr2line" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0sw16zqy6w0ar633z69m7lw6gb0k1y7xj3387a8wly43ij5div5r"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-cpp-demangle" ,rust-cpp-demangle-0.3)
;;         ("rust-fallible-iterator" ,rust-fallible-iterator-0.2)
;;         ("rust-gimli" ,rust-gimli-0.26)
;;         ("rust-object" ,rust-object-0.27)
;;         ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
;;         ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
;;         ("rust-smallvec" ,rust-smallvec-1))))
;;    (home-page "https://github.com/gimli-rs/addr2line")
;;    (synopsis
;;      "A cross-platform symbolication library written in Rust, using `gimli`")
;;    (description
;;      "This package provides a cross-platform symbolication library written in Rust,
;;using `gimli`")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-backtrace-0.3
;;  (package
;;    (name "rust-backtrace")
;;    (version "0.3.65")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "backtrace" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0qggp0d8pbw5vfnpm0r7lrn6wmh5yjiz4yc4bzynb8l26i2pv88i"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-addr2line" ,rust-addr2line-0.17)
;;         ("rust-cc" ,rust-cc-1)
;;         ("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-cpp-demangle" ,rust-cpp-demangle-0.3)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-miniz-oxide" ,rust-miniz-oxide-0.5)
;;         ("rust-object" ,rust-object-0.28)
;;         ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
;;         ("rust-rustc-serialize" ,rust-rustc-serialize-0.3)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-winapi" ,rust-winapi-0.3))))
;;    (home-page "https://github.com/rust-lang/backtrace-rs")
;;    (synopsis
;;      "A library to acquire a stack trace (backtrace) at runtime in a Rust program.
;;")
;;    (description
;;      "This package provides a library to acquire a stack trace (backtrace) at runtime
;;in a Rust program.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-parking-lot-core-0.9
;;  (package
;;    (name "rust-parking-lot-core")
;;    (version "0.9.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "parking_lot_core" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0ab95rljb99rm51wcic16jgbajcr6lgbqkrr21w7bc2wyb5pk8h9"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-backtrace" ,rust-backtrace-0.3)
;;         ("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-petgraph" ,rust-petgraph-0.6)
;;         ("rust-redox-syscall" ,rust-redox-syscall-0.2)
;;         ("rust-smallvec" ,rust-smallvec-1)
;;         ("rust-thread-id" ,rust-thread-id-4)
;;         ("rust-windows-sys" ,rust-windows-sys-0.36))))
;;    (home-page "https://github.com/Amanieu/parking_lot")
;;    (synopsis
;;      "An advanced API for creating custom synchronization primitives.")
;;    (description
;;      "An advanced API for creating custom synchronization primitives.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-autocfg-1
;;  (package
;;    (name "rust-autocfg")
;;    (version "1.1.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "autocfg" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1ylp3cb47ylzabimazvbz9ms6ap784zhb6syaz6c1jqpmcmq0s6l"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/cuviper/autocfg")
;;    (synopsis "Automatic cfg for Rust compiler features")
;;    (description "Automatic cfg for Rust compiler features")
;;    (license (list license:asl2.0 license:expat))))
;;
;;(define-public rust-lock-api-0.4
;;  (package
;;    (name "rust-lock-api")
;;    (version "0.4.7")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "lock_api" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0lwckl9l51y69bwf854kmdmmr1543spbxaa9xjclc3lllsvaazrj"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-autocfg" ,rust-autocfg-1)
;;         ("rust-owning-ref" ,rust-owning-ref-0.4)
;;         ("rust-scopeguard" ,rust-scopeguard-1)
;;         ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/Amanieu/parking_lot")
;;    (synopsis
;;      "Wrappers to create fully-featured Mutex and RwLock types. Compatible with no_std.")
;;    (description
;;      "Wrappers to create fully-featured Mutex and RwLock types.  Compatible with
;;no_std.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-hashbrown-0.12
;;  (package
;;    (name "rust-hashbrown")
;;    (version "0.12.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "hashbrown" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1hycsz4nbnxcma1lngl66q7hlrwn1scdqdj4jqghiw5bk3w4q3fv"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-ahash" ,rust-ahash-0.7)
;;         ("rust-bumpalo" ,rust-bumpalo-3)
;;         ("rust-compiler-builtins" ,rust-compiler-builtins-0.1)
;;         ("rust-rayon" ,rust-rayon-1)
;;         ("rust-rustc-std-workspace-alloc" ,rust-rustc-std-workspace-alloc-1)
;;         ("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1)
;;         ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/rust-lang/hashbrown")
;;    (synopsis "A Rust port of Google's SwissTable hash map")
;;    (description
;;      "This package provides a Rust port of Google's SwissTable hash map")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-dashmap-5
;;  (package
;;    (name "rust-dashmap")
;;    (version "5.3.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "dashmap" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "13s4rdgb2rkavsgzjks23zb0zviz7x2g8fb4jwc2xkqwkhn9359l"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-hashbrown" ,rust-hashbrown-0.12)
;;         ("rust-lock-api" ,rust-lock-api-0.4)
;;         ("rust-parking-lot-core" ,rust-parking-lot-core-0.9)
;;         ("rust-rayon" ,rust-rayon-1)
;;         ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/xacrimon/dashmap")
;;    (synopsis "Blazing fast concurrent HashMap for Rust.")
;;    (description "Blazing fast concurrent HashMap for Rust.")
;;    (license license:expat)))
;;
;;(define-public rust-textwrap-0.15
;;  (package
;;    (name "rust-textwrap")
;;    (version "0.15.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "textwrap" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1yw513k61lfiwgqrfvsjw1a5wpvm0azhpjr2kr0jhnq9c56is55i"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-hyphenation" ,rust-hyphenation-0.8)
;;         ("rust-smawk" ,rust-smawk-0.3)
;;         ("rust-terminal-size" ,rust-terminal-size-0.1)
;;         ("rust-unicode-linebreak" ,rust-unicode-linebreak-0.1)
;;         ("rust-unicode-width" ,rust-unicode-width-0.1))))
;;    (home-page "https://github.com/mgeisler/textwrap")
;;    (synopsis
;;      "Powerful library for word wrapping, indenting, and dedenting strings")
;;    (description
;;      "Powerful library for word wrapping, indenting, and dedenting strings")
;;    (license license:expat)))
;;
;;(define-public rust-clap-lex-0.2
;;  (package
;;    (name "rust-clap-lex")
;;    (version "0.2.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "clap_lex" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "04wjgd1d3rxsng70rczfzhc7lj87hmwzznhs1dp5xb9d27qkaz53"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-os-str-bytes" ,rust-os-str-bytes-6))))
;;    (home-page "https://github.com/clap-rs/clap/tree/master/clap_lex")
;;    (synopsis "Minimal, flexible command line parser")
;;    (description "Minimal, flexible command line parser")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-clap-derive-3
;;  (package
;;    (name "rust-clap-derive")
;;    (version "3.1.18")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "clap_derive" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0g53w6qkqcc122bqh51jzfg51147il643idvq1czxkr2x5306ci5"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-heck" ,rust-heck-0.4)
;;         ("rust-proc-macro-error" ,rust-proc-macro-error-1)
;;         ("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/clap-rs/clap/tree/master/clap_derive")
;;    (synopsis
;;      "Parse command line argument by defining a struct, derive crate.")
;;    (description
;;      "Parse command line argument by defining a struct, derive crate.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-clap-3
;;  (package
;;    (name "rust-clap")
;;    (version "3.1.18")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "clap" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "02s4hk9hrmm2s1j7dkbwpyd75mfzx3p8ks2chmp4ccybv95xznyj"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-atty" ,rust-atty-0.2)
;;         ("rust-backtrace" ,rust-backtrace-0.3)
;;         ("rust-bitflags" ,rust-bitflags-1)
;;         ("rust-clap-derive" ,rust-clap-derive-3)
;;         ("rust-clap-lex" ,rust-clap-lex-0.2)
;;         ("rust-indexmap" ,rust-indexmap-1)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-regex" ,rust-regex-1)
;;         ("rust-strsim" ,rust-strsim-0.10)
;;         ("rust-termcolor" ,rust-termcolor-1)
;;         ("rust-terminal-size" ,rust-terminal-size-0.1)
;;         ("rust-textwrap" ,rust-textwrap-0.15)
;;         ("rust-unicase" ,rust-unicase-2)
;;         ("rust-yaml-rust" ,rust-yaml-rust-0.4))))
;;    (home-page "https://github.com/clap-rs/clap")
;;    (synopsis
;;      "A simple to use, efficient, and full-featured Command Line Argument Parser")
;;    (description
;;      "This package provides a simple to use, efficient, and full-featured Command Line
;;Argument Parser")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-inferno-0.10
;;  (package
;;    (name "rust-inferno")
;;    (version "0.10.13")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "inferno" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1k1c22v6avmj6qwly2mlc66vsbrm2mryiawnsjcgf68lm548bgf4"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-ahash" ,rust-ahash-0.7)
;;         ("rust-atty" ,rust-atty-0.2)
;;         ("rust-clap" ,rust-clap-3)
;;         ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
;;         ("rust-crossbeam-utils" ,rust-crossbeam-utils-0.8)
;;         ("rust-dashmap" ,rust-dashmap-5)
;;         ("rust-env-logger" ,rust-env-logger-0.9)
;;         ("rust-indexmap" ,rust-indexmap-1)
;;         ("rust-itoa" ,rust-itoa-1)
;;         ("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-num-format" ,rust-num-format-0.4)
;;         ("rust-num-cpus" ,rust-num-cpus-1)
;;         ("rust-quick-xml" ,rust-quick-xml-0.22)
;;         ("rust-rgb" ,rust-rgb-0.8)
;;         ("rust-str-stack" ,rust-str-stack-0.1))))
;;    (home-page "https://github.com/jonhoo/inferno.git")
;;    (synopsis "Rust port of the FlameGraph performance profiling tool suite")
;;    (description
;;      "Rust port of the FlameGraph performance profiling tool suite")
;;    (license license:cddl1.0)))
;;
;;(define-public rust-amd64-timer-1
;;  (package
;;    (name "rust-amd64-timer")
;;    (version "1.3.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "amd64_timer" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0lcbk9a0kjl5fmpbcs8f2l89n1x6fj7q3k581pv2vv2q8pclwpnf"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-rustc-version" ,rust-rustc-version-0.2))))
;;    (home-page "https://github.com/valarauca/amd64_timer")
;;    (synopsis "Get CPU ticks.")
;;    (description "Get CPU ticks.")
;;    (license license:expat)))
;;
;;(define-public rust-firestorm-core-0.1
;;  (package
;;    (name "rust-firestorm-core")
;;    (version "0.1.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm-core" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "04xczijsw8qzkyd13s85bmdrpac2f2lsp2sach01vava47qx2ywl"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-amd64-timer" ,rust-amd64-timer-1))))
;;    (home-page "")
;;    (synopsis "Internals for firestorm")
;;    (description "Internals for firestorm")
;;    (license license:expat)))
;;
;;(define-public rust-firestorm-enabled-0.3
;;  (package
;;    (name "rust-firestorm-enabled")
;;    (version "0.3.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm-enabled" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1qhmys2j0x25pxgixdd7pmkk0ibwvqwxcz7csy23v934vn0zzb4n"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-firestorm-core" ,rust-firestorm-core-0.1)
;;         ("rust-inferno" ,rust-inferno-0.10))))
;;    (home-page "")
;;    (synopsis "A dependency of firestorm. Do not use directly.")
;;    (description
;;      "This package provides a dependency of firestorm.  Do not use directly.")
;;    (license license:expat)))
;;
;;(define-public rust-firestorm-0.3
;;  (package
;;    (name "rust-firestorm")
;;    (version "0.3.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1bkxid4m1ib88m8lkm4xnh7k5c65va05y09vvw7dgprmn3kfpyhn"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-firestorm-enabled" ,rust-firestorm-enabled-0.3))))
;;    (home-page "https://github.com/That3Percent/firestorm")
;;    (synopsis "A low overhead intrusive flamegraph profiler.")
;;    (description
;;      "This package provides a low overhead intrusive flamegraph profiler.")
;;    (license license:expat)))
;;
;;(define-public rust-firestorm-0.4
;;  (package
;;    (name "rust-firestorm")
;;    (version "0.4.6")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "16a4cgc2hrigp86d93bh64bgrk86ln2k26iq5qb0cr0k3gd6nn1i"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-firestorm" ,rust-firestorm-0.3)
;;         ("rust-firestorm-enabled" ,rust-firestorm-enabled-0.4))))
;;    (home-page "https://github.com/That3Percent/firestorm")
;;    (synopsis "A low overhead intrusive flamegraph profiler.")
;;    (description
;;      "This package provides a low overhead intrusive flamegraph profiler.")
;;    (license license:expat)))
;;
;;(define-public rust-firestorm-0.5
;;  (package
;;    (name "rust-firestorm")
;;    (version "0.5.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "firestorm" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "162zjw9skavhmcfsjzsywwa6yj492i98ljx8m8m7x99djhn6qprc"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-firestorm" ,rust-firestorm-0.4)
;;         ("rust-firestorm-enabled" ,rust-firestorm-enabled-0.5))))
;;    (home-page "https://github.com/That3Percent/firestorm")
;;    (synopsis "A low overhead intrusive flamegraph profiler.")
;;    (description
;;      "This package provides a low overhead intrusive flamegraph profiler.")
;;    (license license:expat)))
;;
;;(define-public rust-actix-router-0.5
;;  (package
;;    (name "rust-actix-router")
;;    (version "0.5.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-router" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "107s475ghxl1sliqcjdji7272hi71a491k2n9bqg4661a9mq8q7b"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bytestring" ,rust-bytestring-0.1)
;;         ("rust-firestorm" ,rust-firestorm-0.5)
;;         ("rust-http" ,rust-http-0.2)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-regex" ,rust-regex-1)
;;         ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/actix/actix-web.git")
;;    (synopsis "Resource path matching and router")
;;    (description "Resource path matching and router")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-web-4
;;  (package
;;    (name "rust-actix-web")
;;    (version "4.0.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-web" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0cadlzb6syha1jwx0pghasj0qd47jkjy03dfldbdyl0xspzyprgl"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-actix-codec" ,rust-actix-codec-0.5)
;;         ("rust-actix-http" ,rust-actix-http-3)
;;         ("rust-actix-macros" ,rust-actix-macros-0.2)
;;         ("rust-actix-router" ,rust-actix-router-0.5)
;;         ("rust-actix-rt" ,rust-actix-rt-2)
;;         ("rust-actix-server" ,rust-actix-server-2)
;;         ("rust-actix-service" ,rust-actix-service-2)
;;         ("rust-actix-tls" ,rust-actix-tls-3)
;;         ("rust-actix-utils" ,rust-actix-utils-3)
;;         ("rust-actix-web-codegen" ,rust-actix-web-codegen-4)
;;         ("rust-ahash" ,rust-ahash-0.7)
;;         ("rust-bytes" ,rust-bytes-1)
;;         ("rust-bytestring" ,rust-bytestring-1)
;;         ("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-cookie" ,rust-cookie-0.16)
;;         ("rust-derive-more" ,rust-derive-more-0.99)
;;         ("rust-encoding-rs" ,rust-encoding-rs-0.8)
;;         ("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-futures-util" ,rust-futures-util-0.3)
;;         ("rust-itoa" ,rust-itoa-1)
;;         ("rust-language-tags" ,rust-language-tags-0.3)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-mime" ,rust-mime-0.3)
;;         ("rust-once-cell" ,rust-once-cell-1)
;;         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;         ("rust-regex" ,rust-regex-1)
;;         ("rust-serde" ,rust-serde-1)
;;         ("rust-serde-json" ,rust-serde-json-1)
;;         ("rust-serde-urlencoded" ,rust-serde-urlencoded-0.7)
;;         ("rust-smallvec" ,rust-smallvec-1)
;;         ("rust-socket2" ,rust-socket2-0.4)
;;         ("rust-time" ,rust-time-0.3)
;;         ("rust-url" ,rust-url-2))))
;;    (home-page "https://actix.rs")
;;    (synopsis
;;      "Actix Web is a powerful, pragmatic, and extremely fast web framework for Rust")
;;    (description
;;      "Actix Web is a powerful, pragmatic, and extremely fast web framework for Rust")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-zstd-sys-1
;;  (package
;;    (name "rust-zstd-sys")
;;    (version "1.6.4+zstd.1.5.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zstd-sys" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "10g6x01mamjbixpwkjdfp4rba031xvm7r8400w58lykd5wxk8q1s"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bindgen" ,rust-bindgen-0.59)
;;         ("rust-cc" ,rust-cc-1)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-pkg-config" ,rust-pkg-config-0.3))))
;;    (home-page "https://github.com/gyscos/zstd-rs")
;;    (synopsis "Low-level bindings for the zstd compression library.")
;;    (description "Low-level bindings for the zstd compression library.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-zstd-safe-4
;;  (package
;;    (name "rust-zstd-safe")
;;    (version "4.1.6+zstd.1.5.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zstd-safe" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1fz97qn7galkwl31n28cil44nxfj81ryd33v2vb041r7pd8irdll"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-libc" ,rust-libc-0.2) ("rust-zstd-sys" ,rust-zstd-sys-1))))
;;    (home-page "https://github.com/gyscos/zstd-rs")
;;    (synopsis "Safe low-level bindings for the zstd compression library.")
;;    (description "Safe low-level bindings for the zstd compression library.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-zstd-0.10
;;  (package
;;    (name "rust-zstd")
;;    (version "0.10.2+zstd.1.5.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "zstd" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0irqm1s43lj9p04026554xf8244zzxlqc8sf9gly7d929zb6njjz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-zstd-safe" ,rust-zstd-safe-4))))
;;    (home-page "https://github.com/gyscos/zstd-rs")
;;    (synopsis "Binding for the zstd compression library.")
;;    (description "Binding for the zstd compression library.")
;;    (license license:expat)))
;;
;;(define-public rust-local-channel-0.1
;;  (package
;;    (name "rust-local-channel")
;;    (version "0.1.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "local-channel" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "177wqgadrlw6m7r6xxafkj58asgpgbpv1ww4gx258v2cx703wc3z"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-futures-sink" ,rust-futures-sink-0.3)
;;         ("rust-futures-util" ,rust-futures-util-0.3)
;;         ("rust-local-waker" ,rust-local-waker-0.1))))
;;    (home-page "https://github.com/actix/actix-net.git")
;;    (synopsis
;;      "A non-threadsafe multi-producer, single-consumer, futures-aware, FIFO queue")
;;    (description
;;      "This package provides a non-threadsafe multi-producer, single-consumer,
;;futures-aware, FIFO queue")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-language-tags-0.3
;;  (package
;;    (name "rust-language-tags")
;;    (version "0.3.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "language-tags" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "124k6w9nx33q4xs8rpa9f7klshrsa0x4f7qngdwq890lpdj5jd6l"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/pyfisch/rust-language-tags")
;;    (synopsis "Language tags for Rust")
;;    (description "Language tags for Rust")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-h2-0.3
;;  (package
;;    (name "rust-h2")
;;    (version "0.3.13")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "h2" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0msasdyv0n7avs5i1csjrs0rvdsp4k5z3fwl8rd53jbzcdnjra1p"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bytes" ,rust-bytes-1)
;;         ("rust-fnv" ,rust-fnv-1)
;;         ("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-futures-sink" ,rust-futures-sink-0.3)
;;         ("rust-futures-util" ,rust-futures-util-0.3)
;;         ("rust-http" ,rust-http-0.2)
;;         ("rust-indexmap" ,rust-indexmap-1)
;;         ("rust-slab" ,rust-slab-0.4)
;;         ("rust-tokio" ,rust-tokio-1)
;;         ("rust-tokio-util" ,rust-tokio-util-0.7)
;;         ("rust-tracing" ,rust-tracing-0.1))))
;;    (home-page "https://github.com/hyperium/h2")
;;    (synopsis "An HTTP/2 client and server")
;;    (description "An HTTP/2 client and server")
;;    (license license:expat)))
;;
;;(define-public rust-bytestring-1
;;  (package
;;    (name "rust-bytestring")
;;    (version "1.0.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "bytestring" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0ka9gkn2rrxms0d5s32ckpchh06qmgidbh4xw630gfcpkshnnw4h"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bytes" ,rust-bytes-1) ("rust-serde" ,rust-serde-1))))
;;    (home-page "https://actix.rs")
;;    (synopsis "An immutable UTF-8 encoded string using Bytes as storage")
;;    (description "An immutable UTF-8 encoded string using Bytes as storage")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-brotli-3
;;  (package
;;    (name "rust-brotli")
;;    (version "3.3.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "brotli" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0s7z0nrv04wxniwijh5iig1w31sphc6lz38zc8lr7qlarkdv3851"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-alloc-no-stdlib" ,rust-alloc-no-stdlib-2)
;;         ("rust-alloc-stdlib" ,rust-alloc-stdlib-0.2)
;;         ("rust-brotli-decompressor" ,rust-brotli-decompressor-2)
;;         ("rust-packed-simd-2" ,rust-packed-simd-2-0.3)
;;         ("rust-sha2" ,rust-sha2-0.8))))
;;    (home-page "https://github.com/dropbox/rust-brotli")
;;    (synopsis
;;      "A brotli compressor and decompressor that with an interface avoiding the rust stdlib. This makes it suitable for embedded devices and kernels. It is designed with a pluggable allocator so that the standard lib's allocator may be employed. The default build also includes a stdlib allocator and stream interface. Disable this with --features=no-stdlib. All included code is safe.")
;;    (description
;;      "This package provides a brotli compressor and decompressor that with an
;;interface avoiding the rust stdlib.  This makes it suitable for embedded devices
;;and kernels.  It is designed with a pluggable allocator so that the standard
;;lib's allocator may be employed.  The default build also includes a stdlib
;;allocator and stream interface.  Disable this with --features=no-stdlib.  All
;;included code is safe.")
;;    (license (list license:bsd-3 license:expat))))
;;
;;(define-public rust-tokio-rustls-0.23
;;  (package
;;    (name "rust-tokio-rustls")
;;    (version "0.23.4")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "tokio-rustls" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0nfsmmi8l1lgpbfy6079d5i13984djzcxrdr9jc06ghi0cwyhgn4"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-rustls" ,rust-rustls-0.20)
;;         ("rust-tokio" ,rust-tokio-1)
;;         ("rust-webpki" ,rust-webpki-0.22))))
;;    (home-page "https://github.com/tokio-rs/tls")
;;    (synopsis "Asynchronous TLS/SSL streams for Tokio using Rustls.")
;;    (description "Asynchronous TLS/SSL streams for Tokio using Rustls.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-http-0.2
;;  (package
;;    (name "rust-http")
;;    (version "0.2.7")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "http" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1fxzyvspr6g8znc6i0kif0bhpih8ibhy7xc6k984j8pm19bp11pz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bytes" ,rust-bytes-1)
;;         ("rust-fnv" ,rust-fnv-1)
;;         ("rust-itoa" ,rust-itoa-1))))
;;    (home-page "https://github.com/hyperium/http")
;;    (synopsis "A set of types for representing HTTP requests and responses.
;;")
;;    (description
;;      "This package provides a set of types for representing HTTP requests and
;;responses.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-local-waker-0.1
;;  (package
;;    (name "rust-local-waker")
;;    (version "0.1.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "local-waker" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1w9zqlh18mymvb82ya0sailiy5d3wsjamaakgl70x50i6vmpckz3"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/actix/actix-net.git")
;;    (synopsis "A synchronization primitive for thread-local task wakeup")
;;    (description
;;      "This package provides a synchronization primitive for thread-local task wakeup")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-utils-3
;;  (package
;;    (name "rust-actix-utils")
;;    (version "3.0.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-utils" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "155aj87z8634mfmggfixyqy3pqhpyf7g97zrzy6piz77qamcp4g4"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-local-waker" ,rust-local-waker-0.1)
;;         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
;;    (home-page "https://github.com/actix/actix-net")
;;    (synopsis "Various utilities used in the Actix ecosystem")
;;    (description "Various utilities used in the Actix ecosystem")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-tls-3
;;  (package
;;    (name "rust-actix-tls")
;;    (version "3.0.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-tls" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "15rj6gn83fzv5w2b2y0s690q80awsjhbjg40f3qcgkgpjbr0rplz"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-actix-codec" ,rust-actix-codec-0.5)
;;         ("rust-actix-rt" ,rust-actix-rt-2)
;;         ("rust-actix-service" ,rust-actix-service-2)
;;         ("rust-actix-utils" ,rust-actix-utils-3)
;;         ("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-http" ,rust-http-0.2)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-openssl" ,rust-openssl-0.10)
;;         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;         ("rust-tokio-native-tls" ,rust-tokio-native-tls-0.3)
;;         ("rust-tokio-openssl" ,rust-tokio-openssl-0.6)
;;         ("rust-tokio-rustls" ,rust-tokio-rustls-0.23)
;;         ("rust-tokio-util" ,rust-tokio-util-0.7)
;;         ("rust-webpki-roots" ,rust-webpki-roots-0.22))))
;;    (home-page "https://github.com/actix/actix-net.git")
;;    (synopsis "TLS acceptor and connector services for Actix ecosystem")
;;    (description "TLS acceptor and connector services for Actix ecosystem")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-service-2
;;  (package
;;    (name "rust-actix-service")
;;    (version "2.0.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-service" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0fipjcc5kma7j47jfrw55qm09dakgvx617jbriydrkqqz10lk29v"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-paste" ,rust-paste-1)
;;         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2))))
;;    (home-page "https://github.com/actix/actix-net")
;;    (synopsis
;;      "Service trait and combinators for representing asynchronous request/response operations.")
;;    (description
;;      "Service trait and combinators for representing asynchronous request/response
;;operations.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-windows-x86-64-msvc-0.36
;;  (package
;;    (name "rust-windows-x86-64-msvc")
;;    (version "0.36.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "windows_x86_64_msvc" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "103n3xijm5vr7qxr1dps202ckfnv7njjnnfqmchg8gl5ii5cl4f8"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/microsoft/windows-rs")
;;    (synopsis "Code gen support for the windows crate")
;;    (description "Code gen support for the windows crate")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-windows-x86-64-gnu-0.36
;;  (package
;;    (name "rust-windows-x86-64-gnu")
;;    (version "0.36.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "windows_x86_64_gnu" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1qfrck3jnihymfrd01s8260d4snql8ks2p8yaabipi3nhwdigkad"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/microsoft/windows-rs")
;;    (synopsis "Code gen support for the windows crate")
;;    (description "Code gen support for the windows crate")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-windows-i686-msvc-0.36
;;  (package
;;    (name "rust-windows-i686-msvc")
;;    (version "0.36.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "windows_i686_msvc" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "097h2a7wig04wbmpi3rz1akdy4s8gslj5szsx8g2v0dj91qr3rz2"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/microsoft/windows-rs")
;;    (synopsis "Code gen support for the windows crate")
;;    (description "Code gen support for the windows crate")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-windows-i686-gnu-0.36
;;  (package
;;    (name "rust-windows-i686-gnu")
;;    (version "0.36.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "windows_i686_gnu" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1dm3svxfzamrv6kklyda9c3qylgwn5nwdps6p0kc9x6s077nq3hq"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/microsoft/windows-rs")
;;    (synopsis "Code gen support for the windows crate")
;;    (description "Code gen support for the windows crate")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-windows-aarch64-msvc-0.36
;;  (package
;;    (name "rust-windows-aarch64-msvc")
;;    (version "0.36.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "windows_aarch64_msvc" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0ixaxs2c37ll2smprzh0xq5p238zn8ylzb3lk1zddqmd77yw7f4v"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/microsoft/windows-rs")
;;    (synopsis "Code gen support for the windows crate")
;;    (description "Code gen support for the windows crate")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-windows-sys-0.36
;;  (package
;;    (name "rust-windows-sys")
;;    (version "0.36.1")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "windows-sys" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1lmqangv0zg1l46xiq7rfnqwsx8f8m52mqbgg2mrx7x52rd1a17a"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.36)
;;         ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.36)
;;         ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.36)
;;         ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.36)
;;         ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.36))))
;;    (home-page "https://github.com/microsoft/windows-rs")
;;    (synopsis "Rust for Windows")
;;    (description "Rust for Windows")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-libc-0.2
;;  (package
;;    (name "rust-libc")
;;    (version "0.2.126")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "libc" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0diqlpap4pq81284368vffjwvp9jg9hp2x03s7hlk2yj3icmm79l"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-rustc-std-workspace-core" ,rust-rustc-std-workspace-core-1))))
;;    (home-page "https://github.com/rust-lang/libc")
;;    (synopsis "Raw FFI bindings to platform libraries like libc.
;;")
;;    (description "Raw FFI bindings to platform libraries like libc.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-socket2-0.4
;;  (package
;;    (name "rust-socket2")
;;    (version "0.4.5")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "socket2" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "15p2qiwr5w7lj3krs0ga4l58rscjkj112xqxic9raacbgyhjnr6a"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-libc" ,rust-libc-0.2)
;;         ("rust-windows-sys" ,rust-windows-sys-0.36))))
;;    (home-page "https://github.com/rust-lang/socket2")
;;    (synopsis
;;      "Utilities for handling networking sockets with a maximal amount of configuration
;;possible intended.
;;")
;;    (description
;;      "Utilities for handling networking sockets with a maximal amount of configuration
;;possible intended.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-sc-0.2
;;  (package
;;    (name "rust-sc")
;;    (version "0.2.7")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "sc" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "12x3c3mn36am3jfamswqfsd0vpr0hz3kdck6wskla7gx7fyih3h1"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/japaric/syscall.rs")
;;    (synopsis "Raw system calls")
;;    (description "Raw system calls")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-io-uring-0.5
;;  (package
;;    (name "rust-io-uring")
;;    (version "0.5.2")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "io-uring" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1a6da1jwxg115qa6cch6nnscxjl4kmxy97q3j1nanyrpv6g84xcd"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bindgen" ,rust-bindgen-0.59)
;;         ("rust-bitflags" ,rust-bitflags-1)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-sc" ,rust-sc-0.2))))
;;    (home-page "https://github.com/tokio-rs/io-uring")
;;    (synopsis "The low-level `io_uring` userspace interface for Rust")
;;    (description "The low-level `io_uring` userspace interface for Rust")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-tokio-uring-0.3
;;  (package
;;    (name "rust-tokio-uring")
;;    (version "0.3.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "tokio-uring" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1j22wyryp8ami8gq9cgh3wqd7g5gklqzdrxdj3cq8jc7757lkbfk"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-bytes" ,rust-bytes-1)
;;         ("rust-io-uring" ,rust-io-uring-0.5)
;;         ("rust-libc" ,rust-libc-0.2)
;;         ("rust-scoped-tls" ,rust-scoped-tls-1)
;;         ("rust-slab" ,rust-slab-0.4)
;;         ("rust-socket2" ,rust-socket2-0.4)
;;         ("rust-tokio" ,rust-tokio-1))))
;;    (home-page "https://tokio.rs")
;;    (synopsis "io-uring support for the Tokio asynchronous runtime.
;;")
;;    (description "io-uring support for the Tokio asynchronous runtime.")
;;    (license license:expat)))
;;
;;(define-public rust-actix-macros-0.2
;;  (package
;;    (name "rust-actix-macros")
;;    (version "0.2.3")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-macros" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "1dhk2bdp6rj67j5zgi4b76hpy2xw567js0hig28n1fb9rxr62nj6"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-quote" ,rust-quote-1) ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/actix/actix-net.git")
;;    (synopsis "Macros for Actix system and runtime")
;;    (description "Macros for Actix system and runtime")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-rt-2
;;  (package
;;    (name "rust-actix-rt")
;;    (version "2.7.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "actix-rt" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "000hxsbaxgd8jdmnw4dnlff4xdhggprnw2lk67pmiscqa4lnr8by"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-actix-macros" ,rust-actix-macros-0.2)
;;         ("rust-futures-core" ,rust-futures-core-0.3)
;;         ("rust-tokio" ,rust-tokio-1)
;;         ("rust-tokio-uring" ,rust-tokio-uring-0.3))))
;;    (home-page "https://actix.rs")
;;    (synopsis
;;      "Tokio-based single-threaded async runtime for the Actix ecosystem")
;;    (description
;;      "Tokio-based single-threaded async runtime for the Actix ecosystem")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-valuable-derive-0.1
;;  (package
;;    (name "rust-valuable-derive")
;;    (version "0.1.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "valuable-derive" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0cjvqljzsj891cjzlwv0ihrv4m0n5211a6pr6b7cz42ich66ji4x"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/tokio-rs/valuable")
;;    (synopsis "Macros for the `valuable` crate.")
;;    (description "Macros for the `valuable` crate.")
;;    (license license:expat)))
;;
;;(define-public rust-valuable-0.1
;;  (package
;;    (name "rust-valuable")
;;    (version "0.1.0")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "valuable" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0v9gp3nkjbl30z0fd56d8mx7w1csk86wwjhfjhr400wh9mfpw2w3"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-valuable-derive" ,rust-valuable-derive-0.1))))
;;    (home-page "https://github.com/tokio-rs/valuable")
;;    (synopsis
;;      "Object-safe value inspection, used to pass un-typed structured data across trait-object boundaries.
;;")
;;    (description
;;      "Object-safe value inspection, used to pass un-typed structured data across
;;trait-object boundaries.")
;;    (license license:expat)))
;;
;;(define-public rust-tracing-core-0.1
;;  (package
;;    (name "rust-tracing-core")
;;    (version "0.1.26")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "tracing-core" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0bq7c1y28hi7mli25pj9iljam4vcnlqk7zf2k3a8c67822kqqk7m"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-lazy-static" ,rust-lazy-static-1)
;;         ("rust-valuable" ,rust-valuable-0.1))))
;;    (home-page "https://tokio.rs")
;;    (synopsis "Core primitives for application-level tracing.
;;")
;;    (description "Core primitives for application-level tracing.")
;;    (license license:expat)))
;;
;;(define-public rust-tracing-attributes-0.1
;;  (package
;;    (name "rust-tracing-attributes")
;;    (version "0.1.21")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "tracing-attributes" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "0z2bjwkh0azvxw0fqcn36iy7r33wgaq559xp3n5gk6blav9qlsyc"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-proc-macro2" ,rust-proc-macro2-1)
;;         ("rust-quote" ,rust-quote-1)
;;         ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://tokio.rs")
;;    (synopsis
;;      "Procedural macro attributes for automatically instrumenting functions.
;;")
;;    (description
;;      "Procedural macro attributes for automatically instrumenting functions.")
;;    (license license:expat)))
;;
;;(define-public rust-tracing-0.1
;;  (package
;;    (name "rust-tracing")
;;    (version "0.1.34")
;;    (source
;;      (origin
;;        (method url-fetch)
;;        (uri (crate-uri "tracing" version))
;;        (file-name (string-append name "-" version ".tar.gz"))
;;        (sha256
;;          (base32 "02bx698j7p50dcg01s3x26swpjs2lcrly32ghklhz7x78k5ws3jx"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;      `(#:skip-build?
;;        #t
;;        #:cargo-inputs
;;        (("rust-cfg-if" ,rust-cfg-if-1)
;;         ("rust-log" ,rust-log-0.4)
;;         ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;         ("rust-tracing-attributes" ,rust-tracing-attributes-0.1)
;;         ("rust-tracing-core" ,rust-tracing-core-0.1))))
;;    (home-page "https://tokio.rs")
;;    (synopsis "Application-level tracing for Rust.
;;")
;;    (description "Application-level tracing for Rust.")
;;    (license license:expat)))
;;
;;(define-public rust-slab-0.4
;;  (package
;;    (name "rust-slab")
;;    (version "0.4.6")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "slab" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0cmvcy9ppsh3dz8mi6jljx7bxyknvgpas4aid2ayxk1vjpz3qw7b"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-serde" ,rust-serde-1))))
;;    (home-page "https://github.com/tokio-rs/slab")
;;    (synopsis "Pre-allocated storage for a uniform data type")
;;    (description "Pre-allocated storage for a uniform data type")
;;    (license license:expat)))
;;
;;(define-public rust-tokio-util-0.7
;;  (package
;;    (name "rust-tokio-util")
;;    (version "0.7.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "tokio-util" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0p2frdzx3nr2pv99a2xfjf0p589kv90n9a9aq7wj3yy2mnhs327r"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bytes" ,rust-bytes-1)
;;        ("rust-futures-core" ,rust-futures-core-0.3)
;;        ("rust-futures-io" ,rust-futures-io-0.3)
;;        ("rust-futures-sink" ,rust-futures-sink-0.3)
;;        ("rust-futures-util" ,rust-futures-util-0.3)
;;        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;        ("rust-slab" ,rust-slab-0.4)
;;        ("rust-tokio" ,rust-tokio-1)
;;        ("rust-tracing" ,rust-tracing-0.1))))
;;    (home-page "https://tokio.rs")
;;    (synopsis "Additional utilities for working with Tokio.
;;")
;;    (description "Additional utilities for working with Tokio.")
;;    (license license:expat)))
;;
;;(define-public rust-actix-codec-0.5
;;  (package
;;    (name "rust-actix-codec")
;;    (version "0.5.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "actix-codec" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1zm7nk8irjgkf08a6x632niwd9iprq43rdda4wqmgwx70ja5b9sp"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bitflags" ,rust-bitflags-1)
;;        ("rust-bytes" ,rust-bytes-1)
;;        ("rust-futures-core" ,rust-futures-core-0.3)
;;        ("rust-futures-sink" ,rust-futures-sink-0.3)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-memchr" ,rust-memchr-2)
;;        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;        ("rust-tokio" ,rust-tokio-1)
;;        ("rust-tokio-util" ,rust-tokio-util-0.7))))
;;    (home-page "https://github.com/actix/actix-net")
;;    (synopsis "Codec utilities for working with framed protocols")
;;    (description "Codec utilities for working with framed protocols")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-http-3
;;  (package
;;    (name "rust-actix-http")
;;    (version "3.0.4")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "actix-http" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0ykrwybs3ssi9ifn5p2gddi4909adjxs3gk450r0sk8d3aw5r255"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-actix-codec" ,rust-actix-codec-0.5)
;;        ("rust-actix-rt" ,rust-actix-rt-2)
;;        ("rust-actix-service" ,rust-actix-service-2)
;;        ("rust-actix-tls" ,rust-actix-tls-3)
;;        ("rust-actix-utils" ,rust-actix-utils-3)
;;        ("rust-ahash" ,rust-ahash-0.7)
;;        ("rust-base64" ,rust-base64-0.13)
;;        ("rust-bitflags" ,rust-bitflags-1)
;;        ("rust-brotli" ,rust-brotli-3)
;;        ("rust-bytes" ,rust-bytes-1)
;;        ("rust-bytestring" ,rust-bytestring-1)
;;        ("rust-derive-more" ,rust-derive-more-0.99)
;;        ("rust-encoding-rs" ,rust-encoding-rs-0.8)
;;        ("rust-flate2" ,rust-flate2-1)
;;        ("rust-futures-core" ,rust-futures-core-0.3)
;;        ("rust-h2" ,rust-h2-0.3)
;;        ("rust-http" ,rust-http-0.2)
;;        ("rust-httparse" ,rust-httparse-1)
;;        ("rust-httpdate" ,rust-httpdate-1)
;;        ("rust-itoa" ,rust-itoa-1)
;;        ("rust-language-tags" ,rust-language-tags-0.3)
;;        ("rust-local-channel" ,rust-local-channel-0.1)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-mime" ,rust-mime-0.3)
;;        ("rust-percent-encoding" ,rust-percent-encoding-2)
;;        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;        ("rust-rand" ,rust-rand-0.8)
;;        ("rust-sha-1" ,rust-sha-1-0.10)
;;        ("rust-smallvec" ,rust-smallvec-1)
;;        ("rust-zstd" ,rust-zstd-0.10))))
;;    (home-page "https://actix.rs")
;;    (synopsis "HTTP primitives for the Actix ecosystem")
;;    (description "HTTP primitives for the Actix ecosystem")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-actix-files-0.6
;;  (package
;;    (name "rust-actix-files")
;;    (version "0.6.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "actix-files" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1dbgsagxw7n6lj6gdx7xgkv8ylm0q4gyjdnjpqgaasikg6ddw6yq"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-actix-http" ,rust-actix-http-3)
;;        ("rust-actix-service" ,rust-actix-service-2)
;;        ("rust-actix-utils" ,rust-actix-utils-3)
;;        ("rust-actix-web" ,rust-actix-web-4)
;;        ("rust-askama-escape" ,rust-askama-escape-0.10)
;;        ("rust-bitflags" ,rust-bitflags-1)
;;        ("rust-bytes" ,rust-bytes-1)
;;        ("rust-derive-more" ,rust-derive-more-0.99)
;;        ("rust-futures-core" ,rust-futures-core-0.3)
;;        ("rust-http-range" ,rust-http-range-0.1)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-mime" ,rust-mime-0.3)
;;        ("rust-mime-guess" ,rust-mime-guess-2)
;;        ("rust-percent-encoding" ,rust-percent-encoding-2)
;;        ("rust-pin-project-lite" ,rust-pin-project-lite-0.2)
;;        ("rust-tokio-uring" ,rust-tokio-uring-0.2))))
;;    (home-page "https://actix.rs")
;;    (synopsis "Static file serving for Actix Web")
;;    (description "Static file serving for Actix Web")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-widestring-0.5
;;  (package
;;    (name "rust-widestring")
;;    (version "0.5.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "widestring" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "10qrilijh1qzw362mvd4nsz3vv32dxx530vk41hkcx8hah22z20p"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/starkat99/widestring-rs")
;;    (synopsis
;;     "A wide string Rust library for converting to and from wide strings, such as those often used in Windows API or other FFI libaries. Both `u16` and `u32` string types are provided, including support for UTF-16 and UTF-32, malformed encoding, C-style strings, etc.")
;;    (description
;;     "This package provides a wide string Rust library for converting to and from wide
;;strings, such as those often used in Windows API or other FFI libaries.  Both
;;`u16` and `u32` string types are provided, including support for UTF-16 and
;;UTF-32, malformed encoding, C-style strings, etc.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-ndk-macro-0.3
;;  (package
;;    (name "rust-ndk-macro")
;;    (version "0.3.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ndk-macro" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0v3sxc11kq3d5vdwfml62l7y5dr0flsf6kp5xid9sbv7qh0arxqd"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-darling" ,rust-darling-0.13)
;;        ("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
;;        ("rust-proc-macro2" ,rust-proc-macro2-1)
;;        ("rust-quote" ,rust-quote-1)
;;        ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/rust-windowing/android-ndk-rs")
;;    (synopsis "Helper macros for android ndk")
;;    (description "Helper macros for android ndk")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-ndk-context-0.1
;;  (package
;;    (name "rust-ndk-context")
;;    (version "0.1.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ndk-context" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "12sai3dqsblsvfd1l1zab0z6xsnlha3xsfl7kagdnmj3an3jvc17"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/rust-windowing/android-ndk-rs")
;;    (synopsis "Handles for accessing Android APIs")
;;    (description "Handles for accessing Android APIs")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-num-enum-derive-0.5
;;  (package
;;    (name "rust-num-enum-derive")
;;    (version "0.5.7")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "num_enum_derive" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1kj6b8f2fx8prlcl6y1k97668s5aiia4f9gjlk0nmpak3rj9h11v"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
;;        ("rust-proc-macro2" ,rust-proc-macro2-1)
;;        ("rust-quote" ,rust-quote-1)
;;        ("rust-syn" ,rust-syn-1))))
;;    (home-page "https://github.com/illicitonion/num_enum")
;;    (synopsis
;;     "Internal implementation details for ::num_enum (Procedural macros to make inter-operation between primitives and enums easier)")
;;    (description
;;     "Internal implementation details for ::num_enum (Procedural macros to make
;;inter-operation between primitives and enums easier)")
;;    (license (list license:bsd-3 license:expat license:asl2.0))))
;;
;;(define-public rust-num-enum-0.5
;;  (package
;;    (name "rust-num-enum")
;;    (version "0.5.7")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "num_enum" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1j8rq7i4xnbzy72z82k41469xlj1bmn4ixagd9wlbvv2ark9alyg"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-num-enum-derive" ,rust-num-enum-derive-0.5))))
;;    (home-page "https://github.com/illicitonion/num_enum")
;;    (synopsis
;;     "Procedural macros to make inter-operation between primitives and enums easier.")
;;    (description
;;     "Procedural macros to make inter-operation between primitives and enums easier.")
;;    (license (list license:bsd-3 license:expat license:asl2.0))))
;;
;;(define-public rust-ndk-sys-0.3
;;  (package
;;    (name "rust-ndk-sys")
;;    (version "0.3.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ndk-sys" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "15zsq4p6k5asf4mc0rknd8cz9wxrwvi50qdspgf87qcfgkknlnkf"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build? #t #:cargo-inputs (("rust-jni-sys" ,rust-jni-sys-0.3))))
;;    (home-page "https://github.com/rust-windowing/android-ndk-rs")
;;    (synopsis "FFI bindings for the Android NDK")
;;    (description "FFI bindings for the Android NDK")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-ndk-0.6
;;  (package
;;    (name "rust-ndk")
;;    (version "0.6.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ndk" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1m1dfjw35qpys1hr4qib6mm3zacd01k439l7cx5f7phd0dzcfci0"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-bitflags" ,rust-bitflags-1)
;;        ("rust-jni" ,rust-jni-0.18)
;;        ("rust-jni-glue" ,rust-jni-glue-0.0)
;;        ("rust-jni-sys" ,rust-jni-sys-0.3)
;;        ("rust-ndk-sys" ,rust-ndk-sys-0.3)
;;        ("rust-num-enum" ,rust-num-enum-0.5)
;;        ("rust-thiserror" ,rust-thiserror-1))))
;;    (home-page "https://github.com/rust-windowing/android-ndk-rs")
;;    (synopsis "Safe Rust bindings to the Android NDK")
;;    (description "Safe Rust bindings to the Android NDK")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-android-log-sys-0.2
;;  (package
;;    (name "rust-android-log-sys")
;;    (version "0.2.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "android_log-sys" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0bhhs1cgzp9vzjvkn2q31ppc7w4am5s273hkvl5iac5475kmp5l5"))))
;;    (build-system cargo-build-system)
;;    (arguments `(#:skip-build? #t))
;;    (home-page "https://github.com/nercury/android_log-sys-rs")
;;    (synopsis "FFI bindings to Android log Library.
;;")
;;    (description "FFI bindings to Android log Library.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-android-logger-0.10
;;  (package
;;    (name "rust-android-logger")
;;    (version "0.10.1")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "android_logger" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0rigzgkaik2y7pvsilpjdy19mdq1kkamw2rdf9fjkvb5hfqhkvfr"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-android-log-sys" ,rust-android-log-sys-0.2)
;;        ("rust-env-logger" ,rust-env-logger-0.8)
;;        ("rust-lazy-static" ,rust-lazy-static-1)
;;        ("rust-log" ,rust-log-0.4))))
;;    (home-page "https://github.com/Nercury/android_logger-rs")
;;    (synopsis
;;     "A logging implementation for `log` which hooks to android log output.
;;")
;;    (description
;;     "This package provides a logging implementation for `log` which hooks to android
;;log output.")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-ndk-glue-0.6
;;  (package
;;    (name "rust-ndk-glue")
;;    (version "0.6.2")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "ndk-glue" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "0pz6cdmmlzsb2jhrfvkma5d5vw2i331dlghqnkk2c0l6hdxll30d"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-android-logger" ,rust-android-logger-0.10)
;;        ("rust-lazy-static" ,rust-lazy-static-1)
;;        ("rust-libc" ,rust-libc-0.2)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-ndk" ,rust-ndk-0.6)
;;        ("rust-ndk-context" ,rust-ndk-context-0.1)
;;        ("rust-ndk-macro" ,rust-ndk-macro-0.3)
;;        ("rust-ndk-sys" ,rust-ndk-sys-0.3))))
;;    (home-page "https://github.com/rust-windowing/android-ndk-rs")
;;    (synopsis "Startup code for android binaries")
;;    (description "Startup code for android binaries")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-jni-0.19
;;  (package
;;    (name "rust-jni")
;;    (version "0.19.0")
;;    (source
;;     (origin
;;       (method url-fetch)
;;       (uri (crate-uri "jni" version))
;;       (file-name (string-append name "-" version ".tar.gz"))
;;       (sha256
;;        (base32 "1v0pn0i1wb8zp4wns4l8hz9689hqsplv7iba7hylaznvwg11ipy6"))))
;;    (build-system cargo-build-system)
;;    (arguments
;;     `(#:skip-build?
;;       #t
;;       #:cargo-inputs
;;       (("rust-cesu8" ,rust-cesu8-1)
;;        ("rust-combine" ,rust-combine-4)
;;        ("rust-jni-sys" ,rust-jni-sys-0.3)
;;        ("rust-log" ,rust-log-0.4)
;;        ("rust-thiserror" ,rust-thiserror-1)
;;        ("rust-walkdir" ,rust-walkdir-2))))
;;    (home-page "https://github.com/jni-rs/jni-rs")
;;    (synopsis "Rust bindings to the JNI")
;;    (description "Rust bindings to the JNI")
;;    (license (list license:expat license:asl2.0))))
;;
;;(define-public rust-webbrowser-0.5
;;  (package
;;   (name "rust-webbrowser")
;;   (version "0.5.5")
;;   (source
;;    (origin
;;     (method url-fetch)
;;     (uri (crate-uri "webbrowser" version))
;;     (file-name (string-append name "-" version ".tar.gz"))
;;     (sha256
;;      (base32 "12hmi768mnpssfh9w61ys75v706jj3pcy4fliqq21dnnj1j1bbgc"))))
;;   (build-system cargo-build-system)
;;   (arguments
;;    `(#:cargo-inputs
;;      (("rust-jni" ,rust-jni-0.19)
;;       ("rust-ndk-glue" ,rust-ndk-glue-0.6)
;;       ("rust-url" ,rust-url-2)
;;       ("rust-web-sys" ,rust-web-sys-0.3)
;;       ("rust-widestring" ,rust-widestring-0.5)
;;       ("rust-winapi" ,rust-winapi-0.3))
;;      #:cargo-development-inputs
;;      (("rust-actix-files" ,rust-actix-files-0.6)
;;       ("rust-actix-web" ,rust-actix-web-4)
;;       ("rust-crossbeam-channel" ,rust-crossbeam-channel-0.5)
;;       ("rust-tokio" ,rust-tokio-1)
;;       ("rust-urlencoding" ,rust-urlencoding-2))
;;      #:cargo-test-flags
;;      '("--release" "--"
;;        ;; This test goes to the network
;;        "--skip=test_open_default")))
;;   (home-page "https://github.com/amodm/webbrowser-rs")
;;   (synopsis "Open URLs in web browsers available on a platform")
;;   (description "Open URLs in web browsers available on a platform")
;;   (license (list license:expat license:asl2.0))))
;;
;;rust-solo2-0.1
