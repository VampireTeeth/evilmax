(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))

(use-package go-mode
  :ensure t)

(use-package flymake-go
  :ensure t)

(use-package company
  :ensure t)

(use-package company-go
  :ensure t
  :config

  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (add-hook 'go-mode-hook 'my-go-mode-hook))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'setup-golang)
