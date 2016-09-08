(require 'sql-gen)

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

(add-hook 'after-init-hook 'my:misc-config)

(provide 'init-misc)
