;; Interactively Do Things
(require 'ido)
(ido-mode t)
(add-hook 'ido-setup-hook '(lambda ()
			     (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
			     (define-key ido-completion-map "\C-n" 'ido-next-match)
			     (define-key ido-completion-map "\C-f" 'ido-next-match)
			     (define-key ido-completion-map "\C-p" 'ido-prev-match)
			     (define-key ido-completion-map "\C-b" 'ido-prev-match)
			     (define-key ido-completion-map " " 'ido-exit-minibuffer)
	  ))

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)
