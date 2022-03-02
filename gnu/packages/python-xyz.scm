(define-public python-pyudorandom
  (package
    (name "python-pyudorandom")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "pyudorandom" version))
        (sha256
          (base32 "0mbpqgl8klq68vfcddr8ancxwpqg3zvjksw7gyf5zhbh04x0j2pk"))))
    (build-system python-build-system)
    (home-page "UNKNOWN")
    (synopsis "Generate pseudorandom numbers by using algebra")
    (description "Generate pseudorandom numbers by using algebra")
    (license #f)))

(define-public python-accumulation-tree
  (package
    (name "python-accumulation-tree")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "accumulation_tree" version))
        (sha256
          (base32 "0hbi85l9jw3f3ic476qhmc0v4r42jsx40ndgs0k23a2npa1z1q0d"))))
    (build-system python-build-system)
    (home-page "https://github.com/tkluck/accumulation_tree")
    (synopsis
      "Red/black tree with support for fast accumulation of values in a key range")
    (description
      "Red/black tree with support for fast accumulation of values in a key range")
    (license license:expat)))

(define-public python-tdigest
  (package
    (name "python-tdigest")
    (version "0.5.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "tdigest" version))
        (sha256
          (base32 "03jd6skj12063w2kwclhss6014bc7d749na3dxw62iq2mj5zrvwd"))))
    (build-system python-build-system)
    (propagated-inputs (list python-accumulation-tree python-pyudorandom))
    (native-inputs
      (list python-numpy
            python-pytest
            python-pytest-cov
            python-pytest-timeout))
    (home-page "https://github.com/CamDavidsonPilon/tdigest")
    (synopsis "T-Digest data structure")
    (description "T-Digest data structure")
    (license license:expat)))

(define-public python-ttictoc
  (package
    (name "python-ttictoc")
    (version "0.5.6")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "ttictoc" version))
        (sha256
          (base32 "1nb436zyidwrqzzfz0r55s9nk05jjy7kysbiglzv36gjz8sabq4s"))))
    (build-system python-build-system)
    (home-page "https://github.com/hector-sab/ttictoc")
    (synopsis "Time parts of your code easily.")
    (description "Time parts of your code easily.")
    (license license:expat)))

(define-public python-sphinxcontrib-autoyaml
  (package
    (name "python-sphinxcontrib-autoyaml")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (pypi-uri "sphinxcontrib-autoyaml" version))
        (sha256
          (base32 "1ghwyjl4414sn7d4z8bqfjy526d54hb1zfvlrgbfrnml61rcb3ri"))))
    (build-system python-build-system)
    (propagated-inputs (list python-ruamel.yaml python-sphinx))
    (home-page "https://github.com/Jakski/sphinxcontrib-autoyaml")
    (synopsis
      "Sphinx autodoc extension for documenting YAML files from comments")
    (description
      "Sphinx autodoc extension for documenting YAML files from comments")
    (license license:expat)))

