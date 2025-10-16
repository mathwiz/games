(defparameter *machine-left* -1)
(defparameter *machine-right* 1)
(defparameter *machine-stop* nil)
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

(defun get-next-state (state-pair read-value)
  (if (eq read-value *machine-zero*)
    (first state-pair)
    (nth 3 state-pair))
  )

(defun machine-step (machine tape pos)
  nil
  )

(defun run-machine (machine tape limit)
  (labels ((recur (pos step)
             (let ((a 1)
                   (b 2))
               (cond ((> step limit) step)
                     (t (recur (1+ pos) (1+ step)))
                 )
               )
             )
           )
   (recur 0 0)
  ))
