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

(define-public texlive-dtk
  (package
    (inherit (simple-texlive-package
              "texlive-dtk"
              (list "doc/latex/dtk/"
		    "tex/latex/dtk/")
              (base32
               "1yibr5jfn67780wpks6cvy8phq6fqgji2ay60nvykj3hizjc0nci")
              #:trivial? #t))
    (home-page "https://www.ctan.org/pkg/dtk")
    (synopsis "Document class for the journal of DANTE")
    (description "The bundle provides a class and style file for typesetting “Die TEXnische Komödie” — the communications of the German TEX Users Group DANTE e.V. The arrangement means that the class may be used by article writers to typeset a single article, as well as to produce the complete journal.")
    (license license:public-domain)))

(define-public texlive-svg
  (package
    (inherit (simple-texlive-package
	      "texlive-svg"
              (list "doc/latex/svg/"
		    "source/latex/svg/"
                    "tex/latex/svg/")
              (base32
               "1yizgrjn6l9j1cf8mvkjz0zni7bzmajszc1y8q80xc723nwnbq7q")
	      #:trivial? #t))
    (home-page "https://ctan.org/graphics/svg")
    (synopsis "Include and extract SVG pictures in LaTeX documents")
    (description
     "This bundle contains the two packages svg and svg-extract.  The svg package is
intended for the automated integration of SVG graphics into LaTeX documents.
Therefore the capabilities provided by Inkscape -- or more precisely its command
line tool -- are used to export the text within an SVG graphic to a separate
file, which is then rendered by LaTeX. For this purpose the two commands
\\includesvg and \\includeinkscape are provided which are very similar to the
\\includegraphics command of the graphicx package.  In addition, the package
svg-extract allows the extraction of these graphics into independent files in
different graphic formats, exactly as it is rendered within the LaTeX document,
using either ImageMagick or Ghostscript.")
    (license license:lppl1.3c)))

texlive-svg
