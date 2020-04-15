(use-package expand-region
  :ensure t
  :config
  (require 'expand-region)
  (global-set-key (kbd "C-M-m") 'er/expand-region)
  (global-set-key (kbd "C-M-c") 'er/contract-region))

