(define-module (gnu packages security-token-additions)
  #:use-module (gnu packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system python)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages libbsd)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages popt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages security-token)  
  #:use-module (gnu packages swig)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xml))

(define-public pcsc-tools
  (package
    (name "pcsc-tools")
    (version "1.6.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/LudovicRousseau/pcsc-tools")
             (commit  version)))
       (file-name (git-file-name name version))
       (sha256
	(base32 "0931gb6ds9fm51ajnmp37pac3hdvijx4jikpz4a52al6gg3ynkby"))))
    (build-system gnu-build-system)
    (native-inputs
     (list perl
           pkg-config
	   autoconf
	   automake
	   libtool))
    (inputs
     (list pcsc-lite eudev))
    (home-page "http://ludovic.rousseau.free.fr/softwares/pcsc-tools/")
    (synopsis "Some tools to be used with smart cards and PC/SC")
    (description
     "These tools are used to test a PC/SC driver, card or reader or send commands in a friendly environment (text or graphical user interface).")
    (license license:gpl2)))

pcsc-tools
