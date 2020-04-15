(use-package sass-mode
  :ensure t
  :after rainbow-mode
  :config
  (require 'sass-mode)
  (add-hook 'sass-mode-hook 'rainbow-mode))
