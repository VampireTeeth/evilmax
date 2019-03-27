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
(require 'setup-typescript)

(if (executable-find "fzf")
    (require 'setup-fzf))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-paren-colors (quote ("medium spring green" "gold" "tomato" "orchid")))
 '(package-selected-packages
   (quote
    (tide zygospore ws-butler web-mode volatile-highlights use-package typescript-mode smex rjsx-mode python-mode projectile nlinum-relative key-chord js2-refactor iedit ido-vertical-mode ido-ubiquitous highlight-parentheses groovy-mode gradle-mode ggtags foggy-night-theme flymake-go flycheck fiplr evil-surround ensime emmet-mode elpy elixir-mode dtrt-indent company-go clj-refactor clean-aindent-mode caroline-theme atom-one-dark-theme anzu ack ace-window abyss-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
