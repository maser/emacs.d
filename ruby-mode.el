(load-conf "yasnippet")

;; ruby-mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))

(setq ruby-deep-indent-paren nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

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
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (set (make-local-variable 'ruby-insert-encoding-magic-comment) nil)
            (local-set-key (kbd "<return>") 'my-newline-and-indent)
            (flyspell-prog-mode)
            (highlight-indentation-current-column-mode)
            ))

(yas/load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")

; automatically reindent after typing "end"
(defun ruby-electric-indent-function (char)
  (if (eq major-mode 'ruby-mode)
      (if (char-equal char ?d)
          (string-equal "end" (buffer-substring (max 1 (- (point) 3)) (point))))))
(add-hook 'electric-indent-functions 'ruby-electric-indent-function)

(add-hook 'ruby-mode-hook 'subword-mode)
