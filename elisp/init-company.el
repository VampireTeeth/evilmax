;;Configuration of company mode starts here
;;(require 'company)
;;
;;(eval-after-load "company"
;;  '(progn
;;     (global-company-mode t)
;;     (define-key company-mode-map (kbd "TAB") 'company-complete)))

(use-package company
  :init
  (global-company-mode t)
  (define-key company-mode-map (kbd "TAB") 'company-complete)
  :demand)

;;(provide 'init-company)

