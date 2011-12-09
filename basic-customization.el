;; use a separate customization file
(setq custom-file "~/.emacs.d/customizations.el")

;; use bar cursor as default
(push '(cursor-type . bar) default-frame-alist)

;; Just say no to splash screens
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; Remove toolbar, scrollbar and menu bar
(if (and (fboundp 'tool-bar-mode)
	 (fboundp 'scroll-bar-mode)
         (fboundp 'menu-bar-mode))
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (menu-bar-mode 0)))


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

(show-paren-mode t)
(setq show-paren-style 'mixed)

(setq default-directory "~/")

(setq major-mode 'text-mode)

;; delete-selection-mode
(delete-selection-mode)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; dired
(setq dired-listing-switches "-aohD")
