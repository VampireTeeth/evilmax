;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))


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


(defvar evilmax-packages 
  '(
    company
    evil
    evil-leader
    evil-escape
    ido-ubiquitous
    ido-completing-read+
    ido-vertical-mode
    paredit
    paredit-everywhere
    highlight-parentheses
    js2-mode
    js2-refactor
    ggtags
    web-mode
))

(require 'cl)

(defun evilmax-packages-installed-p ()
  (loop for p in evilmax-packages
		when (not (package-installed-p p)) do (return nil)
		finally (return t)))

(unless (evilmax-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p evilmax-packages)
	(when (not (package-installed-p p))
      (message "Installing package: %s" (symbol-name p))
	  (package-install p))))

;;Loading configurations
(defvar load-path-elisp "~/.emacs.d/elisp")
(add-to-list 'load-path load-path-elisp)

;;Looping through the packages symbol and 
;;require the package if ~/.emacs.d/elisp/init-<package-symbol>.el exists
(dolist (p evilmax-packages)
  (let ((package-name (concat "init-" (symbol-name p))))
    (let ((package-init-file-fullpath (concat load-path-elisp "/" package-name ".el")))
      (if (file-exists-p package-init-file-fullpath)
          (progn
            (message "init file: %s exists" package-init-file-fullpath)
            (message "requiring package: %s" package-name)
            (require (intern package-name)))))))
