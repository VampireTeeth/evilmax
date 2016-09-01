(require 'evil)
(require 'evil-leader)
(require 'evil-escape)
(evil-mode 1)
(evil-escape-mode 1)


;;Configuration of evil-leader


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


(eval-after-load "evil"
  (progn
    (global-evil-leader-mode)))

(eval-after-load "evil-leader"
 (progn
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
   (evil-leader/set-key "[" 'sgml-skip-tag-backward)))

(eval-after-load "evil-escape"
  (progn
    (setq-default evil-escape-key-sequence "jk")))
;;(define-key evil-insert-state-map (kbd "RET") 'evil-force-normal-state)

(provide 'init-evil)
