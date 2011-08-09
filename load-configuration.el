;; use bar cursor as default
(push '(cursor-type . bar) default-frame-alist)

;; Just say no to splash screens
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; Remove toolbar and scrollbar
(if (and (fboundp 'tool-bar-mode)
	 (fboundp 'scroll-bar-mode))
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))

(mouse-wheel-mode t)

(setq indent-tabs-mode nil)

; Increase undo size
(setq undo-limit 2000000)
(setq undo-strong-limit 3000000)

;; make scrolling nicer
(setq
 scroll-margin 4
 scroll-conservatively 1000
 scroll-preserve-screen-position 1)

;; show column number
(column-number-mode 1)

;; don't create annoying files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; highlighting
(setq query-replace-highlight t)
(setq search-highlight t)

(setq font-lock-maximum-decoration 3)

(fset 'yes-or-no-p 'y-or-n-p)

(setq major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'mixed)

(setq default-directory "~/")

;; uniquify: no more confusion because two buffers have the same name
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'reverse
 uniquify-separator ":")


; colors
; emacs 24 doesn’t like this
(if (string-match "24." (emacs-version))
    (progn 
      (require 'zenburn-theme)
      (load-theme 'zenburn))
  (progn
    (require 'color-theme)
    (setq color-theme-is-global t)
    (require 'zenburn)
    (color-theme-zenburn)
    )
)


;; bookmarks
(setq
 bookmark-default-file "~/.emacs.d/bookmarks"
 bookmark-save-flag 1)

;; windmove
(global-set-key (kbd "M-N") 'windmove-down)
(global-set-key (kbd "M-P") 'windmove-up)
(global-set-key (kbd "M-F") 'windmove-right)
(global-set-key (kbd "M-B") 'windmove-left)

;; delete-selection-mode
(delete-selection-mode)

(setq visible-bell t)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(require 'whitespace)
(setq whitespace-style 'trailing)
(setq whitespace-trailing-regexp
  "\\b.*\\(\\(\t\\| \\|\xA0\\|\x8A0\\|\x920\\|\xE20\\|\xF20\\)+\\)$")
(global-whitespace-mode)


;; dired
(setq dired-listing-switches "-aohD")

;; hl-line
(hl-line-mode)