;;; app/eat/config.el -*- lexical-binding: t; -*-

(use-package! eat
  :init
  (add-hook 'eshell-load-hook #'eat-eshell-mode)
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode))
