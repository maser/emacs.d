(use-package scss-mode
  :ensure t)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

(use-package rainbow-mode
  :ensure t)
(add-hook 'css-mode-hook 'rainbow-mode)
