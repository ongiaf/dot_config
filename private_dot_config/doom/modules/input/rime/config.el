;;; app/rime/config.el -*- lexical-binding: t; -*-

(use-package! rime
  :defer t
  :custom
  (rime-user-data-dir (if IS-MAC "~/Library/Rime" "~/.local/share/fcitx5/rime"))
  (rime-librime-root (if IS-MAC "/opt/homebrew/" nil))
  (rime-emacs-module-header-root (if IS-MAC "/opt/homebrew/include/emacs-module.h" nil))
  (default-input-method "rime"))
