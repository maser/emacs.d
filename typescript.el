(use-package web-mode
  :ensure t
  :config
  (require 'web-mode))

(use-package typescript
  :ensure t
  :after web-mode
  :config
  (require 'typescript)
  (add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode)))

(use-package tide
  :ensure t
  :after (typescript flycheck company)
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  ;; use the TypeScript version used in the project
  (setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")
  (flycheck-add-mode 'typescript-tslint 'web-mode))

