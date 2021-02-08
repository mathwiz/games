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
  (progn
    (format t "~%Steps to advance (Q to quit) > ")
    (let ((cmd (read-line)))
     (cond
       ((equal cmd "q") (progn (format t "Bye.") nil))
       ((equal cmd "") (progn (show-multiple 1) (main-loop)))
       (t (progn (show-multiple (parse-integer cmd)) (main-loop)))))))


(defun compute ()
  (let ((n _SIZE) 
        (length (* _SIZE _SIZE)))
    (dotimes (i length)
      (compute-cell i n length))))


(defun compute-cell (cell n length)
  (princ cell))


(defun show-multiple (n)
  (dotimes (i n)
    (princ 'compute)
         (compute))
  (show))


(defun show ()
  (progn
    (princ _GEN2)
    (format t "~%")))


(defun show-cell (state)
  (format t "~S " state))


;; Run it
(life)
