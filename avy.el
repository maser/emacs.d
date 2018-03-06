(use-package avy
  :chords (("jj" . avy-goto-word-1)
           ("jl" . avy-goto-line)
           ("jk" . avy-goto-char))
  :config
  (setq avy-all-windows nil)
  (setq avy-background t)
  (avy-setup-default)
  :ensure t)

