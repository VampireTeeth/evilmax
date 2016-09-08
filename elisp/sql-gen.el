(require 'subr-x)

(defun my:replace-curr-line-with (new-line)
  (let ((begin-point (line-beginning-position))
	(end-point (line-end-position)))
    (delete-region begin-point end-point)
    (goto-char begin-point)
    (insert new-line)))

(defun my:get-curr-line ()
  (buffer-substring-no-properties (line-beginning-position) (line-end-position)))


(defun my:gen-insert-sql-line (table-name cols-line vals-line &optional delim-regex)
  (let ((delim-rgx (if delim-regex delim-regex ",[[:space:]]*")))
    (let ((cols-seq (split-string cols-line delim-rgx))
	  (vals-seq (split-string vals-line delim-rgx))
	  (starts-with-p (lambda (rgx val) (string-match rgx val)))
	  idx-to-q
	  cols-after-unquote
	  vals-after-quote
	  new-line)
      (setq idx-to-q (mapcar (lambda (col) (if (funcall starts-with-p "^'" col) 1 0)) cols-seq))
      (setq cols-after-unquote (mapcar (lambda (col)
					 (if (funcall starts-with-p "^'" col)
					     (replace-regexp-in-string "^'" "" col) col)) cols-seq))
      ;;(message "%S" idx-to-q)
      (setq vals-after-quote (map 'vector (lambda (val quote?) (if (= 1 quote?) (concat "'" val "'") val)) vals-seq idx-to-q))
      ;;(message "%S" vals-after-quote)
      (setq new-line (concat "insert into " table-name " ("
			     (mapconcat 'identity cols-after-unquote ",")
			     ") values ("
			     (mapconcat 'identity vals-after-quote ",")
			     ")"))
      (message "%s" new-line)

      ;;Replace the current line with the new-line
      (my:replace-curr-line-with new-line)
    )))


;;(gen-insert-sql-line "dbo.mapping_table" "'gl3_account_number,'gl4_account_number,'smth_else" "aAAA kdfs,KDKWI, NDA")

(defun my:for-each-line (func)
  (save-excursion
    (let ((line-num (line-number-at-pos))
	  (max-line-num (line-number-at-pos (point-max))))
      (while (< line-num max-line-num)
	(funcall func)
	(forward-line)
	(setq line-num (1+ line-num))))))


(defun my:insert-sql-gen (table-name)
  (interactive "sTable name:")
  (save-excursion
    (let ((cols-line (my:get-curr-line)))
      (message "%s" cols-line)
      (forward-line)
      (my:for-each-line (lambda ()
			  (let ((vals-line (string-trim (my:get-curr-line))))
			    (if (not (string-blank-p vals-line))
                    (my:gen-insert-sql-line table-name cols-line vals-line ",[[:space:]]*"))))))))


(provide 'sql-gen)
