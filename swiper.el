(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package swiper
  :ensure t
  :after ivy
  :config
  (global-set-key "\C-s" 'swiper)
  (global-set-key "\C-r" 'swiper))

(use-package counsel
  :ensure t
  :after (swiper ivy)
  :config
  (counsel-mode 1))
