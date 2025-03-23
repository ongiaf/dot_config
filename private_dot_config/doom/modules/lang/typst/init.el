;;; lang/typst/init.el -*- lexical-binding: t; -*-

(use-package! typst-ts-mode
  :custom
  (typst-ts-mode-watch-options "--open")
  (typst-ts-mode-enable-raw-blocks-highlight t)
  (typst-ts-mode-highlight-raw-blocks-at-startup t))
