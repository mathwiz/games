(defun check-expect (sexp expected)
   (let*   (
            (val    (eval sexp))
           	(pass   (concatenate 'string "passed: " (write-to-string val)))
           	(fail   (concatenate 'string "failed: " (write-to-string val)))
           	(retval (cond 
                     	((or (stringp expected) (stringp val))
                     		(string= val expected))
	                   	(t (equal val expected))))
           )
     	(format t "~%~A  ~A"
                  (if retval pass fail)
                  expected
                  )
		retval
     )
  )


