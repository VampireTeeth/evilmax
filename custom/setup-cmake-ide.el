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
