;; the following apt packages are installed:
;; 
;; - ecb
;; - emacs-goodies-el
;; - cedet-common
;; - yaml-mode


;; set these variables before loading this file to disable some features
(if (not (boundp 'load-ecb))
    (setq load-ecb t))
(if (not (boundp 'load-cedet))
    (setq load-cedet t))
(if (not (boundp 'load-rcov))
    (setq load-rcov t))
(if (not (boundp 'load-nxhtml))
    (setq load-nxhtml t))

(load-file "~/.emacs.d/load-configuration.el")
(load-file "~/.emacs.d/load-misc.el")
(load-file "~/.emacs.d/load-ruby-and-rails.el")
(load-file "~/.emacs.d/load-web.el")
