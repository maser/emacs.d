;; flymake
(require 'flymake)
(require 'flymake-cursor)

(global-set-key "\C-cfn" 'flymake-goto-next-error)
(global-set-key "\C-cfp" 'flymake-goto-prev-error)
