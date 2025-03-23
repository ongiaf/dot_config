;; -*- no-byte-compile: t; -*-
;;; app/eat/packages.el

(package! eat
  :recipe (:type git :host codeberg :repo "akib/emacs-eat"
           :files ( "*.el" ("term" "term/*.el") "*.texi"
                    "*.ti" ("terminfo/e" "terminfo/e/*")
                    ("terminfo/65" "terminfo/65/*")
                    ("integration" "integration/*")
                    (:exclude ".dir-locals.el" "*-tests.el"))))
