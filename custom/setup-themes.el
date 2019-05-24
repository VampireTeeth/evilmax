(use-package atom-one-dark-theme
  :ensure t
  :config
  (add-hook 'after-init-hook (lambda ()
                               (message "Loading theme atom-one-dark theme")
                               (load-theme 'atom-one-dark t))))

(use-package darktooth-theme
  :ensure t
  :config)

(provide 'setup-themes)
