(add-to-list 'load-path "~/.emacs.d/vendor/multiple-cursors.el")
(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)

(global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor)

(global-set-key (kbd "M-(") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-)") 'mc/mark-next-like-this)

(let ((map-rename-sgml-tag (lambda ()
                             (local-set-key (kbd "C-c C-r") 'mc/mark-sgml-tag-pair))))
  (add-hook 'nxml-mode-hook map-rename-sgml-tag)
  (add-hook 'eruby-html-mumamo-mode-hook map-rename-sgml-tag)
  (add-hook 'html-mode-hook map-rename-sgml-tag))

(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
