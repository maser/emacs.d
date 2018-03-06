(use-package avy
  :ensure t)
(setq avy-all-windows nil)
(setq avy-background t)
(avy-setup-default)

(use-package key-chord
  :ensure t)
(require 'key-chord)
(key-chord-mode +1)
(key-chord-define-global "jj" 'avy-goto-word-1)
(key-chord-define-global "jl" 'avy-goto-line)
(key-chord-define-global "jk" 'avy-goto-char)
(avy-setup-default)
