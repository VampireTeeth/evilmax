(use-package rtags
  :ensure t
  :config
  (require 'company-rtags)
  (setq rtags-completions-enabled t)
  (setq rtags-autostart-diagnostics t)
  (rtags-enable-standard-keybindings)
  (eval-after-load 'company
    '(add-to-list
      'company-backends 'company-rtags)))

(provide 'setup-rtags)
