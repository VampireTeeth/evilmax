(menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))


;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; set indentation for nxml-mode
(setq
 nxml-child-indent 4
 nxml-attribute-indent 4
 nxml-slash-auto-complete-flag t)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  ;;(delete 'company-semantic company-backends)
  )
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))
(global-set-key (kbd "RET") 'newline-and-indent)
(setq backup-inhibited t)


;; Get rid of the startup message
(setq inhibit-startup-message t)
;; Show file full path in title bar
(setq-default
 frame-title-format
 (list
  '((buffer-file-name
     " %f"
     (dired-directory
      dired-directory
      (revert-buffer-function
       " %b"
       ("%b - Dir:  " default-directory)))))))

;; Shows parenthesis
(show-paren-mode 1)
;; Shows column number
(column-number-mode 1)
;; Change default colors
;;(set-background-color "grey14")
;;(set-foreground-color "white")
;;(set-cursor-color "white")
;; No toolbar
(progn
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (menu-bar-mode -1)
  (scroll-bar-mode -1)
  )

(provide 'setup-general)
