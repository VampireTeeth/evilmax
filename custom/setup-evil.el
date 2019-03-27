(use-package evil
  :ensure t
  :config
  (defvar my-leader-map (make-sparse-keymap)"Keymap for \"leader key\" shortcuts.")
  (define-key evil-normal-state-map "," my-leader-map)
  ;; binding ",b"
  (define-key my-leader-map "b" 'list-buffers)
  (define-key evil-normal-state-map (kbd "C-n") nil)
  (define-key evil-normal-state-map (kbd "C-p") nil)
  (evil-mode 1)
  (setq-default evil-shift-width 2))

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
