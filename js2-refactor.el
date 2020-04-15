(use-package js2-refactor
  :ensure t
  :after js2-mode
  :config
  (require 'js2-refactor)
  (js2r-add-keybindings-with-prefix "C-c C-m"))

