(load-conf "js2-mode")
(use-package js2-refactor
  :ensure t)
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")
