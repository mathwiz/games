
(defun main ()
  (let ((a 1)
        (b 2))
    (progn
      (init)
      (main-loop))))

(defun init ()
  (progn
    (let ((a 1)
          (b 2))
      nil)))

(defun main-loop ()
  (progn
    (format t "~%(h = Help)> ")
    (let ((cmd (read-line)))
      (cond ((equal cmd "h") (help))
            ((equal cmd "q") (end-program))
            (t (unknown cmd))))
))

(defun end-program ()
  (progn 
    (format t "Bye.")
    nil)
)

(defun help ()
  (progn 
    
    (format t "~%")
    (format t "h - This list.")
    (main-loop))
)

(defun unknown (cmd)
  (progn 
    (format t "Unknown command: ~S" cmd)
    (main-loop))
)
