(setf *pos-min* 22)
(setf *pos-max* 98)
(setf *off-board* 100)


(defun on-board (pos)
  (and (>= pos *pos-min*) (<= pos *pos-max*)))
