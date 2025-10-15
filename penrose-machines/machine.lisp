(defun make-machine (states)
  (let ((ht (make-hash-table)))
    (labels ((recur (i pairs)
           		(cond ((null pairs) ht)
           		  	  (t (progn 
           		  	       (setf
           		  	         (gethash i ht)
           		  	         (first pairs))
           		  	       (recur (1+ i) (rest pairs)))))	
            ))
      (recur 0 states)
      )
    )
  )

(defun make-action (to-state write move)
  (list
    1
    2
    3)
  )

(defun make-state-pair (zero-action one-action)
  (cons zero-action one-action)
  )