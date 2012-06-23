(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode/build")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(require 'js2-highlight-vars)
(autoload 'espresso-mode "espresso")

;; js2 configuration
(setq js-indent-level 4)
(setq js2-basic-offset 4)
(setq js2-mode-indent-ignore-first-tab t)
(setq espresso-indent-level 4)
(setq c-basic-offset 4)

(defun my-js2-mode-hook ()
  (local-set-key (kbd "<return>") 'newline-and-indent)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode)))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)
