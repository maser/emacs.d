;; ruby-mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

;; ruby-mode-hook
(add-hook 'ruby-mode-hook
         (lambda ()
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (imenu-add-to-menubar "IMENU")
           (local-set-key (kbd "<return>") 'newline-and-indent)
	   (add-to-list 'ac-sources 'ac-source-rsense-method)
	   (add-to-list 'ac-sources 'ac-source-rsense-constant)
	   (local-set-key (kbd "C-c .") 'ac-complete-rsense)
))

(load-file "~/.emacs.d/flymake-ruby.el")

;; rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; rcov 
;; run rcov with --text-report --save coverage.info options
(if load-rcov
    (progn
      (add-to-list 'load-path "~/.emacs.d/rcov")
      (require 'rcov-overlay)
      (setq rcov-overlay-fg-color "#440000")))


;; rdebug -- installed from http://rubyforge.org/projects/ruby-debug/ (ruby-debug-extras package)
(require 'rdebug)
(setq rdebug-short-key-mode t)

;; Replace $RSENSE_HOME with the directory where RSense was installed in full path
;; Example for UNIX-like systems
;; (setq rsense-home "/home/tomo/opt/rsense-0.2")
;; or
;; (setq rsense-home (expand-file-name "~/opt/rsense-0.2"))
;; Example for Windows
;; (setq rsense-home "C:\\rsense-0.2")
(setq rsense-home "/home/maser/.emacs.d/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)