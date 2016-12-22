;;cmake-ide configurations
(use-package flycheck
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'objc-mode-hook 'flycheck-mode)
  (eval-after-load 'rtags
    '(progn
       (require 'flycheck-rtags)
       (defun my-flycheck-rtags-setup ()
         (flycheck-select-checker 'rtags)
         (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
         (setq-local flycheck-check-syntax-automatically nil))
       ;; c-mode-common-hook is also called by c++-mode
       (add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup))))

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

(use-package flycheck-irony
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(use-package company-irony-c-headers
  :config
  ;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9")
  (eval-after-load 'company
    '(add-to-list
      'company-backends
      '(company-irony-c-headers company-irony))))


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
