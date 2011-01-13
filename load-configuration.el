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

;; use CUA rectangle mode 
;(setq cua-enable-cua-keys nil)
;(cua-mode)

;; uniquify: no more confusion because two buffers have the same name
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'reverse
 uniquify-separator ":")


; colors
(require 'color-theme)
(setq color-theme-is-global t)
(require 'zenburn)
(color-theme-zenburn)

;; (load "~/.emacs.d/color-theme-twilight.el")
;; (color-theme-twilight)

;; (defun set-colors ()
;;   (color-theme-arjen)
;;   (set-background-color "#2b2b2b")
;;   (set-foreground-color "white")
;;   (set-face-background 'modeline "DarkRed")
;;   (set-face-foreground 'modeline "white"))
;; (set-colors)

;; bookmarks
(setq
 bookmark-default-file "~/.emacs.d/bookmarks"
 bookmark-save-flag 1)

;; windmove
(global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-p") 'windmove-up)
(global-set-key (kbd "s-f") 'windmove-right)
(global-set-key (kbd "s-b") 'windmove-left)

;; delete-selection-mode
(delete-selection-mode)

(setq visible-bell t)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
