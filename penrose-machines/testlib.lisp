(defun check-expect (sexp expected)
   (let*   (
            (val    (eval sexp))
           	(pass   (concatenate 'string "passed: " (write-to-string val)))
           	(fail   (concatenate 'string "failed: " (write-to-string val)))
           	(retval (cond 
                     	((stringp expected) (string= (write-to-string val) expected))
                     	((stringp val) (string= val (write-to-string expected)))
	                   	(t (equal val expected))))
           )
     	(format t "~%~A  ~A"
                  (if retval pass fail)
                  expected
                  )
		retval
     )
  )


