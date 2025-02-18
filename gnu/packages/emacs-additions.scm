(define-module (gnu packages emacs-additions)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages games)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages java)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages screen)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public emacs-lean-mode
  (package
   (name "emacs-lean-mode")
   (version "20220501.1007")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/leanprover/lean-mode.git")
                  (commit "362bc6fa3efb1874c525ed6b4b6f24f76af22596")))
            (sha256
             (base32
	      "1lr4h555fa1kdi3q7hkhsnznv7nh9rgjqjkbj2bqp9zwh06245w3"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-dash emacs-s emacs-f emacs-flycheck))
   (arguments
    '(#:include '("^lean-[^/]+.el$")
      #:exclude '()))
   (home-page "https://github.com/leanprover/lean-mode")
   (synopsis "A major mode for the Lean 3 language")
   (description
    "This package provides a major mode for the Lean 3 programming language.

Provides highlighting, diagnostics, goal visualization, and many other useful
features for Lean users.

See the README.md for more advanced features and the associated keybindings.")
   (license #f)))

(define-public emacs-native-complete
  (package
   (name "emacs-native-complete")
   (version "157bd9c23508c4b0b8636c9a6d9b6ecc6209d4f0")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/CeleritasCelery/emacs-native-shell-complete.git")
                  (commit version)))
            (sha256
             (base32
              "1396il9646d4wkyc8bbl2baqq4vwaqp7la9s085g9qbk41g619lp"))))
   (build-system emacs-build-system)
   (propagated-inputs (list emacs-company))
   (arguments
    '(#:include '("^company-native-complete.el$"
		          "^native-complete-test.el$"
		          "^native-complete.el$")
      #:exclude '()))
   (home-page "https://github.com/CeleritasCelery/emacs-native-shell-complete")
   (synopsis "Completion in shell buffers using native mechanisms")
   (description
    "Completion in shell buffers using native mechanisms.")
   (license license:lgpl3)))

emacs-native-complete
