; colors
(if (string-match "GNU Emacs 24." (emacs-version))
    (require 'zenburn-theme)
  (progn
    (require 'color-theme)
    (setq color-theme-is-global t)
    (require 'zenburn)
    (color-theme-zenburn)
    )
)
