(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))

(package-initialize)

(setq maser-required-packages (list
			       'magit
			       'auto-complete
			       'coffee-mode
			       'feature-mode
			       'deft
			       'dired-details
			       'expand-region
			       'flymake-cursor
			       'haml-mode
			       'js2-mode
                               'flymake-jshint
			       'mark-multiple
			       'mark-more-like-this
			       'maxframe
			       'puppet-mode
			       'rainbow-delimiters
			       'rspec-mode
			       'rvm
			       'sass-mode
			       'scss-mode
			       'sml-modeline
			       'undo-tree
			       'zenburn-theme
			       'yasnippet
			       'crontab-mode
			       'csv-mode
			       'ruby-end
			       'smex
			       'volatile-highlights
			       'ido-ubiquitous
			       'flymake-ruby
                               'yaml-mode
			       'flymake-sass))

(dolist (package maser-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
