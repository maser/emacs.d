;(load-conf "yasnippet")

;; ruby-mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl$" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru" . ruby-mode))

(setq ruby-deep-indent-paren nil)

;; I THINK this fixes if/when indentation
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

; (yas/load-directory "~/.emacs.d/vendor/yasnippets-rails/rails-snippets")

; automatically reindent after typing "end"
(defun ruby-electric-indent-function (char)
  (if (eq major-mode 'ruby-mode)
      (if (char-equal char ?d)
          (string-equal "end" (buffer-substring (max 1 (- (point) 3)) (point))))))
(add-hook 'electric-indent-functions 'ruby-electric-indent-function)

(add-hook 'ruby-mode-hook 'subword-mode)

(require 'ruby-tools)
(define-key ruby-tools-mode-map (kbd "C-;") 'undefined)
(add-hook 'ruby-mode-hook 'ruby-tools-mode)



(defvar ruby--paren-closings-regex
  "[])}\"']"
  "regex matching closing paren or string delimiter.")

(defun ruby--indent-before-all-sexps ()
  "
1. search backwards for a closing delimiter ON THIS LINE, then
   find the matching opening

2. if found, recurse, else the point is at a place we don't need
   to worry about sexps.
"
  (if (re-search-backward ruby--paren-closings-regex (point-at-bol) t)
      (let ((ppss (syntax-ppss))
            beg)
        (goto-char (match-beginning 0))
        (cond ((setq beg (nth 1 ppss))  ; brace
               (goto-char beg))
              ((nth 3 ppss)             ; string
               (goto-char (nth 8 ppss))))
        (ruby--indent-before-all-sexps))))


(defadvice ruby-indent-line (around line-up-args activate)
  "indent new line after comma at EOL properly:

i.e.

    foo_function a_param,
                 b_param,
                 c_param

Note that all params line up after the function.
"
  (let (indent ppss)
    (save-excursion
      (back-to-indentation)
      (skip-chars-backward " \t\n")
      (setq ppss (syntax-ppss))
      ;; check for inside comment, string, or inside braces
      (when (and (eq ?, (char-before))
                 (not (memq (syntax-ppss-context ppss) '(comment string)))
                 (zerop (car ppss)))
        (ruby--indent-before-all-sexps)
        (back-to-indentation)
        (if (save-excursion
              (skip-chars-backward " \t\n")
              (eq (char-before) ?,))
            (setq indent (current-column))
          (skip-syntax-forward "w_.")
          (skip-chars-forward " ")
          ;; if the first symbol on the line is followed, by a comma, then this
          ;; line must be a continuation
          (setq indent (current-column)))))
    (if indent
        (indent-line-to indent)
      ad-do-it)))
