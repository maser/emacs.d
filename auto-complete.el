;; auto-complete
(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-auto-start 0)   ; start completion when entered 3 characters
(setq ac-dwim 3)         ; Do what i mean
(setq ac-trigger-key "TAB")
