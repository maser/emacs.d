(use-package feature-mode
  :ensure t
  :config
  (require 'feature-mode)
  (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode)))

