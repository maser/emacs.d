(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))
