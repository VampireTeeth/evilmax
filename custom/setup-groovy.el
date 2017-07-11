(use-package groovy-mode
  :ensure t
  :config
  (add-hook 'groovy-mode-hook
            (lambda ()
              (setq c-basic-offset 4))))

(provide 'setup-groovy)
