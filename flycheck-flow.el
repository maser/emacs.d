(flycheck-define-checker javascript-flow
  "A JavaScript syntax and style checker using Flow.

See URL `http://flowtype.org/'."
  :command ("flow" source-inplace)
  :error-patterns
  ((error line-start
          (file-name)
          ":"
          line
          ":"
          (minimal-match (one-or-more not-newline))
          ": "
          (message (minimal-match (and (one-or-more anything) "\n")))
          line-end))
  :modes (js-mode js2-mode js3-mode))

;; (add-to-list 'flycheck-checkers 'javascript-flow)
