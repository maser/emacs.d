(use-package markdown-mode
  :ensure t
  :config
  (require 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode)))

