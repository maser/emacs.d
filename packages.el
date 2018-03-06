(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)

(setq maser-required-packages (list
                               ; generic
                               'dired-details
                               'zenburn-theme
                               'smex
                               'ido-ubiquitous
                               'ido-vertical-mode
                               'flx-ido
                               'melpa
                               'ivy
                               'swiper

                               ; editing
                               'move-text
                               'expand-region
                               'multiple-cursors
                               'avy
                               'annoying-arrows-mode
                               'volatile-highlights
                               'rainbow-mode
                               'undo-tree
                               'yasnippet
                               'highlight-indentation
                               'git-gutter-fringe
                               'anzu
                               'fic-mode

                               ; tools
                               'magit
                               'org
                               'org-plus-contrib
                               'deft
                               'gist
                               'projectile

                               ; language tools
                               'flycheck
                               'js2-refactor

                               ; language modes
                               'coffee-mode
                               'feature-mode
                               'haml-mode
                               'js2-mode
                               'puppet-mode
                               'rspec-mode
                               'sass-mode
                               'scss-mode
                               'crontab-mode
                               'csv-mode
                               'yaml-mode
                               'markdown-mode
                               'gitconfig-mode
                               'haml-mode
                               ))

(dolist (package maser-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
