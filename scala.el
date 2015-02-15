;; load the ensime lisp code...
;; (add-to-list 'load-path "~/.emacs.d/vendor/ensime/elisp/")
(require 'ensime)
(require 'scala-mode2)

;; This step causes the ensime-mode to be started whenever
;; scala-mode is started for a buffer. You may have to customize this step
;; if you're not using the standard scala mode.
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(define-key scala-mode-map (kbd "C-u M-.") 'ensime-edit-definition-other-window)

(add-hook 'scala-mode-hook 'subword-mode)

;; Enable semantic highlighting
(setq ensime-sem-high-faces
      '(
        (var . (:foreground "#ff2222"))
        (val . (:foreground "#dddddd"))
        (varField . (:foreground "#ff3333"))
        (valField . (:foreground "#dddddd"))
        (functionCall . (:foreground "#84BEE3"))
        (param . (:foreground "#ffffff"))
        (class . font-lock-type-face)
        (trait . (:foreground "#8cb0d3"))
        (object . (:foreground "#026DF7"))
        (package . font-lock-preprocessor-face)))
