(use-package scss-mode
  :ensure t
  :after rainbow-mode
  :config
  (autoload 'scss-mode "scss-mode")
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  (setq scss-compile-at-save nil)
  (add-hook 'css-mode-hook 'rainbow-mode))
