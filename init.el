(defun load-conf (filename)
  "load the file in ~/.emacs.d/ unless it has already been loaded"
  (defvar *maser-loaded-files* '())
  (if (not (memq filename *maser-loaded-files*))
      (progn
	(load-file (expand-file-name (concat "~/.emacs.d/" filename ".el")))
	(add-to-list '*maser-loaded-files* filename))))

(add-to-list 'load-path "~/.emacs.d/vendor/")

; basic
(load-conf "basic-customization")
(load-conf "customizations")
(load-conf "browser")
(load-conf "maxframe")
(load-conf "sml-modeline")
(load-conf "redo")
(load-conf "ido")
(load-conf "dired-details")
(load-conf "uniquify")
(load-conf "theme")
(load-conf "bookmarks")
(load-conf "windmove")
(load-conf "whitespace")
(load-conf "hl-line")
(load-conf "maser")

; general - text
(load-conf "move-text")
(load-conf "camelscore")
(load-conf "autopair")
(load-conf "rainbow-delimiters")
(load-conf "lorem-ipsum")
(load-conf "auto-fill-mode")
; (load-conf "viper")
(load-conf "evil")
(load-conf "mark-multiple")

; general - other
(load-conf "auto-complete")
(load-conf "yasnippet")
(load-conf "etags-table")
(load-conf "my-ido-find-tag")
(load-conf "find-file-in-project")

(load-conf "flymake")
(load-conf "org")
(load-conf "deft")
(load-conf "magit")
(load-conf "edit-server")
; (load-conf "ecb")

; language modes
(load-conf "ruby-mode")
(load-conf "rspec-mode")
(load-conf "cc-mode")
(load-conf "puppet-mode")
(load-conf "coffee-mode")
(load-conf "cucumber")
(load-conf "css-mode")
(load-conf "nxhtml")
(load-conf "scss-mode")
(load-conf "sass-mode")
(load-conf "js2-mode")
