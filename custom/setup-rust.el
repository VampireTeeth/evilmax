
(use-package rustic
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'rustic-mode)
  (use-package racer
    :ensure t
    :config
    (add-hook 'rustic-mode-hook #'racer-mode)))

(provide 'setup-rust)
