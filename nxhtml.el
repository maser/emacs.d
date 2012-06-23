;;; nxhml
(load "~/.emacs.d/vendor/nxhtml/autostart.el")
(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 1
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)

; can't stand the default colors
(custom-set-faces
 '(mumamo-background-chunk-major ((t nil)))
 '(mumamo-background-chunk-submode1 ((t (:background "#222222"))))
 '(mumamo-background-chunk-submode2 ((t (:background "#222222"))))
 '(mumamo-background-chunk-submode3 ((t (:background "#222222"))))
 '(mumamo-background-chunk-submode4 ((t (:background "#222222")))))
