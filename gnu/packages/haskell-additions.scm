(define-module (gnu packages haskell-additions)
  #:use-module (gnu packages)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages haskell-check)
  #:use-module (gnu packages haskell-crypto)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages haskell-web)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system haskell)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (srfi srfi-1))

(define-public ghc-http-media
  (package
    (name "ghc-http-media")
    (version "0.8.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/http-media/http-media-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0lww5cxrc9jlvzsysjv99lca33i4rb7cll66p3c0rdpmvz8pk0ir"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-utf8-string" ,ghc-utf8-string)))
    (arguments
      `(#:tests?
        #f
        #:cabal-revision
        ("4"
         "0qg6x92i3w2q7zarr08kmicychkwskfi04xaxkqkg0cw6jnpnhhh")))
    (home-page "https://github.com/zmthy/http-media")
    (synopsis
      "Processing HTTP Content-Type and Accept headers")
    (description  "This library is intended to be a comprehensive solution to
parsing and selecting quality-indexed values in HTTP headers.
It is capable of parsing both media types and language parameters from
the Accept and Content header families, and can be extended to match
against other accept headers as well.  Selecting the appropriate header
value is achieved by comparing a list of server options against the
quality-indexed values supplied by the client.  In the following
example, the Accept header is parsed and then matched against a list of
server options to serve the appropriate media using @code{mapAcceptMedia}:

@code{getHeader >>= maybe send406Error sendResourceWith . mapAcceptMedia
[ (\"text/html\",        asHtml)
, (\"application/json\", asJson)
]}

Similarly, the Content-Type header can be used to produce a parser for
request bodies based on the given content type with @code{mapContentMedia}:

@code{getContentType >>= maybe send415Error readRequestBodyWith . mapContentMedia}
[ (\"application/json\", parseJson)
, (\"text/plain\",       parseText)
]}

The API is agnostic to your choice of server.")
    (license license:expat)))

(define-public ghc-miso
  (package
    (name "ghc-miso")
    (version "1.7.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/miso/miso-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1hkfcinwymrff8mmvywhnlzbj5804hwkk4rhzxzhzsycdf4v7a41"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-aeson" ,ghc-aeson)
        ("ghc-http-api-data" ,ghc-http-api-data)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-network-uri" ,ghc-network-uri)
        ("ghc-servant" ,ghc-servant)
        ("ghc-lucid" ,ghc-lucid)
        ("ghc-servant-lucid" ,ghc-servant-lucid)
        ("ghc-vector" ,ghc-vector)))
    (arguments `(#:tests? #f))
    (home-page "https://github.com/dmjio/miso")
    (synopsis "A tasty Haskell front-end framework")
    (description
      "Miso is a small, production-ready, \"isomorphic\" Haskell
front-end framework featuring a virtual-dom, recursive diffing / patching
algorithm, event delegation, event batching, SVG, Server-sent events,
Websockets, type-safe servant-style routing and an extensible
Subscription-based subsystem.  Inspired by Elm, Redux and Bobril.  Miso is
pure by default, but side effects (like XHR) can be introduced into the
system via the Effect data type.  Miso makes heavy use of the GHCJS FFI
and therefore has minimal dependencies.")
    (license license:bsd-3)))

(define-public ghc-servant
  (package
    (name "ghc-servant")
    (version "0.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/servant/servant-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "18mfjj9za8g9rgj7a6j0ly6lf1ykfwrlpy3cf53lv1gxvb19gmk5"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-sop-core" ,ghc-sop-core)
        ("ghc-http-api-data" ,ghc-http-api-data)
        ("ghc-singleton-bool" ,ghc-singleton-bool)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-bifunctors" ,ghc-bifunctors)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-http-media" ,ghc-http-media)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-mmorph" ,ghc-mmorph)
        ("ghc-network-uri" ,ghc-network-uri)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-string-conversions"
         ,ghc-string-conversions)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-vault" ,ghc-vault)))
    (arguments `(#:tests? #f))
    (home-page "http://docs.servant.dev/")
    (synopsis
      "A family of combinators for defining webservices APIs")
    (description
      "A family of combinators for defining webservices APIs and serving
them.  You can learn about the basics in the
@url{http://docs.servant.dev/en/stable/tutorial/index.html, tutorial}.
@url{https://github.com/haskell-servant/servant/blob/master/servant/CHANGELOG.md,
CHANGELOG}")
    (license license:bsd-3)))

(define-public ghc-servant-client-core
  (package
    (name "ghc-servant-client-core")
    (version "0.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/servant-client-core/servant-client-core-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0b449c28z20sx98pc2d4p65jr3m9glsa47jjc2w4gf90jisl173r"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-servant" ,ghc-servant)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-free" ,ghc-free)
        ("ghc-http-media" ,ghc-http-media)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-network-uri" ,ghc-network-uri)
        ("ghc-safe" ,ghc-safe)
        ("ghc-sop-core" ,ghc-sop-core)))
    (arguments
      `(#:tests?
        #f
        #:cabal-revision
        ("1"
         "0vwj97h6x7zwvyx3ra09yhpi37mnn2kw5m27wnkzwwvk487swqxd")))
    (home-page "http://docs.servant.dev/")
    (synopsis
      "Core functionality and class for client function generation for servant APIs")
    (description
      "This library provides backend-agnostic generation of client
functions.  For more information, see the README.")
    (license license:bsd-3)))

(define-public ghc-servant-client
  (package
    (name "ghc-servant-client")
    (version "0.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/servant-client/servant-client-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0acwpjmi5r62jgmpw508jq942kq5dhdy5602w9v7g318inxzwwi1"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-servant" ,ghc-servant)
        ("ghc-servant-client-core"
         ,ghc-servant-client-core)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-http-client" ,ghc-http-client)
        ("ghc-http-media" ,ghc-http-media)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-kan-extensions" ,ghc-kan-extensions)
        ("ghc-monad-control" ,ghc-monad-control)
        ("ghc-semigroupoids" ,ghc-semigroupoids)
        ("ghc-transformers-base" ,ghc-transformers-base)
        ("ghc-transformers-compat"
         ,ghc-transformers-compat)))
    (arguments `(#:tests? #f))
    (home-page "http://docs.servant.dev/")
    (synopsis
      "Automatic derivation of querying functions for servant")
    (description
      "This library lets you derive automatically Haskell functions that
let you query each endpoint of a @url{http://hackage.haskell.org/package/servant,
servant}
webservice.  See
@url{http://docs.servant.dev/en/stable/tutorial/Client.html,
the client section of the tutorial}.
@url{https://github.com/haskell-servant/servant/blob/master/servant-client/CHANGELOG.md,
CHANGELOG}")
    (license license:bsd-3)))

(define-public ghc-servant-lucid
  (package
    (name "ghc-servant-lucid")
    (version "0.9.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/servant-lucid/servant-lucid-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0l68dffx746j3p2l5x59cj5cdng2dw6vjq5x5h44m0ccbsmlckpz"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-http-media" ,ghc-http-media)
        ("ghc-lucid" ,ghc-lucid)
        ("ghc-servant" ,ghc-servant)))
    (arguments `(#:tests? #f))
    (home-page
      "http://haskell-servant.readthedocs.io/")
    (synopsis "Servant support for lucid")
    (description
      "Servant support for lucid.  @emph{HTML} content type which will use
@code{ToHtml} class.  Lucid.Servant uses @code{Link} rather than
@code{Text} for safe @emph{href} attributes.")
    (license license:bsd-3)))

(define-public ghc-servant-server
  (package
    (name "ghc-servant-server")
    (version "0.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/servant-server/servant-server-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "05ricb3w1app6c094zwaq2jnqv53jpf4n89ffynm31dvf6h9qdih"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-servant" ,ghc-servant)
        ("ghc-http-api-data" ,ghc-http-api-data)
        ("ghc-base-compat" ,ghc-base-compat)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-http-media" ,ghc-http-media)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-network-uri" ,ghc-network-uri)
        ("ghc-monad-control" ,ghc-monad-control)
        ("ghc-network" ,ghc-network)
        ("ghc-sop-core" ,ghc-sop-core)
        ("ghc-string-conversions"
         ,ghc-string-conversions)
        ("ghc-resourcet" ,ghc-resourcet)
        ("ghc-tagged" ,ghc-tagged)
        ("ghc-transformers-base" ,ghc-transformers-base)
        ("ghc-wai" ,ghc-wai)
        ("ghc-wai-app-static" ,ghc-wai-app-static)
        ("ghc-word8" ,ghc-word8)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-warp" ,ghc-warp)))
    (arguments `(#:tests? #f))
    (home-page "http://docs.servant.dev/")
    (synopsis
      "A family of combinators for defining webservices APIs and serving them")
    (description
      "A family of combinators for defining webservices APIs and serving
them.  You can learn about the basics in the
@url{http://docs.servant.dev/en/stable/tutorial/index.html, tutorial}.
@url{https://github.com/haskell-servant/servant/blob/master/servant-server/example/greet.hs,
Here} is a runnable example, with comments, that defines a dummy API and
implements a webserver that serves this API, using this package.
@url{https://github.com/haskell-servant/servant/blob/master/servant-server/CHANGELOG.md,
CHANGELOG}")
    (license license:bsd-3)))

(define-public ghc-dec
  (package
    (name "ghc-dec")
    (version "0.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/dec/dec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0yslffafmqfkvhcw2arpc53hfmn1788z85ss9lxnbclr29lbvzgc"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f))
    (home-page "https://github.com/phadej/vec")
    (synopsis "Decidable propositions")
    (description
      "This package provides a @code{Dec} type.
@code{
type Neg a = a -> Void

data Dec a
= Yes a
| No (Neg a)}")
    (license license:bsd-3)))

(define-public ghc-singleton-bool
  (package
    (name "ghc-singleton-bool")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/singleton-bool/singleton-bool-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "17w9vv6arn7vvc7kykqcx81q2364ji43khrryl27r1cjx9yxapa0"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-dec" ,ghc-dec)))
    (arguments
      `(#:tests?
        #f
        #:cabal-revision
        ("3"
         "11rhzpy4xiry39bbxzwrqff75f0f4g7z0vkr3v9l8rv3w40jlf7x")))
    (home-page
      "https://github.com/phadej/singleton-bool#readme")
    (synopsis "Type level booleans")
    (description
      "Type level booleans.
@code{singletons} package provides similar functionality, but it has
tight dependency constraints.")
    (license license:bsd-3)))

(define-public ghc-string-conversions
  (package
    (name "ghc-string-conversions")
    (version "0.4.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/string-conversions/string-conversions-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "150rdank90h7v08x0wq4dffjbxv2daf5v9sqfs5mab76kinwxg26"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-utf8-string" ,ghc-utf8-string)))
    (arguments `(#:tests? #f))
    (home-page
      "https://github.com/soenkehahn/string-conversions#readme")
    (synopsis
      "Simplifies dealing with different types for strings")
    (description
      "Provides a simple type class for converting values of different
string types into values of other string types.")
    (license license:bsd-3)))
