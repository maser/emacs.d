(load-conf "typescript")
(load-conf "flycheck")

(flycheck-define-checker typescript-tsc
  "A TypeScript syntax checker using tsc, the TypeScript compiler.

See URL `http://www.typescriptlang.org/'."
  :command ("tsc"
            "--out /dev/null"
            "--noImplicitAny"
            source-inplace)
  :error-patterns
  ((error line-start (file-name) "(" line "," column "): error"
          (message (one-or-more not-newline)
                   (zero-or-more "\n\t" (one-or-more not-newline)))
          line-end))
  :modes typescript-mode
  :next-checkers ((warnings-only . typescript-tslint)))

(flycheck-def-config-file-var flycheck-tslint.json typescript-tslint "tslint.json")

(flycheck-define-checker typescript-tslint
  "A TypeScript style checker using tslint.

See URL `https://github.com/palantir/tslint'."
  :command ("tslint"
            "--file" source
            (config-file "--config" flycheck-tslint.json)
            "--format" "prose")
  :error-patterns ((warning (file-name) "[" line ", " column "]: " (message)))
  :modes typescript-mode)

(add-to-list 'flycheck-checkers 'typescript-tsc)
(add-to-list 'flycheck-checkers 'typescript-tslint)

