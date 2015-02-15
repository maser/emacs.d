;; org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'flyspell-mode)
(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-custom-commands
      '(("l" "lazy TODOs" todo nil
         ((org-agenda-skip-function
           '(org-agenda-skip-entry-if 'scheduled 'deadline 'timestamp))))))

(add-hook 'org-mode-hook
          (lambda ()
            (set (make-local-variable 'electric-indent-functions)
                 (list (lambda (arg) 'no-indent)))))

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(define-key org-mode-map (kbd "<f11>") 'org-clock-in)
(global-set-key [f12] 'org-clock-out)

(define-key global-map "\C-cc" 'org-capture)

(setq maser/todo-file (concat org-directory "/todo.org"))
(setq maser/emacs-drill-file (concat org-directory "/emacs-drill.org"))

(setq org-capture-templates
      '(("t" "TODO" entry (file maser/todo-file)
         "* TODO %?\n  SCHEDULED: %t\n  %i")
        ("e" "Emacs drill" entry (file maser/emacs-drill-file)
         "** %?   :drill:\n\nQuestion\n\n*** Answer\n\n")))

(setq org-agenda-archives-mode nil)
(setq org-agenda-skip-comment-trees nil)
(setq org-agenda-skip-function nil)
