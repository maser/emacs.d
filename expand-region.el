(add-to-list 'load-path "~/.emacs.d/vendor/expand-region.el")
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)