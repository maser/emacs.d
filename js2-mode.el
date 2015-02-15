(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(replace-auto-mode 'javascript-mode 'js2-mode)
(replace-auto-mode 'js-mode 'js2-mode)

;; js2 configuration
(setq js2-basic-offset 4)
(setq js2-mode-indent-ignore-first-tab t)
(setq js2-highlight-external-variables nil)
(setq js2-highlight-level 3)
(setq js2-mirror-mode nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-bounce-indent-p nil)
(setq js2-pretty-multiline-declarations t)

(defun my-js2-mode-hook ()
  (local-set-key (kbd "<return>") 'newline-and-indent)
  (local-set-key (kbd "C-c C-m u s") 'maser/insert-use-strict))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)

(defun maser/insert-use-strict ()
  (interactive)
  (insert "\"use strict\";")
  (newline-and-indent))

(add-hook 'js2-mode-hook 'subword-mode)
