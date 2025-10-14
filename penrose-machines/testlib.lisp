(defun check-expect (sexp expected)
  (print 
   (let*   ((val (eval sexp))
           (pass (concatenate 'string "passed: " (write-to-string val)))
           (fail (concatenate 'string "failed: " (write-to-string val)))
           )
     
     (format t "~&~A"
     (cond ((stringp expected) (if (string= val expected) pass fail))
           (t (if (= val expected) pass fail)))
     ))
  ))
