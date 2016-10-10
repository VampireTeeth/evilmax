;; gloal variables
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
  (semantic-mode 1)
  (global-set-key (kbd "<C-return>") ' set-mark-command)
  (global-set-key (kbd "<C-M-return>") 'mark-sexp)
  (global-set-key (kbd "C-.") 'repeat)
  (let ((no-proxy (getenv "NO_PROXY"))
      (http (getenv "HTTP_PROXY"))
      (https (getenv "HTTPS_PROXY")))
  (if no-proxy (setq url-proxy-services (cons `("no_proxy" . ,no-proxy)  url-proxy-services)))
  (if http (setq url-proxy-services (cons `("http" . ,http) url-proxy-services)))
  (if https (setq url-proxy-services (cons `("https" . ,https) url-proxy-services))))) ;;(toggle-debug-on-error))
(add-hook 'after-init-hook 'my:misc-config)

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
  :ensure t
  :config
  (global-company-mode t)
  (define-key company-mode-map (kbd "TAB") 'company-complete)
  (define-key company-mode-map (kbd "M-;") 'company-files)
  (setq company-dabbrev-ignore-case nil)
  (setq company-dabbrev-downcase nil)
  :demand)

(use-package helm
  :ensure t
  :init
  (progn
    (require 'helm-config)
    (require 'helm-grep)

    (defun helm-hide-minibuffer-maybe ()
      (when (with-helm-buffer helm-echo-input-in-header-line)
        (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
          (overlay-put ov 'window (selected-window))
          (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                                  `(:background ,bg-color :foreground ,bg-color)))
          (setq-local cursor-type nil))))
 
    (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
    ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
    ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
    ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
    (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

    (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
    (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
    (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

    (when (executable-find "curl")
      (setq helm-google-suggest-use-curl-p t))

    (setq helm-google-suggest-use-curl-p t
          helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
          ;; helm-quick-update t ; do not display invisible candidates
          helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

          ;; you can customize helm-do-grep to execute ack-grep
          ;; helm-grep-default-command "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
          ;; helm-grep-default-recurse-command "ack-grep -H --smart-case --no-group --no-color %e %p %f"
          helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window

          helm-echo-input-in-header-line t

          ;; helm-candidate-number-limit 500 ; limit the number of displayed canidates
          helm-ff-file-name-history-use-recentf t
          helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
          helm-buffer-skip-remote-checking t

          helm-mode-fuzzy-match t

          helm-buffers-fuzzy-matching t ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
          helm-org-headings-fontify t
          ;; helm-find-files-sort-directories t
          ;; ido-use-virtual-buffers t
          helm-semantic-fuzzy-match t
          helm-M-x-fuzzy-match t
          helm-imenu-fuzzy-match t
          helm-lisp-fuzzy-completion t
          ;; helm-apropos-fuzzy-match t
          helm-buffer-skip-remote-checking t
          helm-locate-fuzzy-match t
          helm-display-header-line nil)

    (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
    (global-set-key (kbd "C-x b") 'helm-buffers-list)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "C-c r") 'helm-recentf)
    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
    (global-set-key (kbd "C-c h o") 'helm-occur)
    (global-set-key (kbd "C-c h o") 'helm-occur)

    (global-set-key (kbd "C-c h w") 'helm-wikipedia-suggest)
    (global-set-key (kbd "C-c h g") 'helm-google-suggest)

    (global-set-key (kbd "C-c h x") 'helm-register)
    ;; (global-set-key (kbd "C-x r j") 'jump-to-register)

    (define-key 'help-command (kbd "C-f") 'helm-apropos)
    (define-key 'help-command (kbd "r") 'helm-info-emacs)
    (define-key 'help-command (kbd "C-l") 'helm-locate-library)

    ;; use helm to list eshell history
    (add-hook 'eshell-mode-hook
              #'(lambda ()
                  (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;;; Save current position to mark ring
    (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

    ;; show minibuffer history with Helm
    (define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
    (define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)
    (define-key global-map [remap find-tag] 'helm-etags-select)
    (define-key global-map [remap list-buffers] 'helm-buffers-list))
  :demand)

(use-package helm-projectile
  :ensure t
  :config
  (global-set-key (kbd "C-c p h") 'helm-projectile)
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))

(use-package helm-swoop
  :ensure t
  :bind (("C-c h o" . helm-swoop)
         ("C-c s" . helm-multi-swoop-all))
  :config
  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows t)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color t))

;;(use-package ido
;;  :ensure t
;;  :config
;;  (ido-mode 1)
;;  (ido-everywhere 1)
;;
;;  (use-package ido-ubiquitous
;;    :ensure t
;;    :config
;;    (ido-ubiquitous-mode 1)
;;    :demand)
;;
;;  (use-package ido-vertical-mode
;;    :ensure t
;;    :config
;;    (ido-vertical-mode 1)
;;    (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)
;;    :demand)
;;  (use-package ido-completing-read+
;;    :demand)
;;  :demand)


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


;;(use-package ggtags
;;  :ensure t
;;  :init
;;  (setenv "GTAGSTHROUGH" "true")
;;  (setenv "GTAGSLABLE" "gtags")
;;  :config
;;  (use-package evil-leader
;;    :config
;;    (evil-leader/set-key "g." 'ggtags-find-tag-dwim)
;;    (evil-leader/set-key "g," 'pop-tag-mark)
;;    (evil-leader/set-key "gd" 'ggtags-find-definition)
;;    (evil-leader/set-key "gr" 'ggtags-find-reference)
;;    :demand)
;;  :demand)

(use-package helm-gtags
  :ensure t
  :init
  (progn
    (setq helm-gtags-ignore-case t
          helm-gtags-auto-update t
          helm-gtags-use-input-at-cursor t
          helm-gtags-pulse-at-cursor t
          helm-gtags-prefix-key "\C-cg"
          helm-gtags-suggested-key-mapping t)

    ;; Enable helm-gtags-mode in Dired so you can jump to any tag
    ;; when navigate project tree with Dired
    (add-hook 'dired-mode-hook 'helm-gtags-mode)
    ;; Enable helm-gtags-mode in Eshell for the same reason as above
    (add-hook 'eshell-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in languages that GNU Global supports
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'java-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode))
    ;; key bindings
    :config
    (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
    (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
    (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
    (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
    (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;;  :init
;;  (add-hook 'c-mode-hook 'helm-gtags-mode)
;;  (add-hook 'c++-mode-hook 'helm-gtags-mode)
;;  (add-hook 'asm-mode-hook 'helm-gtags-mode)
;;  (custom-set-variables
;;   '(helm-gtags-path-style 'relative)
;;   '(helm-gtags-ignore-case t)
;;   '(helm-gtags-auto-update t))
;;  ;;(setenv "GTAGSTHROUGH" "true")
;;  ;;(setenv "GTAGSLABLE" "gtags")
;;  :config
;;  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
;;  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
;;  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;;  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
;;  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;;  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
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

;;(use-package ensime 
;;  :ensure t
;;  :pin melpa-stable)

(use-package caroline-theme
  :ensure t
  :demand)

(use-package foggy-night-theme
  :ensure t
  :demand)

(use-package jdee
  :ensure t
  :config
  (if (eq nil (getenv "JDEE_SERVER_DIR"))
      (setenv "JDEE_SERVER_DIR" "~/.emacs.d/jdee/jdee-server/jdee-server-master"))
  (setq jdee-server-dir (getenv "JDEE_SERVER_DIR"))
  (setq jdee-complete-function 'jdee-complete-minibuf)
  (define-key jdee-mode-map (kbd "M-'") 'jdee-complete)
  :demand)
;;(use-package eclim
;;  :ensure t
;;  :config
;;  (require 'eclim)
;;  (require 'eclimd)
;;  (global-eclim-mode)
;;  (custom-set-variables
;;   '(eclim-eclipse-dirs '((getenv "ECLIM_ECLIPSE_DIRS")))
;;   '(eclim-executable (getenv "ECLIM_EXECUTABLE"))
;;   '(eclimd-wait-for-process nil))
;;  (setq help-at-pt-display-when-idle t)
;;  (setq help-at-pt-timer-delay 0.1)
;;  (help-at-pt-set-timer)
;;  (add-hook 'java-mode-hook (lambda () (eclim-mode 1)))
;;  
;;  (use-package company-emacs-eclim
;;    :ensure t
;;    :config
;;    (company-emacs-eclim-setup)
;;    :demand)
;;  :demand)

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "C-x C-o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :demand)

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-c m m") 'mc/edit-lines)
  (global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c m h") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-c m f") 'mc/mark-all-like-this-in-defun))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  :demand
  :pin melpa-stable)

;;(use-package cider
;;  :ensure t
;;  :demand)


