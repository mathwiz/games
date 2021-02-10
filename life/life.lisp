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


(defun copy (from to)
  (let ((length (length from)))
    (dotimes (i length)
      (set-cell i to (get-cell i from)))))


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
                           (princ (get-neighbors cell _SIZE)))
                         (main-loop)))
                 ((equal cmd "t2")
                  (progn (show _GEN1)
                         (format t "calculate living neighbors of cell> ")
                         (let ((cell (read)))
                           (princ (live-neighbors cell _GEN1)))
                         (main-loop)))
                 ((equal cmd "q")
                  (progn (format t "Bye.") nil))
                 ((equal cmd "")
                  (progn (compute-multiple 1 _GEN1 _GEN2)
                         (main-loop)))
                 (t (progn (show-multiple (parse-integer cmd) _GEN1 _GEN2)
                           (main-loop)))))))


(defun live-neigbors (cell grid)
  (let* ((size (sqrt (length grid)))
         (neighbors (get-neighbors (cell size)))
        (func (lamda (acc x) (+ (get-cell x grid) acc))))
    (reduce #'func neighbors :initial-value 0)))


(defun to-live (cell grid)
  (> (live-neighbors cell grid) 4))


(defun alive-value ()
  1)


(defun dead-value ()
  0)

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


(defun compute (grid dest-grid)
  (let ((n (length grid)))
    (dotimes (i n)
      (set-cell i dest-grid (compute-cell i grid)))))


;; Just an alias to to-live
(defun compute-cell (cell grid)
  (to-live cell grid))


(defun compute-multiple (n grid dest-grid)
  (let ((var1 nil) 
        (var2 nil))
    (dotimes (i n)
      (format t "Computing iteration ~d~%" (1+ i))
      (compute grid dest-grid)))
  (show grid))


(defun show (grid)
  (progn
    (let ((length (length grid))
          (linesize (sqrt (length grid))))
      (format t "~%   ")
      (dotimes (i linesize)
        (format t "~3d" (1+ i)))
      (dotimes (i length)
        (progn
          (if (= (mod i linesize) 0)
              (format t "~%~3d " (1+ (/ i linesize))))
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
