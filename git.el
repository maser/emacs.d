(add-hook 'git-commit-mode-hook (lambda () (auto-fill-mode 1)))

(use-package browse-at-remote
  :ensure t
  :bind (("C-c g g" . browse-at-remote)))
