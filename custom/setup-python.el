(use-package elpy
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))
  (add-hook 'elpy-mode 'elpy-enable))

(provide 'setup-python)
