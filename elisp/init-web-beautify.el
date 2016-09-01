(require 'web-beautify) ;; Not necessary if using ELPA package

(eval-after-load 'js2-mode
  '(evil-leader/set-key "wb" 'web-beautify-js))
(eval-after-load 'json-mode
  '(evil-leader/set-key "wb" 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(evil-leader/set-key "wb" 'web-beautify-html))
(eval-after-load 'css-mode
  '(evil-leader/set-key "wb" 'web-beautify-css))
