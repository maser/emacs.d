(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode/build")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(require 'js2-highlight-vars)
(autoload 'espresso-mode "espresso")

;; js2 configuration
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-mode-indent-ignore-first-tab t)
(setq espresso-indent-level 2)
(setq c-basic-offset 2)

(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
              (setq indentation (+ indentation (/ espresso-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (message "testing for var node")
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (message "var node detected!")
          (setq indentation (+ 4 indentation)))
        )

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
