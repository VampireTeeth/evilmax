(require 'ido-vertical-mode)

(eval-after-load "ido-vertical-mode"
  '(progn
     (ido-vertical-mode 1)
     (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)))

(provide 'init-ido-vertical-mode)
