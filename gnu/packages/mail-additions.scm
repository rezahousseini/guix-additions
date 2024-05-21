(define-module (gnu packages mail-additions)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cyrus-sasl)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages tls)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu))

(define-public isync-with-xoauth2
  (package
    (inherit isync)
    (name "isync-with-xoauth2")
    (inputs
     (list bdb cyrus-sasl-with-search-path cyrus-sasl-xoauth2 openssl zlib))))

isync-with-xoauth2
