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

(define-public texlive-generic-xstring
  (package
    (inherit (simple-texlive-package
              "texlive-generic-xstring"
              (list "doc/generic/xstring/"
		    "tex/generic/xstring/")
              (base32
               "1azpq855kq1l4686bjp8haxim5c8wycz1b6lcg5q7x8kb4g9sppn")
              #:trivial? #t))
    (home-page "https://www.ctan.org/pkg/xstring")
    (synopsis "String manipulation for (La)TeX")
    (description "The package provides macros for manipulating strings — testing a string’s contents, extracting substrings, substitution of substrings and providing numbers such as string length, position of, or number of recurrences of, a substring.")
    (license license:public-domain)))

(define-public texlive-metalogo
  (package
    (inherit (simple-texlive-package
              "texlive-metalogo"
              (list "doc/latex/metalogo/"
		    "tex/latex/metalogo/")
              (base32
               "02c8ysyr8bc1b643zjgs5qshc704hm7wwz7g1w8izb202hvzsk13")
              #:trivial? #t))
    (home-page "https://www.ctan.org/pkg/metalogo")
    (synopsis "Extended TeX logo macros")
    (description "This package exposes spacing parameters for various TeX logos to the end user, to optimise the logos for different fonts. Written especially for XeLaTeX users.")
    (license license:public-domain)))

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

(define-public texlive-filehook
  (package
    (inherit (simple-texlive-package
	      "texlive-filehook"
              (list "doc/latex/filehook/"
                    "source/latex/filehook/"
                    "tex/latex/filehook/")
              (base32
               "03dsnv8fn111kn8h2fa281w2jvcdrqag1im6mkkfahvjgl1apk6k")
	      #:trivial? #t))
    (home-page "https://ctan.org/macros/latex/contrib/filehook")
    (synopsis "Hooks for input files")
    (description
     "The package provides several file hooks (AtBegin, AtEnd, ...) for files read by
\\input, \\include and \\InputIfFileExists.  General hooks for all such files (e.g.
 all \\included ones) and file specific hooks only used for named files are
provided; two hooks are provided for the end of \\included files -- one before,
and one after the final \\clearpage.")
    (license license:lppl1.3+)))

(define-public texlive-lualatex-math
  (package
    (inherit (simple-texlive-package
	      "texlive-lualatex-math"
              (list "doc/lualatex/lualatex-math/"
                    "source/lualatex/lualatex-math/"
                    "tex/lualatex/lualatex-math/")
              (base32
               "1xfr31rwr7zc6d5bsc3v5lwvcfrg109rzfgvvs69w4xs61j06jcg")
	      #:trivial? #t))
    (propagated-inputs (list texlive-filehook texlive-etoolbox))
    (home-page "https://ctan.org/macros/luatex/latex/lualatex-math")
    (synopsis "Fixes for mathematics-related LuaLaTeX issues")
    (description
     "The package patches a few commands of the LaTeX2e kernel and the amsmath and
mathtools packages to be more compatible with the LuaTeX engine.  It is only
meaningful for LuaLaTeX documents containing mathematical formulas, and does not
exhibit any new functionality.  The fixes are mostly moved from the unicode-math
package to this package since they are not directly related to Unicode
mathematics typesetting.")
    (license license:lppl1.3c)))

(define-public texlive-libertinus-otf
  (package
    (inherit (simple-texlive-package
	      "texlive-libertinus-otf"
              (list "doc/fonts/libertinus-otf/"
                    "tex/latex/libertinus-otf/"
		    "fonts/opentype/public/libertinus-fonts/")
              (base32
               "09n2j9p1c314nv1l2i2j58ij0h4s89mi49zrrkbzl6p6f51dl35f")
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
               "1f4w0p0jdmhpnj8x5anm6jv2jzbf5bhajq2qnxcacp23k7fjkq86")
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

(define-public texlive-luatex85
  (package
    (inherit (simple-texlive-package
	      "texlive-luatex85"
              (list "doc/generic/luatex85/"
                    "source/generic/luatex85/"
                    "tex/generic/luatex85/")
              (base32
               "02j42g9c5smgbrk898fpvrgqlxqcqi8xch23awvnbvg6y54cs573")
	      #:trivial? #t))
    (home-page "https://ctan.org/macros/generic/luatex85")
    (synopsis "pdfTeX aliases for LuaTeX")
    (description
     "The package provides emulation of pdfTeX primitives for LuaTeX v0.85+.")
    (license license:lppl1.3+)))

(define-public texlive-pgfplots
  (package
    (inherit (simple-texlive-package
	      "texlive-pgfplots"
              (list "doc/context/third/pgfplots/"
		    "doc/generic/pgfplots/"
		    "doc/latex/pgfplots/"
		    "doc/plain/pgfplots/"
		    "scripts/pgfplots/"
		    "source/context/third/pgfplots/"
		    "source/latex/pgfplots/"
		    "tex/context/third/pgfplots/"
		    "tex/generic/pgfplots/libs/"
		    "tex/generic/pgfplots/liststructure/"
		    "tex/generic/pgfplots/lua/"
		    "tex/generic/pgfplots/numtable/"
		    "tex/generic/pgfplots/oldpgfcompatib/"
		    "tex/generic/pgfplots/oldpgfplotscompatib/"
		    "tex/generic/pgfplots/pgfcontrib/"
		    "tex/generic/pgfplots/sys/"
		    "tex/generic/pgfplots/test/"
		    "tex/generic/pgfplots/util/"
		    "tex/latex/pgfplots/"
		    "tex/plain/pgfplots/")
              (base32
               "052cqxxlkdigkg62d201ziwab5mqzhfpz2ll36k575bmd96jcnwh")
	      #:trivial? #t))
    (propagated-inputs (list texlive-pgf))
    (home-page "https://ctan.org/graphics/pgf/contrib/pgfplots")
    (synopsis "Create normal/logarithmic plots in two and three dimensions")
    (description
     "PGFPlots draws high-quality function plots in normal or logarithmic scaling with
a user-friendly interface directly in TeX. The user supplies axis labels, legend
entries and the plot coordinates for one or more plots and PGFPlots applies axis
scaling, computes any logarithms and axis ticks and draws the plots, supporting
line plots, scatter plots, piecewise constant plots, bar plots, area plots,
mesh-- and surface plots and some more.  Pgfplots is based on PGF/TikZ (PGF); it
runs equally for LaTeX/TeX/ConTeXt.")))
