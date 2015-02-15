(load-file "~/.emacs.d/vendor/maser.el")

(global-set-key (kbd "M-o") 'maser-vim-o)
(global-set-key (kbd "M-O") 'maser-vim-O)
(global-set-key (kbd "C-c C-m d l a") 'maser-delete-line-above)
(global-set-key (kbd "C-c C-m d l b") 'maser-delete-line-below)
(global-set-key (kbd "C-c C-m a l a") 'maser-add-line-above)
(global-set-key (kbd "C-c C-m a l b") 'maser-add-line-below)
(global-set-key (kbd "C-c C-m a ; b") 'maser-add-semicolon-below)
(global-set-key (kbd "C-c C-m a , b") 'maser-add-comma-below)
(global-set-key (kbd "C-x C-s-f") 'djcb-find-file-as-root)


(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)
