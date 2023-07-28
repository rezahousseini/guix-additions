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

(define-public texlive-libertinus-otf
  (package
    (inherit (simple-texlive-package
	      "texlive-libertinus-otf"
              (list "doc/fonts/libertinus-otf/"
                    "tex/latex/libertinus-otf/"
		    "fonts/opentype/public/libertinus-fonts/")
              (base32
               "1j3yiba6w2k8bjvkklpz1f0zanivgn1ljfr7f37aqxnhzcf8aa1h")
              #:trivial? #t))
    (home-page "https://ctan.org/fonts/libertinus-otf")
    (synopsis "Support for Libertinus OpenType")
    (description
     "This package offers LuaLaTeX/XeLaTeX support for the Libertinus OpenType fonts
maintained by Khaled Hosny.  Missing fonts are defined via several font feature
settings.  The Libertinus fonts are similiar to Libertine and Biolinum, but come
with math symbols.")
    (license license:lppl1.3+)))

(define-public texlive-libertinus-type1
  (package
    (inherit (simple-texlive-package
	      "texlive-libertinus-type1"
              (list "doc/fonts/libertinus-type1/"
		    "fonts/enc/dvips/libertinus-type1/"
		    "fonts/map/dvips/libertinus-type1/"
		    "fonts/tfm/public/libertinus-type1/"
		    "fonts/type1/public/libertinus-type1/"
		    "fonts/vf/public/libertinus-type1/"
		    "tex/latex/libertinus-type1/")
              (base32
               "1vzvli3sbyxdsqzb3qk03mbl0qg4q7ihipddd1n6bdbjriv67zz6")
              #:trivial? #t))
    (home-page "https://ctan.org/fonts/libertinus-type1")
    (synopsis "Support for using Libertinus fonts with LaTeX/pdfLaTeX")
    (description
     "This package provides support for use of Libertinus fonts with traditional
processing engines (LaTeX with dvips or dvipdfmx, or pdfLaTeX).")
    (license license:lppl1.3+)))

(define-public texlive-libertinus
  (package
    (inherit (simple-texlive-package
	      "texlive-libertinus"
	      (list "doc/fonts/libertinus/"
                    "tex/latex/libertinus/")
	      (base32
	       "13m20jkrf0sp39f0ihc0fw7spzc3gys5xdc720r5gzdnbdqdvih4")
	      #:trivial? #t))
    (propagated-inputs (list texlive-libertinus-otf texlive-libertinus-type1))
    (home-page "https://ctan.org/fonts/libertinus")
    (synopsis
     "Wrapper to use the correct libertinus package according to the used TeX engine")
    (description
     "This package is only a wrapper for the the two packages libertinus-type1
(pdfLaTeX) and libertinus-otf (LuaLaTeX/XeLaTeX).  The Libertinus fonts are
similiar to Libertine and Biolinum, but come with math symbols.")
    (license license:lppl1.3+)))

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

(define-public texlive-transparent
  (package
    (inherit (simple-texlive-package
	      "texlive-transparent"
              (list "doc/latex/transparent/"
                    "source/latex/transparent/"
                    "tex/latex/transparent/")
              (base32
               "161lfx6yv8qgk76lz0j375swrk6012djay3sjxggrsx7l92qjvhd")
	      #:trivial? #t))
    (home-page "https://ctan.org/macros/latex/contrib/transparent")
    (synopsis "Using a color stack for transparency with pdfTeX")
    (description
     "Since version 1.40 pdfTeX supports several color stacks; the package uses a
separate colour stack for control of transparency (which is not, of course, a
colour).")
    (license license:lppl1.3+)))

texlive-svg
