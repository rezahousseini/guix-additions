(define-module (gnu packages tex-additions)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system texlive)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tex)
  #:use-module (ice-9 ftw)
  #:use-module ((srfi srfi-1) #:hide (zip)))

(define* (simple-texlive-package name locations hash
                                 #:key trivial?)
  "Return a template for a simple TeX Live package with the given NAME,
downloading from a list of LOCATIONS in the TeX Live repository, and expecting
the provided output HASH.  If TRIVIAL? is provided, all files will simply be
copied to their outputs; otherwise the TEXLIVE-BUILD-SYSTEM is used."
  (define with-documentation?
    (and trivial?
         (any (lambda (location)
                (string-prefix? "/doc" location))
              locations)))
  (package
    (name name)
    (version (number->string %texlive-revision))
    (source (texlive-origin name version
                            locations hash))
    (outputs (if with-documentation?
                 '("out" "doc")
                 '("out")))
    (build-system (if trivial?
                      gnu-build-system
                      texlive-build-system))
    (arguments
     (let ((copy-files
            `(lambda* (#:key outputs inputs #:allow-other-keys)
               (let (,@(if with-documentation?
                           `((doc (string-append (assoc-ref outputs "doc")
                                                 "/share/texmf-dist/")))
                           '())
                     (out (string-append (assoc-ref outputs "out")
                                         "/share/texmf-dist/")))
                 ,@(if with-documentation?
                       '((mkdir-p doc)
                         (copy-recursively
                          (string-append (assoc-ref inputs "source") "/doc")
                          (string-append doc "/doc")))
                       '())
                 (mkdir-p out)
                 (copy-recursively "." out)
                 ,@(if with-documentation?
                       '((delete-file-recursively (string-append out "/doc")))
                       '())
                 #t))))
       (if trivial?
           `(#:tests? #f
             #:phases
             (modify-phases %standard-phases
               (delete 'configure)
               (replace 'build (const #t))
               (replace 'install ,copy-files)))
           `(#:phases
             (modify-phases %standard-phases
               (add-after 'install 'copy-files ,copy-files))))))
    (home-page #f)
    (synopsis #f)
    (description #f)
    (license #f)))

(define-public texlive-smartdiagram
  (package
    (inherit (simple-texlive-package
              "texlive-smartdiagram"
              (list "doc/latex/smartdiagram/"
		    "tex/latex/smartdiagram/")
              (base32
               "0b9rq06c0xm9dpd6yljvgay0p7xpglpddw10vlf5c50wma4xqjda")
              #:trivial? #t))
    (home-page "https://www.ctan.org/pkg/smartdiagram")
    (synopsis "Generate diagrams from lists")
    (description "The package will create ‘smart’ diagrams from lists of items, for simple documents and for presentations.")
    (license license:public-domain)))

(define-public texlive-xstring
  (package
    (inherit (simple-texlive-package
              "texlive-xstring"
              (list "doc/generic/xstring/"
		    "tex/generic/xstring/")
              (base32
               "1azpq855kq1l4686bjp8haxim5c8wycz1b6lcg5q7x8kb4g9sppn")
              #:trivial? #t))
    (home-page "https://www.ctan.org/pkg/xstring")
    (synopsis "String manipulation for (La)Tex")
    (description "The package provides macros for manipulating strings — testing a string’s contents, extracting substrings, substitution of substrings and providing numbers such as string length, position of, or number of recurrences of, a substring.")
    (license license:public-domain)))

texlive-xstring
