;;cmake-ide package configurations
(use-package flycheck)
;;(use-package auto-complete-clang)
;;(use-package company-clang)
(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :ensure t
  :config
  (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
  (setq company-backends (delete 'company-semantic company-backends))
  (eval-after-load 'company
    '(add-to-list
      'company-backends 'company-irony)))

(use-package cmake-ide
  :config
  (require 'rtags)
  (require 'cmake-mode)
  (cmake-ide-setup)
  (setq cmake-ide-flags-c++
        '("-I/usr/include/c++/4.9"
          "-I/usr/include/x86_64-linux-gnu/c++/4.9"
          "-I/usr/include/c++/4.9/backward"
          "-I/usr/lib/gcc/x86_64-linux-gnu/4.9/include"
          "-I/usr/local/include"
          "-I/usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed"
          "-I/usr/include/x86_64-linux-gnu"
          "-I/usr/include")))

(provide 'setup-cmake-ide)
