;; textmate mode
(add-to-list 'load-path "~/.emacs.d/textmate")
(require 'textmate)
(textmate-mode)
; some nice keybindings
(global-set-key (kbd "s-t") 'textmate-goto-file)
(global-set-key (kbd "s-T") 'textmate-goto-symbol)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

;; cc-mode
(require 'cc-mode)
(defun custom-c-mode-common-hook ()
  (c-toggle-auto-hungry-state t)
  (c-set-style "java")
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-mode-common-hook 'custom-c-mode-common-hook)

;; color theme
(require 'color-theme)
(setq color-theme-is-global t)

;; anything
(require 'anything)
(require 'anything-config)

(setq anything-sources
      '(anything-c-source-buffers
        anything-c-source-buffer-not-found
        anything-c-source-file-name-history
        anything-c-source-info-pages
        anything-c-source-info-elisp
        anything-c-source-man-pages
        anything-c-source-locate
        anything-c-source-emacs-commands
        anything-c-source-files-in-current-dir
        anything-c-source-emacs-functions
        anything-c-source-emacs-variables
        anything-c-source-bookmarks
        anything-c-source-bookmarks-ssh
        anything-c-source-bookmarks-local
        anything-c-source-imenu
        anything-c-source-ctags
        anything-c-source-semantic
        anything-c-source-kill-ring
        anything-c-source-fixme
        ))

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; flymake
(require 'flymake)

;; ecb
(require 'ecb)
(setq ecb-tip-of-the-day nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-auto-start 2)   ; start completion when entered 3 characters
(setq ac-dwim 3)         ; Do what i mean

;; cedet
; (semantic-load-enable-minimum-features) ; is included in:
;(semantic-load-enable-code-helpers) ; is included in:
;(semantic-load-enable-gaudy-code-helpers) ; is included in:
(semantic-load-enable-excessive-code-helpers)
(setq semantic-load-turn-everything-on t)
(require 'semantic-ia)

;; maxframe
(add-to-list  'load-path "~/.emacs.d/maxframe")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
(add-hook 'window-setup-hook 'ecb-redraw-layout t)

;; wrap regions like in textmate
(require 'parenthesis)

;; and enable it for ruby-mode and rhtml-mode
(add-hook
 'ruby-mode-hook
 (lambda()
   (parenthesis-register-keys "{('\"[" ruby-mode-map)))
(add-hook
 'rhtml-mode-hook
 (lambda()
   (parenthesis-register-keys "{('\"[" rhtml-mode-map)))

;; redo
(add-to-list  'load-path "~/.emacs.d/redo")
(require 'redo)
(global-set-key [(control -)] 'redo)
