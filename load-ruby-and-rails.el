;; ruby-mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))

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
           (add-hook 'after-save-hook '(lambda ()
                                         (when (and (eq major-mode 'ruby-mode) buffer-file-name (not (string-match "\.erb$" buffer-file-name)))
                                           (if tags-file-name
                                               (let* ((file-to-update buffer-file-name)
                                                      (tags-file-to-update tags-file-name)
                                                      (output (
                                                               (condition-case err
								   (with-output-to-string
								     (with-current-buffer standard-output
								       (call-process "rtags" nil t nil "-a" "-f" tags-file-to-update file-to-update)))
								 (error (message "%s" (error-message-string err)))))))
                                                 (message output))))))
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (local-set-key (kbd "<return>") 'my-newline-and-indent)
           (add-to-list 'ac-sources 'ac-source-rsense-method)
           (add-to-list 'ac-sources 'ac-source-rsense-constant)
           (flyspell-prog-mode)
           (auto-fill-mode 1)
           (set (make-local-variable 'comment-auto-fill-only-comments) t)
))

(load-file "~/.emacs.d/flymake-ruby.el")
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.text\\.plain\\.erb\\'" . eruby-mumamo-mode))

;; Rsense
(setq rsense-home (expand-file-name "~/.emacs.d/rsense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

(add-to-list 'load-path "~/.emacs.d/rspec-mode")
(require 'rspec-mode)

(load-file "~/.emacs.d/yasnippets-rails/setup.el")
(load-file "~/.emacs.d/yasnippets-rspec/setup.el")


(add-to-list 'load-path "~/.emacs.d/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(yas/load-directory "~/.emacs.d/cucumber.el/snippets")
