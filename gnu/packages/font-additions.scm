(define-module (gnu packages font-additions)
  #:use-module (ice-9 regex)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system font)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages c)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg))

(define-public font-osifont
  (package
    (name "font-osifont")
    (version "0.1.20230322")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
	     "https://github.com/hikikomori82/osifont/archive/refs/tags/"
	     version ".tar.gz"))
       (sha256
        (base32 "1yh70783qcvp440xxr3lj1ky2b3xrkif5x8j3v2kzyh50p9l6sx7"))))
    (build-system font-build-system)
    (home-page "https://github.com/hikikomori82/osifont")
    (synopsis "Free TrueType font for CAD projects")
    (description
     "In some European countries, CAD projects must have font which conform to IS0 3O98 specification. Commercial CADs has this font, but free CADs not. There is no available free font yet, so this project will fix this. This font will be created completely from the scratch. Font is created with free tools like FontForge, Inkscape, Gimp. Font is available under 3 licences: GNU GPL licence version 3 with GPL font exception, GNU GPL licence version 2 with GPL font exception, GNU LGPL licence version 3 with GPL font exception.")
    (license license:gpl3+)))

font-osifont
