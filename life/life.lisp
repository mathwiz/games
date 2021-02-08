(defparameter *LIVE* "*")
(defparameter *DEAD* ".")

(defun life ()
  (let ((_SIZE nil)
        (_GEN1 nil)
        (_GEN2 nil))
    (progn
      (init)
      (main-loop))))


(defun init ()
  (format t "Size of Life: ")
  (progn
    (setf _SIZE (read))
    (setf _GEN1 (make-array (* _SIZE _SIZE)))
    (setf _GEN2 (make-array (* _SIZE _SIZE)))))


(defun main-loop ()
  (let ((cmd (read)))
    (princ cmd))
  (show))


(defun show ()
  (princ _GEN1))

;; Run it
(life)
