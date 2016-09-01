(require 'ido-ubiquitous)

(eval-after-load "ido-ubiquitous"
  '(progn
     (ido-mode 1)
     (ido-everywhere 1)
     ido-ubiquitous-mode 1))

(provide 'init-ido-ubiquitous)
