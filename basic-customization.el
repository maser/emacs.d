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
(setq-default indent-tabs-mode nil)

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

(setq default-directory "~/")

(setq major-mode 'text-mode)

;; delete-selection-mode
(delete-selection-mode 1)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; dired
(setq dired-listing-switches "-aohD")
(setq dired-auto-revert-buffer t)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; Use shell-like backspace C-h, rebind help to F1
(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (progn
        (comment-or-uncomment-region (region-beginning) (region-end))
        )
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
(global-set-key (kbd "M-;") 'comment-or-uncomment-line-or-region)

; window configuration history
(winner-mode 1)

; move buffers (using buffer-move package)
(global-set-key (kbd "C-c M-P")     'buf-move-up)
(global-set-key (kbd "C-c M-N")   'buf-move-down)
(global-set-key (kbd "C-c M-B")   'buf-move-left)
(global-set-key (kbd "C-c M-F")  'buf-move-right)

(add-hook 'prog-mode-hook (lambda ()
                            (guru-mode +1)))

