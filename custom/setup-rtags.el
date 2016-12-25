
(use-package rtags
  :ensure t
  :config
  (require 'company-rtags)
  (setq rtags-completions-enabled t)
  (setq rtags-autostart-diagnostics t)
  (rtags-enable-standard-keybindings)
  (add-to-list 'company-backends 'company-rtags)
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
  )

(provide 'setup-rtags)
