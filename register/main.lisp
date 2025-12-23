
(defun main ()
  (let ((_REGISTERS 8)
        (_MEMORY nil))
    (progn
      (init)
      (main-loop))))

(defun init () 
(progn 
  (setf _MEMORY (make-hash-table))
))

(defun main-loop ()
  (progn
    (format t "~%(h = Help)> ")
    (let ((cmd (read-line)))
      (cond ((equal cmd "h") (help))
            ((equal cmd "s") (show _MEMORY))
            ((equal cmd "q") (end-program))
            (t (unknown cmd))))
))

(defun show (registers)
  (progn
    (princ registers)))

(defun end-program ()
  (progn
    (format t "Bye.")
    nil)
)

(defun help ()
  (progn
    (let ((commands
           (list
            (cons "h" "This list.")
            (cons "s" "Show")
            (cons "q" "Quit.")
            )))
      (dolist (x commands nil)
        (format t "~S - ~S~%" (car x) (cdr x))
        ))
    (main-loop))
)

(defun unknown (cmd)
  (progn
    (format t "Unknown command: ~S" cmd)
    (main-loop))
)
