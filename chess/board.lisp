
(defun make-board ()
  (list 
   '(1 0 0 0 10 10 1 1 10)
   '(10 0 0 0 10 10 1 1 10)
   '(1 0 0 0 10 10 1 1 10)
   '(10 0 0 0 10 10 1 1 10)
   '(1 0 0 0 10 10 1 1 10)
   '(10 0 0 0 10 10 1 1 10)
   '(1 0 0 0 10 10 1 1 10)
   '(10 0 0 0 10 10 1 1 10)
   ))


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
  (format t "~&~&"))
