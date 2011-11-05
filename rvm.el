(add-to-list 'load-path "~/.emacs.d/vendor/rvm.el")
(require 'rvm)

(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

