;; Use the stable version of ensime
(use-package ensime
  :ensure t
  :after scala
  
  :pin melpa-stable
  :config
  (require 'ensime)

  (define-key scala-mode-map (kbd "C-u M-.") 'ensime-edit-definition-other-window)
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

  (setq ensime-startup-notification nil)
  (setq ensime-startup-snapshot-notification nil))

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :interpreter
  ("scala" . scala-mode)
  :pin melpa
  :config
  (add-hook 'scala-mode-hook 'subword-mode))




