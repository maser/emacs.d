;; css
(add-hook 'css-mode-hook
         (lambda()
           (local-set-key (kbd "<return>") 'newline-and-indent)
))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;; nxhml
(if load-nxhtml
    ((load "~/.emacs.d/nxhtml/autostart.el")
     (setq
      nxhtml-global-minor-mode t
      mumamo-chunk-coloring 1
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil
      nxml-degraded t)))

; can't stand the default colors
(custom-set-faces
 '(mumamo-background-chunk-major ((t nil)))
 '(mumamo-background-chunk-submode1 ((t (:background "#222222"))))
 '(mumamo-background-chunk-submode2 ((t (:background "#222222"))))
 '(mumamo-background-chunk-submode3 ((t (:background "#222222"))))
 '(mumamo-background-chunk-submode4 ((t (:background "#222222")))))


;; Sass
(require 'sass-mode)