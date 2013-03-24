(require 'package)
(setq package-archives '())
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq maser-required-packages (list
                               'magit
                               'git-commit-mode
                               'coffee-mode
                               'feature-mode
                               'deft
                               'org
                               'org-plus-contrib
                               'dired-details
                               'expand-region
                               'flymake-cursor
                               'haml-mode
                               'flymake-jshint
                               'mark-more-like-this
                               'maxframe
                               'puppet-mode
                               'rainbow-delimiters
                               'rainbow-mode
                               'redo+   ; TODO
                               'rsense
                               'rspec-mode
                               'rvm
                               'gist
                               'sass-mode
                               'scss-mode
                               'rainbow-mode
                               'sml-modeline
                               'undo-tree ; TODO
                               'zenburn-theme
                               'yasnippet
                               'crontab-mode
                               'csv-mode
                               'ruby-end ; TODO
                               'smex
                               'volatile-highlights
                               'ido-ubiquitous
                               'flymake-ruby
                               'yaml-mode
                               'markdown-mode
                               'ace-jump-mode
                               'annoying-arrows-mode
                               'auto-complete
                               'autopair
                               'clojure-mode
                               'crontab-mode
                               'csv-mode
                               'edit-server
                               'etags-table
                               'expand-region
                               'gist
                               'git-commit-mode
                               'gitconfig-mode
                               'haml-mode
                               'highlight-indentation
                               'js2-mode
                               'js2-refactor
                               'move-text
                               'multiple-cursors
                               'nrepl
                               'smooth-scroll
                               'zencoding-mode
                               'flymake-css
                               'flymake-cursor
                               'flymake-sass))

(dolist (package maser-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
