(require 'sass-mode)

(defun sass-electric-indent-function (char)
  (if (eq major-mode 'sass-mode)
      false))
(add-hook 'electric-indent-functions 'sass-electric-indent-function)

(add-hook 'sass-mode-hook 'rainbow-mode)
