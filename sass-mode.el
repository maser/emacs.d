(use-package sass-mode
  :ensure t)
(require 'sass-mode)

(use-package rainbow-mode
  :ensure t)
(add-hook 'sass-mode-hook 'rainbow-mode)
