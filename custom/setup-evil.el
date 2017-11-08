(use-package evil
  :ensure t
  :config
  (defvar my-leader-map (make-sparse-keymap)"Keymap for \"leader key\" shortcuts.")
  (define-key evil-normal-state-map "," my-leader-map)
  ;; binding ",b"
  (define-key my-leader-map "b" 'list-buffers)
  (evil-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(use-package nlinum-relative
  :ensure t
  :config
  ;; something else you want
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

(provide 'setup-evil)
