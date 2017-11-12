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

;; Set up the font to Consolas for Windows
(when (string-equal system-type "windows-nt")
  (set-face-attribute 'default nil :family "Consolas" :height 110))

;; company
(use-package company
  :init
  (global-company-mode 1)
  (global-set-key (kbd "M-'") 'company-complete)
  (setq company-dabbrev-downcase nil)
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
;;(windmove-default-keybindings)
(global-set-key (kbd "C-x w j") 'windmove-down)
(global-set-key (kbd "C-x w k") 'windmove-up)
(global-set-key (kbd "C-x w h") 'windmove-left)
(global-set-key (kbd "C-x w l") 'windmove-right)
(global-set-key (kbd "RET") 'newline-and-indent)
(setq backup-inhibited t)


(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-1") 'ace-window))

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


(use-package fiplr
  :ensure t
  :config
  (global-set-key (kbd "C-x f") 'fiplr-find-file)
  (setq fiplr-root-markers '(".git" ".svn"))
  (setq fiplr-ignored-globs
        '((directories (".git" ".svn"))
          (files ("*.jpg" "*.png" "*.zip" "*~"))))
  )

(use-package highlight-parentheses
  :ensure t)

(provide 'setup-general)
