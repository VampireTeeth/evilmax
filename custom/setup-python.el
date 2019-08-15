(use-package python-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode)))

(use-package elpy
  :ensure t
  :config
  (setq elpy-rpc-python-command "/usr/local/bin/python3")
  (elpy-enable))

(provide 'setup-python)
