;; Interactively Do Things
(require 'ido)
(ido-mode t)

(setq ido-enable-flex-matching t
      ido-enable-prefix nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

(add-hook 'ido-setup-hook '(lambda ()
                             (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
                             (define-key ido-completion-map "\C-n" 'ido-next-match)
                             (define-key ido-completion-map "\C-f" 'ido-next-match)
                             (define-key ido-completion-map "\C-p" 'ido-prev-match)
                             (define-key ido-completion-map "\C-b" 'ido-prev-match)
                             (define-key ido-completion-map " " 'ido-exit-minibuffer)
          ))

(use-package ido-ubiquitous
  :ensure t)
(ido-ubiquitous-mode 1)
(use-package ido-vertical-mode
  :ensure t)
(ido-vertical-mode 1)
(use-package flx-ido
  :ensure t)
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-use-faces nil)
