(require 'jdee)


(eval-after-load "jdee"
  '(progn
     (if (eq nil (getenv "JDEE_SERVER_DIR"))
         (setenv "JDEE_SERVER_DIR" "~/.emacs.d/jdee/jdee-server/jdee-server-master"))
     (setq jdee-server-dir (getenv "JDEE_SERVER_DIR"))
     (setq jdee-complete-function 'jdee-complete-minibuf)
     (define-key jdee-mode-map (kbd "M-'") 'jdee-complete)))
