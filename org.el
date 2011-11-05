;; org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'flyspell-mode)
(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-custom-commands
      '(("l" "lazy TODOs" todo nil
	 ((org-agenda-skip-function
	  '(org-agenda-skip-entry-if 'scheduled 'deadline 'timestamp))))))
