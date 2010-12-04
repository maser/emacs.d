;; ruby-mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))

(defun my-newline-and-indent ()
  "I don't like backtraces popping up and ruby-indent-line seems to really enjoy that."
  (interactive)
  (condition-case err
      (newline-and-indent)
    (error 
     (message "%s" (error-message-string err))))
  )

;; ruby-mode-hook
(add-hook 'ruby-mode-hook
         (lambda ()
	   (add-hook 'local-write-file-hooks '(lambda ()
						(save-excursion
						  (untabify (point-min) (point-max))
						  )))
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           ;; (imenu-add-to-menubar "IMENU")
           (local-set-key (kbd "<return>") 'my-newline-and-indent)
	   (add-to-list 'ac-sources 'ac-source-rsense-method)
	   (add-to-list 'ac-sources 'ac-source-rsense-constant)
	   (flyspell-prog-mode)
))

(load-file "~/.emacs.d/flymake-ruby.el")
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))

;; Rsense
(setq rsense-home (expand-file-name "~/.emacs.d/rsense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
