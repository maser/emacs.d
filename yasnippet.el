(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(use-package yasnippet
  :ensure t)
(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/vendor/my-snippets")
(setq yas-snippet-dirs (remove "~/.emacs.d/snippets" yas-snippet-dirs))

(use-package popup
  :ensure t)
(require 'popup)
(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas/prompt-functions
      '(yas/popup-isearch-prompt
        yas/ido-prompt))
