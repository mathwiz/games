
(defun make-board ()
  (list 'board 10 0 0 0 10 10 1 1 10))


(defun convert-to-letter (val)
  (cond ((equal val 10) "x")
	((equal val 1) "o")
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
