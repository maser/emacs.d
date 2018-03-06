(flycheck-define-checker ruby-reek
  "A Ruby checker using Reek.

See URL `http://www.pylint.org'."
  :command ("reek" "--no-color" "--single-line" source)
  :error-patterns
  ((info line-start "  " (file-name) ":" line ": " (message) line-end))
  :modes (enh-ruby-mode ruby-mode))

(add-to-list 'flycheck-checkers 'ruby-reek 'append)
(flycheck-add-next-checker 'ruby-rubocop 'ruby-reek)

