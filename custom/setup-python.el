(use-package python-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode)))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(provide 'setup-python)
