(define-module (gnu packages sim-additions)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages simulation)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system copy)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 regex)
  #:use-module (srfi srfi-1))

(define-public utf8cpp
  (package
   (name "utf8cpp")
   (version "3.2.2")
   (source (origin
            (method url-fetch)
            (uri (string-append
		  "https://github.com/nemtrif/utfcpp/archive/refs/tags/v"
		  version ".tar.gz"))
            (sha256
	     (base32
              "1x8rrvx266p1c2ka9pxmrldpz57c77fbf34ak88ak9p25g5yg0bg"))
	    (modules '((guix build utils)))
	    (snippet
    	     '(begin
    		;; delete bundled dependencies
		(delete-file-recursively "extern")
		(substitute* (list "tests/test_unchecked_iterator.cpp"
				   "tests/test_checked_iterator.cpp"
				   "tests/test_unchecked_api.cpp"
				   "tests/test_checked_api.cpp"
				   "tests/test_cpp11.cpp"
				   "tests/test_cpp17.cpp")
			     (("\"\\.\\./extern/ftest/ftest.h\"") "<ftest/ftest.h>"))))))
   (build-system cmake-build-system)
   (native-inputs (list ftest))
   (arguments
    `(#:build-type "Release"
      ))
   (home-page "https://utfcpp.sourceforge.net/")
   (synopsis
    "UTF-8 with C++ in a Portable Way")
   (description
    "UTF-8 with C++ in a Portable Way")
   (license license:asl2.0)))

(define-public ftest
  (package
    (name "ftest")
    (version "bf75576064fce2e07f52cd63a3e410f12358728b")
    (source (origin
	      (method git-fetch)
	      (uri (git-reference
		    (url "https://github.com/nemtrif/ftest")
		    (commit version)))
	      (file-name (git-file-name name version))
	      (sha256
	       (base32
		"01yjhjnlq2gci8hkc6favwj0axq7y1vvnradsgcffby6h09x00b4"))))
    (build-system copy-build-system)
    (native-inputs (list cmake-minimal))
    (arguments
     `(#:install-plan '(("ftest.h" "include/ftest/"))
       #:phases
       (modify-phases %standard-phases
    	 (add-before 'install 'check
    	   (lambda _
    	     (with-directory-excursion "tests"
	       (invoke "cmake" ".")
	       (invoke "make")
	       (invoke "ctest")))
    	   ))))
    (home-page "https://github.com/nemtrif/ftest")
    (synopsis
     "A simple and limited unit-test framework for C++")
    (description
     "A simple and limited unit-test framework for C++")
    (license license:asl2.0)))
