(defun read-a-legal-move (board)
  (format t "~&Your move: ")
  (let* ((pos (read))
         (move (string pos)))
    (cond ((not (valid-move move))
	   (format t "~&Invalid input.")
	   (read-a-legal-move board))
          ((not (legal-move move board))
           (format t "~&Not a legal move.")
           (read-a-legal-move pos))
	  (t pos))))


(defun valid-move (move)
  (cond (nil 1)
        (t 2)))


(defun legal-move (move board)
  nil)


