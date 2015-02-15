(require 'ace-jump-mode)

(require 'key-chord)
(key-chord-mode +1)
(key-chord-define-global "jj" 'ace-jump-word-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(key-chord-define-global "jk" 'ace-jump-char-mode)
(key-chord-define-global "jh" 'jump-char)
