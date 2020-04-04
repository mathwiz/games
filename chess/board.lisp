(defvar b)
(setf b (make-board))


(defun make-board ()
  (list 'board 0 0 0 0 0 0 0 0 0))


(defun convert-to-letter (val)
  (cond ((equal val 10) "p")
	((equal val 1) "P")
	(t " ")))


(defun print-row (x y z)
  (format t "~& ~A | ~A | ~A"
	  (convert-to-letter x)
	  (convert-to-letter y)
	  (convert-to-letter z)))


(defun print-board (board)
  (format t "~%")
  (print-row
   (nth 1 board) (nth 2 board) (nth 3 board))
  (format t "~&-----------")
  (print-row
   (nth 4 board) (nth 5 board) (nth 6 board))
  (format t "~&-----------")
  (print-row
   (nth 7 board) (nth 8 board) (nth 9 board))
  (format t "~&~&")
  )
