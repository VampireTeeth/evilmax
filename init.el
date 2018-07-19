
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '((cider . "melpa-stable"))))

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq backup-inhibited t)

(add-to-list 'load-path "~/.emacs.d/custom")
;;(add-to-list 'load-path "~/.linuxbrew/Cellar/cmake/3.6.1/share/emacs/site-lisp/cmake")

(require 'setup-general)
;;(if (version< emacs-version "24.4")
;;    (require 'setup-ivy-counsel)
;;  (require 'setup-helm)
;;  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
;;(require 'setup-cedet)
;;(require 'setup-ivy-counsel)
(require 'setup-editing)
;;(require 'setup-rtags)
;;(require 'setup-irony)
;;(require 'setup-c)
;;(require 'setup-cmake-ide)
(require 'setup-themes)

(require 'setup-web-ide)

(require 'setup-clojure-ide)

(require 'setup-groovy)
(require 'setup-gradle)
(require 'setup-evil)
(require 'setup-ack)
(require 'setup-python)
(require 'setup-elixir)
(require 'setup-golang)

(if (executable-find "fzf")
    (require 'setup-fzf))


;;(setq company-backends (delete 'company-semantic company-backends))
;;(define-key c-mode-map  [(tab)] 'company-complete)
;;(define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-paren-colors (quote ("medium spring green" "gold" "tomato" "orchid")))
 '(package-selected-packages
   (quote
    (fzf company-go flymake-go go-mode elixir-mode elpy ack nlinum-relative key-chord evil-surround evil gradle-mode groovy-mode clj-refactor cider emmet-mode rjsx-mode js2-mode web-mode atom-one-dark-theme abyss-theme iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights highlight-parentheses fiplr smex ido-ubiquitous ido-vertical-mode ace-window zygospore projectile company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
