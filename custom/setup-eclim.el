(use-package eclim
  :ensure t
  :config
  (require 'eclimd)
  (require 'company-emacs-eclim)
  (add-hook 'java-mode-hook #'eclim-mode)
  (custom-set-variables
   '(eclim-eclipse-dirs (list (getenv "ECLIPSE_HOME")))
   '(eclim-executable "eclim")
   '(eclimd-executable "eclimd"))
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)
  (company-emacs-eclim-setup))

(provide 'setup-eclim)
