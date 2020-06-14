(setf *pos-min* 22)
(setf *pos-max* 98)
(setf *off-board* 100)
(setf *empty* 0)

(setf *bk* -1)
(setf *bq* -2)
(setf *br* -3)
(setf *bn* -4)
(setf *bb* -5)
(setf *bp* -6)

(setf *wk* 1)
(setf *wq* 2)
(setf *wr* 3)
(setf *wn* 4)
(setf *wb* 5)
(setf *wp* 6)


(setf *white-pieces* (make-hash-table :test #'equal))
(setf *black-pieces* (make-hash-table :test #'equal))

(defun on-board (pos)
  (and (>= pos *pos-min*) (<= pos *pos-max*)))


(defun init-pieces ()
  nil)

