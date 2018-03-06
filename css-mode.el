;; css
(add-hook 'css-mode-hook
         (lambda()
           (local-set-key (kbd "<return>") 'newline-and-indent)
))

(use-package rainbow-mode
  :ensure t)
(add-hook 'css-mode-hook 'rainbow-mode)
