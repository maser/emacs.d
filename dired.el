(require 'dired)

(setq dired-listing-switches "-aohD")
(setq dired-auto-revert-buffer t)

;; Move files between split panes
(setq dired-dwim-target t)

;; dired-details
(use-package dired-details
  :ensure t)
(require 'dired-details)
(setq dired-details-hidden-string "--- ")
(dired-details-install)

;; C-a is nicer in dired if it moves back to start of files
(defun dired-back-to-start-of-files ()
  (interactive)
  (backward-char (- (current-column) 2)))

(define-key dired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)

(require 'dired-x)
