(use-package cider
  :ensure t
  :config
  (message "Cider is loaded")
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  ;;(remove-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  ;;(remove-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  )

(use-package clj-refactor
  :ensure t
  :config
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-f"))

(provide 'setup-clojure-ide)
