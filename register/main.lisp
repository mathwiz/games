
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
    (format t "~%([Qq] = Quit)> ")
    (let ((cmd (read-line)))
      (cond ((equal cmd "q")
             (progn (format t "Bye.")
                    nil))
            (t 
             (progn (main-loop)))))
))
