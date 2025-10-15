(defparameter *machine-left* -1)
(defparameter *machine-right* 1)
(defparameter *machine-zero* 0)
(defparameter *machine-one* 1)

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
    to-state
    write 
    move
    )
  )

(defun make-state-pair (zero-action one-action)
  (append zero-action one-action)
  )