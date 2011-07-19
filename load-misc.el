(setq *find-file-in-project-project-roots*
      '(".git" ".hg"))
(setq *find-file-in-project-gf-exclude*
      "\\.git|/vendor/|/fixtures/|/tmp/|/log/")
(setq find-file-in-project-use-file-cache nil)
(require 'find-file-in-project)
(find-file-in-project-mode)

;; cc-mode
(require 'cc-mode)
(defun custom-c-mode-common-hook ()
  (c-toggle-auto-hungry-state t)
  (c-set-style "java")
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-mode-common-hook 'custom-c-mode-common-hook)

;; Interactively Do Things
(require 'ido)
(ido-mode t)
(add-hook 'ido-setup-hook '(lambda ()
			     (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
			     (define-key ido-completion-map "\C-n" 'ido-next-match)
			     (define-key ido-completion-map "\C-f" 'ido-next-match)
			     (define-key ido-completion-map "\C-p" 'ido-prev-match)
			     (define-key ido-completion-map "\C-b" 'ido-prev-match)
			     (define-key ido-completion-map " " 'ido-exit-minibuffer)
	  ))

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; flymake
(require 'flymake)

;; ecb
(if load-ecb
    (progn
      (require 'ecb)
      (setq ecb-tip-of-the-day nil)
      (setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))))

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-auto-start 0)   ; start completion when entered 3 characters
(setq ac-dwim 3)         ; Do what i mean
(setq ac-trigger-key "TAB")

;; cedet
(if load-cedet
    (progn
      (require 'cedet)
      (semantic-load-enable-excessive-code-helpers)
      (setq semantic-load-turn-everything-on t)
      (require 'semantic-ia)))

;; maxframe
(add-to-list  'load-path "~/.emacs.d/maxframe")
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(if load-ecb
    (add-hook 'window-setup-hook 'ecb-redraw-layout t))

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;; redo
(add-to-list  'load-path "~/.emacs.d/redo")
(require 'redo)
(global-set-key [(control -)] 'redo)

(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

;; Lorem ipsum dolor sit amet
(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
"eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad "
"minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
"aliquip ex ea commodo consequat. Duis aute irure dolor in "
"reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
"pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
"culpa qui officia deserunt mollit anim id est laborum."))

(if (require 'sml-modeline nil 'noerror)    ;; use sml-modeline if available
    (sml-modeline-mode 1))                  ;; show buffer pos in the mode line

;; org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

;; etags-table
(require 'etags-table)
(setq etags-table-search-up-depth 100)

;; ido search for tags
(load-file "~/.emacs.d/my-ido-find-tag.el")
(global-set-key (kbd "M-.") 'my-ido-find-tag)

;; yasnippet
(require 'yasnippet-bundle)

;; move-text
(require 'move-text)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; dired-details
(require 'dired-details)
(setq dired-details-hidden-string "")

(load-file "~/.emacs.d/camelscore.el")

(if load-zeitgeist
    (load-file "~/.emacs.d/zeitgeist.el"))

(when (require 'rainbow-delimiters nil 'noerror)
  (progn
    (add-hook 'ruby-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'js2-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'scss-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)))

;; (setq viper-mode nil)
;; (setq viper-expert-level  '5)
;; (setq viper-inhibit-startup-message  't)
;; (require 'viper)

(load-file "~/.emacs.d/puppet-mode-init.el")
