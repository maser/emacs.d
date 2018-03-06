(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode 1)


;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
