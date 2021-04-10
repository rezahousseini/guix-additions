(define-module (capmod packages proof-of-concept-app)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  ; #:use-module (gnu packages commencement)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-additions)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1))

(define-public poca-server
  (let ((commit "9bff7f3565a9d2ad4f5793f700c96098ae975d19")
        (revision "1")) ;Guix package revision
    (package
      (name "poca-server")
      (version (git-version "0.1.0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://gitlab+deploy-token-419309:QDyKnBKXPw64WFgQiz9r@gitlab.com/capmod/poca-server.git")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "030ilj6223n2icyf97qgi9pkk4sq1vardmqyqh1z6qknf56kgf6n"))))
      (build-system haskell-build-system)
      (native-inputs
        `(("ghc-aeson" ,ghc-aeson)
          ("ghc-base-compat" ,ghc-base-compat)
          ("ghc-hw-kafka-client" ,ghc-hw-kafka-client)
          ("ghc-network" ,ghc-network)
          ("ghc-servant" ,ghc-servant)
          ("ghc-servant-server" ,ghc-servant-server)
          ("ghc-wai" ,ghc-wai)
          ("ghc-warp" ,ghc-warp)))
      (arguments `(#:tests? #f))
      (home-page "https://gitlab.com/capmod/poca-server")
      (synopsis "Proof of concept app server")
      (description  "This server serves a small REST API which is connected
t  o an Apache Kafka backend.")
      (license license:expat))))
poca-server

