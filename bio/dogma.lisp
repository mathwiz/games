(defparameter STRANDS nil)

(defun complement (base)
  (cond ((eq base 1) 3) 
        ((eq base 2) 4) 
        ((eq base 3) 1) 
        ((eq base 4) 2)))
