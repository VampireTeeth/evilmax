;;Configuration of emacs-eclim starts here
(require 'eclim)
(require 'eclimd)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)


;; add the emacs-eclim source
;;(require 'ac-emacs-eclim-source)
;;(ac-emacs-eclim-config)


(custom-set-variables
 ;;'(eclim-auto-save nil)
 '(eclim-eclipse-dirs '((getenv "ECLIPSE_HOME")))
 '(eclim-executable (getenv "ECLIM_EXECUTABLE"))
 '(eclimd-default-workspace (getenv "ECLIPSE_DEFAULT_WORKSPACE"))
 '(eclimd-wait-for-process nil))

;;(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)



(global-eclim-mode t)
;;(global-company-mode t)


;;(evil-leader/set-key-for-mode 'eclim-mode "ces" 'eclim-java-method-signature-at-point)
;;(evil-leader/set-key-for-mode 'eclim-mode "cefd" 'eclim-java-find-declaration)
;;(evil-leader/set-key-for-mode 'eclim-mode "cefr" 'eclim-java-find-references)
;;(evil-leader/set-key-for-mode 'eclim-mode "ceft" 'eclim-java-find-type)
;;(evil-leader/set-key-for-mode 'eclim-mode "ceff" 'eclim-java-find-generic)
;;(evil-leader/set-key-for-mode 'eclim-mode "cefs" 'eclim-java-format)
;;(evil-leader/set-key-for-mode 'eclim-mode "cer" 'eclim-java-refactor-rename-symbol-at-point)
;;(evil-leader/set-key-for-mode 'eclim-mode "cei" 'eclim-java-import-organize)
;;(evil-leader/set-key-for-mode 'eclim-mode "ceh" 'eclim-java-hierarchy)
;;(evil-leader/set-key-for-mode 'eclim-mode "cez" 'eclim-java-implement)
;;(evil-leader/set-key-for-mode 'eclim-mode "ced" 'eclim-java-doc-comment)
;;(evil-leader/set-key-for-mode 'eclim-mode "ceg" 'eclim-java-generate-getter-and-setter)
;;(evil-leader/set-key-for-mode 'eclim-mode "cet" 'eclim-run-junit)
;;
;;(evil-leader/set-key-for-mode 'eclim-mode "ceg" 'eclim-project-goto)
;;(evil-leader/set-key-for-mode 'eclim-mode "cepp" 'eclim-project-mode)
;;(evil-leader/set-key-for-mode 'eclim-mode "cepm" 'eclim-project-mode)
;;(evil-leader/set-key-for-mode 'eclim-mode "cepi" 'eclim-project-import)
;;(evil-leader/set-key-for-mode 'eclim-mode "cepc" 'eclim-project-create)
;;(evil-leader/set-key-for-mode 'eclim-mode "cepg" 'eclim-project-goto)
;;(evil-leader/set-key-for-mode 'eclim-mode "cept" 'eclim-debug-test)
;;(evil-leader/set-key-for-mode 'eclim-mode "cepa" 'eclim-debug-attach)
;;(evil-leader/set-key-for-mode 'eclim-mode "ceur" 'eclim-java-run-run)
;;(evil-leader/set-key-for-mode 'eclim-mode "cemp" 'eclim-maven-lifecycle-phase-run)
;;(evil-leader/set-key-for-mode 'eclim-mode "cemr" 'eclim-maven-run)
