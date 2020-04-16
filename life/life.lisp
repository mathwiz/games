(defparameter *grid-size* 64)
(defparameter *grid* nil)


(defun make-grid ()
  (let ((grid (loop repeat *grid-size*
                   collect (make-array *grid-size*))))
    (setf *grid* grid)))


(defun seed-randomly (grid pct)
  (labels ((fill ()
             nil))
    nil))

