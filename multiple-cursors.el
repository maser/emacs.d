(use-package iy-go-to-char
  :ensure t
  :config
  (general-define-key
   "C-c f" 'iy-go-to-char
   "C-c F" 'iy-go-to-char-backward
   "C-c t" 'iy-go-up-to-char
   "C-c T" 'iy-go-up-to-char-backward))

(use-package multiple-cursors
  :ensure t
  :after iy-go-to-char
  :config
  (require 'multiple-cursors)
  (general-define-key
   "C-S-SPC" 'mc/edit-lines
   "C-<" 'mc/mark-previous-like-this-symbol
   "C-M-<" 'mc/skip-to-previous-like-this
   "C->" 'mc/mark-next-like-this-symbol
   "C-M->" 'mc/skip-to-next-like-this
   "C-c C-<" 'mc/mark-all-like-this)

  (global-unset-key (kbd "C-<down-mouse-1>"))
  (global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
  (add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos))

