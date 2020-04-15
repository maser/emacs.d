(use-package haskell-mode
  :ensure t
  :config
  (defun prelude-haskell-mode-defaults ()
    (subword-mode +1)
    (flymake-mode-off))

  (setq prelude-haskell-mode-hook 'prelude-haskell-mode-defaults)

  (add-hook 'haskell-mode-hook (lambda ()
                                 (run-hooks 'prelude-haskell-mode-hook)))

                                        ; stop haskell-mode from enabling fucking flymake
  (setq flymake-allowed-file-name-masks (delete '("\\.l?hs\\'" haskell-flymake-init) flymake-allowed-file-name-masks))

  (setq company-ghc-show-info t)
  (setq company-ghc-show-module t)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
  (defun haskell-mode-suggest-indent-choice ()) ; get haskell-mode to fucking shut up about it’s stupid indentation stuff
  (add-hook 'haskell-mode-hook 'flymake-mode-off))

(use-package shm
  :ensure t
  :after haskell-mode
  :config
  (require 'shm)
  (define-key shm-map (kbd "C-w") nil)
  (define-key shm-map (kbd "C-x C-k") 'shm/kill-region)

  (add-hook 'haskell-mode-hook 'structured-haskell-mode)
  )
