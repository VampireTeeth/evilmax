;;Configuration of flymake-java starts here
(require 'flycheck)
(require 'flycheck-java)

(add-hook 'java-mode-hook
          (lambda ()
            (setq flycheck-java-ecj-jar-path "~/flycheck-java/ecj-4.2.1.jar")))
