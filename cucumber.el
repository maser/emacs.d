(add-to-list 'load-path "~/.emacs.d/vendor/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(yas/load-directory "~/.emacs.d/vendor/cucumber.el/snippets")
