;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       rime

       :completion
       (corfu +icons +orderless +dabbrev)
       (vertico +childframe +icons)

       :ui
       doom
       doom-dashboard
       hl-todo
       indent-guides
       ligatures
       modeline
       ophints
       (popup +defaults)
       treemacs
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces
       modus-themes

       :editor
       (evil +everywhere)
       ;; (meow +qwerty +override +leader)
       file-templates
       fold
       (format +onsave)
       lispy
       multiple-cursors
       rotate-text
       snippets
       word-wrap

       :emacs
       (dired +dirvish +icons)
       electric
       (ibuffer +icons)
       undo
       vc

       :term
       eshell
       eat

       :checkers
       syntax

       :tools
       biblio
       debugger
       direnv
       docker
       editorconfig
       (eval +overlay)
       lookup
       (lsp +eglot)
       (magit +forge)
       make
       rgb
       tree-sitter

       :os
       (:if IS-MAC macos)
       (tty +osc)

       :lang
       (cc +lsp +tree-sitter)
       common-lisp
       data
       emacs-lisp
       typst
       (ess +tree-sitter)
       (json +tree-sitter)
       julia
       latex
       ledger
       (lua +lsp +fennel +tree-sitter)
       markdown
       org
       (python +conda +cython +lsp +pyright +tree-sitter)
       (rust +lsp +tree-sitter)
       (sh +fish +tree-sitter)

       :email

       :app
       denote
       calibredb

       :config
       (default +bindings +smartparens))
