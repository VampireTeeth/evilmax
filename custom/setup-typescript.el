;;(defun setup-tide-mode ()
;;(interactive)
;;(tide-setup)
;;(flycheck-mode +1)
;;(setq flycheck-check-syntax-automatically '(save mode-enabled))
;;(eldoc-mode +1)
;;(tide-hl-identifier-mode +1)
;;;; company is an optional dependency. You have to
;;;; install it separately via package-install
;;;; `M-x package-install [ret] company`
;;(company-mode +1))
;;
;;(use-package tide
;;:ensure t
;;:config
;;(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
;;(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
;;;; aligns annotation to the right hand side
;;(setq company-tooltip-align-annotations t)
;;
;;;; formats the buffer before saving
;;(add-hook 'before-save-hook 'tide-format-before-save)
;;
;;(add-hook 'typescript-mode-hook #'setup-tide-mode))


(use-package typescript-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
  (setq typescript-indent-level 2)
  (use-package tide
    :ensure t
    :config
    (add-hook 'typescript-mode-hook
              (lambda ()
                      (tide-setup)
                      (tide-hl-identifier-mode)))))

;;(use-package tide
;;  :ensure t
;;  :after
;;  (typescript-mode company flycheck)
;;  :hook
;;  ((typescript-mode . tide-setup)
;;   (typescript-mode . tide-hl-identifier-mode)))

(provide 'setup-typescript)
;;; setup-typescript.el ends here
