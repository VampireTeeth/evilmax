(use-package atom-one-dark-theme
  :ensure t
  :config)

(use-package darktooth-theme
  :ensure t
  :config)

(use-package badger-theme
  :ensure t
  :config)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (add-hook 'after-init-hook
            (lambda ()
              (load-theme 'sanityinc-tomorrow-eighties t))))

(use-package cyberpunk-theme
  :ensure t)

(provide 'setup-themes)
