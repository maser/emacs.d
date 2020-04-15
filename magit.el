(use-package magit
  :ensure t)
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(setq magit-completing-read-function 'ivy-completing-read)

(use-package glab
  :ensure t)

(use-package forge
  :ensure t
  :after (magit glab)
  :config
  (add-to-list 'forge-alist '("gitlab.cognita.ch" "gitlab.cognita.ch/api/v4" "gitlab.cognita.ch" forge-gitlab-repository)))
