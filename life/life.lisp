(defparameter *LIVE* #\*)
(defparameter *DEAD* #\.)

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
    (setf _GEN2 (make-array (* _SIZE _SIZE)))
    (randomly-populate _GEN1)))


(defun randomly-populate (grid)
  (let ((length (length grid)))
    (dotimes (i length)
      (set-cell i grid (random 2)))))


(defun main-loop ()
  (progn (format t "~%Steps to advance (Q to quit) > ")
         (let ((cmd (read-line)))
           (cond ((equal cmd "t")
                  (progn (format t "get neighbors of cell> ")
                         (let ((cell (read)))
                           (princ (get-neighbors cell _SIZE)))))
                 ((equal cmd "q")
                  (progn (format t "Bye.") nil))
                 ((equal cmd "")
                  (progn (show-multiple 1 _GEN1)
                         (main-loop)))
                 (t (progn (show-multiple (parse-integer cmd) _GEN1)
                           (main-loop)))))))


(defun live-neigbors (cell size grid)
  (let ((neighbors (get-neighbors (cell size)))
        (func (lamda (acc x) (+ (get-cell x grid) acc))))
    (reduce #'func neighbors :initial-value 0)))


(defun get-cell (cell grid)
  (aref grid cell))


(defun set-cell (cell grid val)
  (setf (aref grid cell) val))


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
  (cond ((= dir  0)
         (select-up (select-left cell size) size))
        ((= dir  1)
         (select-up cell size))
        ((= dir  2)
         (select-up (select-right cell size) size))
        ((= dir  3)
         (select-left cell size))
        ((= dir  4)
         (select-right cell size))
        ((= dir  5)
         (select-down (select-left cell size) size))
        ((= dir  6)
         (select-down cell size))
        ((= dir  7)
         (select-down (select-right cell size) size))
        (t nil)))


(defun select-up (cell size)
  (if (first-row cell size)
      (+ (* size (1- size))
         (mod cell size))
      (- cell size)))


(defun select-down (cell size)
  (if (last-row cell size)
      (mod cell size)
      (+ cell size)))


(defun select-left (cell size)
  (if (left-end cell size)
               (+ cell (1- size))
               (1- cell)))


(defun select-right (cell size)
  (if (right-end cell size)
               (- cell (1- size))
               (1+ cell)))


(defun left-end (cell size)
  (= (mod cell size) 0))


(defun right-end (cell size)
  (= (mod cell size) (1- size)))


(defun first-row (cell size)
  (< cell size))


(defun last-row (cell size)
  (>= cell (* size (1- size))))


(defun compute ()
  (let ((n _SIZE)
        (length (* _SIZE _SIZE)))
    (dotimes (i length)
      (compute-cell i n length))))


(defun compute-cell (cell n length)
  (princ cell))


(defun show-multiple (n grid)
  (dotimes (i n)
    (princ 'compute)
         (compute))
  (show grid))


(defun show (grid)
  (progn
    (let ((length (length grid)) 
          (linesize (sqrt (length grid))))
      (dotimes (i length)
        (progn 
          (if (= (mod i linesize) 0)
              (format t "~%"))
          (show-cell (get-cell i grid)))))
    (format t "~%")))


(defun show-cell (state)
  (format t " ~C " (get-symbol state)))


(defun get-symbol (state)
  (if (= state 1)
      *LIVE*
      *DEAD*))


;;Run it

(life)

;; Test it

;; (print nil)
;; (princ (get-neighbors 7 7))
;; (princ (get-neighbors 10 7))
;; (princ (get-neighbors 13 7))
;; (print nil)
;; (princ (get-neighbors 0 7))
;; (princ (get-neighbors 3 7))
;; (princ (get-neighbors 6 7))
;; (print nil)
;; (princ (get-neighbors 42 7))
;; (princ (get-neighbors 45 7))
;; (princ (get-neighbors 48 7))
