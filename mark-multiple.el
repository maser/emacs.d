(add-to-list 'load-path "~/.emacs.d/vendor/mark-multiple")
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "M-(") 'mark-previous-like-this)
(global-set-key (kbd "M-)") 'mark-next-like-this)
