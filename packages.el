(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(setq maser-required-packages (list))

(dolist (package maser-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
