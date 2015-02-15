(add-to-list 'load-path "~/.emacs.d/vendor/magit")
(require 'magit)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
