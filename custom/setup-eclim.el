
(use-package eclim
  :ensure t
  :config
  (require 'eclimd)
  (add-hook 'java-mode-hook #'eclim-mode)
  (custom-set-variables
   '(eclim-eclipse-dirs (list (getenv "ECLIPSE_HOME")))
   '(eclim-executable "eclim")
   '(eclimd-executable "eclimd"))
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer))

(use-package company-emacs-eclim
  :ensure t
  :config
  (company-emacs-eclim-setup))


(provide 'setup-eclim)
