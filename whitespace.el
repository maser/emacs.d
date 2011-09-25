(require 'whitespace)
(setq whitespace-style 'trailing)
(setq whitespace-trailing-regexp
  "\\b.*\\(\\(\t\\| \\|\xA0\\|\x8A0\\|\x920\\|\xE20\\|\xF20\\)+\\)$")
(global-whitespace-mode)
