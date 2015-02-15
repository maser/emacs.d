(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)

(global-set-key (kbd "C-S-SPC") 'set-rectangular-region-anchor)

(global-set-key (kbd "M-(") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-)") 'mc/mark-next-like-this)

(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
