(use-package coffee-mode
  :ensure t)
(require 'coffee-mode)
(add-hook 'coffee-mode-hook
	  '(lambda() (set (make-local-variable 'tab-width) 2)))
