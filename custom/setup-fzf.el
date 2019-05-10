(use-package fzf
  :ensure t
  :config
  (global-set-key (kbd "C-c f f") 'fzf)
  (global-set-key (kbd "C-c f d") 'fzf-directory))


(provide 'setup-fzf)
