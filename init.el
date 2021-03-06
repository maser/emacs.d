(defun load-conf (filename)
  "load the file in ~/.emacs.d/ unless it has already been loaded"
  (defvar *maser-loaded-files* '())
  (if (not (memq filename *maser-loaded-files*))
      (progn
        (load-file (expand-file-name (concat "~/.emacs.d/" filename ".el")))
        (add-to-list '*maser-loaded-files* filename))))

;; This function replaces modes in some alist with another mode
;;
;; Some modes just insist on putting themselves into the
;; auto-mode-alist, this function helps me get rid of them
(defun replace-auto-mode (oldmode newmode)
  (dolist (aitem auto-mode-alist)
    (if (eq (cdr aitem) oldmode)
        (setcdr aitem newmode))))


(add-to-list 'load-path "~/.emacs.d/vendor/")

; basic
(load-conf "packages")
(load-conf "basic-customization")
(load-conf "customizations")
(load-conf "browser")
;; (load-conf "ido")
(load-conf "dired")
(load-conf "uniquify")
;; (load-conf "windmove")
(load-conf "whitespace")
(load-conf "hl-line")
(load-conf "dimmer")
(load-conf "crux")
(load-conf "electric-indent-mode")
(load-conf "undo-tree")
(load-conf "git-gutter")
(load-conf "git-messenger")
(load-conf "smart-mode-line")
;; (load-conf "evil")
(load-conf "scroll")
(load-conf "all-the-icons")

; general - text
(load-conf "smartparens")
(load-conf "lorem-ipsum")
(load-conf "multiple-cursors")
(load-conf "easy-kill")
(load-conf "expand-region")
(load-conf "toggle-quotes")
(load-conf "highlight-indentation")
(load-conf "anzu")
(load-conf "fic-mode")

; general - other
; (load-conf "yasnippet")
(load-conf "company-mode")
(load-conf "projectile")
(load-conf "avy")
(load-conf "swiper")
(load-conf "smex")
(load-conf "annoying-arrows-mode")

(load-conf "flycheck")
(load-conf "flycheck-typescript")
(load-conf "org")
(load-conf "deft")
(load-conf "magit")
(load-conf "git")

; language modes
(load-conf "ruby-mode")
(load-conf "rspec-mode")
(load-conf "cc-mode")
(load-conf "puppet-mode")
(load-conf "coffee-mode")
(load-conf "cucumber")
(load-conf "css-mode")
(load-conf "scss-mode")
(load-conf "sass-mode")
(load-conf "js2-mode")
(load-conf "js2-refactor")
(load-conf "markdown-mode")
(load-conf "yaml-mode")
(load-conf "scala")
(load-conf "typescript")
(load-conf "haskell")
(load-conf "rust")
(load-conf "octave")
