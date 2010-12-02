;; ruby-mode
(require 'ruby-mode)
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '(".irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.builder$" . ruby-mode))

;; ruby-mode-hook
(add-hook 'ruby-mode-hook
         (lambda ()
           (set (make-local-variable 'indent-tabs-mode) 'nil)
           (set (make-local-variable 'tab-width) 2)
           (imenu-add-to-menubar "IMENU")
           (local-set-key (kbd "<return>") 'newline-and-indent)
	   (add-to-list 'ac-sources 'ac-source-rsense-method)
	   (add-to-list 'ac-sources 'ac-source-rsense-constant)
))

(load-file "~/.emacs.d/flymake-ruby.el")
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))

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
;; (require 'rdebug)
;; (setq rdebug-short-key-mode t)

;; Rsense
(setq rsense-home "/home/maser/.emacs.d/rsense")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)