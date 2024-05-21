(define-module (gnu packages cyrus-sasl-additions)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages tls)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu))

(define-public cyrus-sasl-with-search-path
  (package
    (inherit cyrus-sasl)
    (native-search-paths
     (list (search-path-specification
            (variable "SASL_PATH")
            (files (list "lib/sasl2")))))))

(define-public cyrus-sasl-xoauth2
  (package
    (name "cyrus-sasl-xoauth2")
    (version "0.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/moriyoshi/cyrus-sasl-xoauth2/archive/refs/tags/v"
				  version ".tar.gz"))
              (sha256
               (base32
                "0hz95rp2n0xrkc0y2fgif2s7d61hlhd4qki5m8q0s44qc1b2cb56"))))
    (build-system gnu-build-system)
    (inputs (list autoconf automake libtool cyrus-sasl-with-search-path))
    (arguments
     (list #:configure-flags
	   #~(list (string-append "--with-cyrus-sasl=" #$output))
	   #:phases
	   #~(modify-phases %standard-phases
	       (add-after 'unpack 'add-shebang
		 (lambda _
		   (substitute* "autogen.sh"
		     (("libtoolize") "#!/bin/sh\nlibtoolize")))))))
    (synopsis "This is a plugin implementation of XOAUTH2.")
    (description
     "This is a plugin implementation of XOAUTH2.")
    (license license:expat)
    (home-page "https://github.com/moriyoshi/cyrus-sasl-xoauth2")))
