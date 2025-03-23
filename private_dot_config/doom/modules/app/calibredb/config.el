;;; app/calibredb/config.el -*- lexical-binding: t; -*-

(use-package! calibredb
  :defer t
  :config
  (setq calibredb-root-dir "~/Dropbox/Apps/Calibre/"
        calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir)
        calibredb-library-alist '(("~/Dropbox/Apps/Calibre"))
        calibredb-id-width      3
        calibredb-author-width 10
        calibredb-title-width  30
        calibredb-tag-width    15))
