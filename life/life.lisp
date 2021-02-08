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
       ((equal cmd "t") (progn (format t "cell> ") (let ((cell (read))) (princ (get-neighbors cell _SIZE)))))
       ((equal cmd "q") (progn (format t "Bye.") nil))
       ((equal cmd "") (progn (show-multiple 1) (main-loop)))
       (t (progn (show-multiple (parse-integer cmd)) (main-loop)))))))


(defun get-neighbors (cell size)
  (let ((neighbors (make-array 8)) 
        (var2 nil))
    (progn
      (dotimes (i 8)
        (setf (aref neighbors i) (neighbor cell i size))))
    neighbors))


;; Neighbors
;; NW  N  NE  |   0   1   2
;;  W  C  E   |   3   C   4
;; SW  S  SE  |   5   6   7
(defun neighbor (cell dir size)
  (cond
    ((= dir  0) (if (left-end cell size) 0 (1- cell)))
    ((= dir  1) (if (left-end cell size) 0 (1- cell)))
    ((= dir  2) (if (left-end cell size) 0 (1- cell)))
    ((= dir  3) (if (left-end cell size) 0 (1- cell)))
    ((= dir  4) (if (left-end cell size) 0 (1- cell)))
    ((= dir  5) (if (left-end cell size) 0 (1- cell)))
    ((= dir  6) (if (left-end cell size) 0 (1- cell)))
    ((= dir  7) (if (left-end cell size) 0 (1- cell)))
    (t nil)))


(defun left-end (cell size)
  (= (mod cell size) 0))


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
