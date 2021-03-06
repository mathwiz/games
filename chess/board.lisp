(defparameter *board* (make-hash-table))

;; 64 bits
;; 1111111111111111111111111111111111111111111111111111111111111111
;; = 18446744073709551615
;; 0000000000000000000000000000000000000000000000000000000000000000
(defun starting-position (board)
  (setf (gethash 'white-pawns board) 65280)
  (setf (gethash 'white-rooks board) 129)
  (setf (gethash 'white-pawns board) nil)
  (setf (gethash 'white-pawns board) nil)
  (setf (gethash 'white-queen board) nil)
  (setf (gethash 'white-king board) nil)
)


(defun board-representation (board)
  nil)


(defun make-board-representation ()
  (list 
   '(4 2 3 5 6 3 2 4)
   '(1 1 1 1 1 1 1 1)
   '(0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0)
   '(0 0 0 0 0 0 0 0)
   '(-1 -1 -1 -1 -1 -1 -1 -1)
   '(-4 -2 -3 -5 -6 -3 -2 -4)
   ))


(defun convert-to-letter (val)
  (cond ((equal val -1) "x")
	((equal val 1) "o")
        ((equal val -2) "n")
	((equal val 2) "N")
        ((equal val -3) "b")
	((equal val 3) "B")
        ((equal val -4) "r")
	((equal val 4) "R")
        ((equal val -5) "q")
	((equal val 5) "Q")
        ((equal val -6) "k")
	((equal val 6) "K")
	(t " ")))


(defun print-square (x)
  (format t " ~A " (convert-to-letter x)))


(defun print-row (lst)
  (format t "~%")
  (dotimes (n 8)
    (progn
      (print-square (nth n lst))
      (format t "~A" (if (not (= n 7))
                         "|"
                         " ")))))


(defun print-spacer ()
  (format t "~%")
  (dotimes (n 8)
    (progn
      (format t "~A" "____"))))


(defun print-board (board)
  (format t "~%")
  (dotimes (n 8)
    (progn
      (print-row (nth (- 7 n) board))
      (if (< n 7) (print-spacer))))
  (format t "~&~&")
  t)
