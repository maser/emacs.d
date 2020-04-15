(use-package ivy
  :ensure t
  :pin melpa-stable
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package swiper
  :ensure t
  :after ivy
  :pin melpa-stable
  :config
  (global-set-key "\C-s" 'swiper)
  (global-set-key "\C-r" 'swiper))

(use-package counsel
  :ensure t
  :after (swiper ivy)
  :pin melpa-stable
  :config
  (counsel-mode 1))

(use-package ivy-hydra
  :ensure t
  :pin melpa-stable
  :after (ivy hydra))
