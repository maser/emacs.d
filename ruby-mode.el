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

;; ruby-mode-hook
(add-hook 'ruby-mode-hook
          (lambda ()
            ;; (local-set-key (kbd "<return>") 'my-newline-and-indent)
            ;; (flyspell-prog-mode)
            (highlight-indentation-current-column-mode)
            ))

(add-hook 'ruby-mode-hook 'subword-mode)

(require 'ruby-tools)
(define-key ruby-tools-mode-map (kbd "C-;") 'undefined)
(add-hook 'ruby-mode-hook 'ruby-tools-mode)

(defvar ruby--paren-closings-regex
  "[])}\"']"
  "regex matching closing paren or string delimiter.")
