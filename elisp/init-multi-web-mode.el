(require 'multi-web-mode)

(eval-after-load 'multi-web-mode
  '(progn
     (setq mweb-default-major-mode 'html-mode)
     (setq mweb-tags '((js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		       (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
     (setq mweb-filename-extensions '("htm" "html" "jsp"))
     (multi-web-global-mode 1)))
