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

(setq custom-file "~/.emacs-custom.el")

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

(when (executable-find "iex")
  (require 'setup-elixir)
  (message "Setup elixir done"))

(require 'setup-golang)
(require 'setup-typescript)

(when (executable-find "fzf")
  (require 'setup-fzf)
  (message "Setup fzf done"))
