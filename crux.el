(use-package general
  :ensure t
  :config
  (require 'general))
(use-package crux
  :ensure t
  :config
  (general-define-key
   "C-k" 'crux-smart-kill-line
   "M-o" 'crux-smart-open-line
   "M-O" 'crux-smart-open-line-above
   "C-c D" 'crux-delete-file-and-buffer
   "C-c d" 'crux-duplicate-current-line-or-region
   "C-c M-d" 'crux-duplicate-and-comment-current-line-or-region
   ;; "C-c t" 'crux-visit-term-buffer
   "<C-backspace>" 'crux-kill-line-backwards)
  (crux-with-region-or-buffer indent-region)
  (crux-with-region-or-buffer untabify)
  (crux-with-region-or-line comment-or-uncomment-region)
  :pin melpa)
