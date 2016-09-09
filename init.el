;; global variables
;;(setq
;; inhibit-startup-screen t
;; create-lockfiles nil
;; make-backup-files nil column-number-mode t
;; scroll-error-top-bottom t
;; show-paren-delay 0.5
;; use-package-always-ensure t
;; sentence-end-double-space nil)
;;
;;;; buffer local variables
;;(setq-default
;; indent-tabs-mode nil
;; tab-width 4
;; c-basic-offset 4)
;;
;; modes
;;(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

(defun my:copy-whole-buffer ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    ;;(message (concat "Point:" (number-to-string (point)) ",Mark:" (number-to-string (mark))))
    (kill-ring-save (point) (mark))))

(defun my:kill-whole-buffer ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (kill-region (point) (mark))))

(defun my:misc-config()
  ;;(setq debug-on-error t)
  (global-hl-line-mode)
  ;;(set-cursor-color "LightGreen")
  ;;(set-face-background hl-line-face "gray5")
  ;;(set-face-underline hl-line-face nil)
  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq ediff-split-window-function 'split-window-horizontally)
  ;;(add-hook 'after-save-hook 'delete-trailing-whitespace)

  (setq default-frame-alist
        '((width . 100)
          (height . 35)
          (menu-bar-lines . 2)))
  (cond
   ((find-font (font-spec :name "Dejavu Sans Mono"))
    (set-frame-font "Dejavu Sans Mono-14"))
   ((find-font (font-spec :name "Lucida Console"))
    (set-frame-font "Lucida Console-14")))
  (set-face-attribute 'default nil :height 140)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (setq c-basic-offset 4)
  (load-theme 'foggy-night t t)
  (enable-theme 'foggy-night)
  ;;(toggle-debug-on-error)
  )

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package company
  :config
  (global-company-mode t)
  (define-key company-mode-map (kbd "TAB") 'company-complete)
  (define-key company-mode-map (kbd "M-;") 'company-files) 
  :demand)

(use-package evil
  :config
  (evil-mode 1)

  (use-package evil-leader
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key "j" 'evil-scroll-down)
    (evil-leader/set-key "k" 'evil-scroll-up)
    (evil-leader/set-key "h" 'evil-scroll-left)
    (evil-leader/set-key "l" 'evil-scroll-right)
    (evil-leader/set-key "wj" 'evil-window-down)
    (evil-leader/set-key "wk" 'evil-window-up)
    (evil-leader/set-key "wh" 'evil-window-left)
    (evil-leader/set-key "wl" 'evil-window-right)
    (evil-leader/set-key "v" 'evil-visual-block)
    (evil-leader/set-key "bb" 'switch-to-buffer)
    (evil-leader/set-key "bk" 'kill-buffer)
    (evil-leader/set-key "uu" 'undo-tree-visualize)
    (evil-leader/set-key "ff" 'find-file)
    (evil-leader/set-key "<RET>" 'evil-jump-item)
    (evil-leader/set-key "1" 'delete-other-windows)
    (evil-leader/set-key "0" 'delete-window)
    (evil-leader/set-key "2" 'split-window-below)
    (evil-leader/set-key "3" 'split-window-right)
    (evil-leader/set-key "yy" 'my:copy-whole-buffer)
    (evil-leader/set-key "yk" 'my:kill-whole-buffer)
    (evil-leader/set-key "]" 'sgml-skip-tag-forward)
    (evil-leader/set-key "[" 'sgml-skip-tag-backward)
    :demand)

  (use-package evil-escape
    :config
    (evil-escape-mode t)
    (setq-default evil-escape-key-sequence "jk")
    :demand)
  :demand)


(use-package ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)

  (use-package ido-ubiquitous
    :ensure t
    :config
    (ido-ubiquitous-mode 1)
    :demand)

  (use-package ido-vertical-mode
    :ensure t
    :config
    (ido-vertical-mode 1)
    (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
    :demand)
  (use-package ido-completing-read+
    :demand)
  :demand)


(use-package highlight-parentheses
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-parentheses-mode)
  :demand)

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode))
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (use-package js2-refactor
    :ensure t
    :config
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    (js2r-add-keybindings-with-prefix "C-c C-m")
    :demand)
  :demand)


(use-package ggtags
  :ensure t
  :init
  (setenv "GTAGSTHROUGH" "true")
  (setenv "GTAGSLABLE" "gtags")
  :config
  (use-package evil-leader
    :config
    (evil-leader/set-key "g." 'ggtags-find-tag-dwim)
    (evil-leader/set-key "g," 'pop-tag-mark)
    (evil-leader/set-key "gd" 'ggtags-find-definition)
    (evil-leader/set-key "gr" 'ggtags-find-reference)
    :demand)
  :demand)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  :demand)

(use-package ensime 
  :ensure t
  :pin melpa-stable)

(use-package caroline-theme
  :ensure t
  :demand)

(use-package foggy-night-theme
  :ensure t
  :demand)

;;(use-package jdee
;;  :ensure t
;;  :config
;;  (if (eq nil (getenv "JDEE_SERVER_DIR"))
;;      (setenv "JDEE_SERVER_DIR" "~/.emacs.d/jdee/jdee-server/jdee-server-master"))
;;  (setq jdee-server-dir (getenv "JDEE_SERVER_DIR"))
;;  (setq jdee-complete-function 'jdee-complete-minibuf)
;;  (define-key jdee-mode-map (kbd "M-'") 'jdee-complete)
;;  :demand)

(use-package eclim
  :ensure t
  :config
  (require 'eclim)
  (require 'eclimd)
  (custom-set-variables
   '(eclim-eclipse-dirs '((getenv "ECLIM_ECLIPSE_DIRS")))
   '(eclim-executable (getenv "ECLIM_EXECUTABLE"))
   '(eclimd-wait-for-process nil))
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)
  (use-package company-emacs-eclim
    :ensure t
    :config
    (company-emacs-eclim-setup)
    :demand)
  :demand)

(add-hook 'after-init-hook 'my:misc-config)
