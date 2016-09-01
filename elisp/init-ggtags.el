;;Configuration of ggtags starts here
(require 'ggtags)

(evil-leader/set-key "g." 'ggtags-find-tag-dwim)
(evil-leader/set-key "g," 'pop-tag-mark)
(evil-leader/set-key "gd" 'ggtags-find-definition)
(evil-leader/set-key "gr" 'ggtags-find-reference)
(setenv "GTAGSTHROUGH" "true")
(setenv "GTAGSLABLE" "gtags")


(provide 'init-ggtags)
