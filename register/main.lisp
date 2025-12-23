
(defun main ()
  (let ((_REGISTERS nil)
        (_MEMORY nil))
    (progn
      (main-loop))))


(defun main-loop ()
  (progn
    (format t "~%(h = Help)> ")
    (let ((cmd (read-line)))
      (cond ((equal cmd "h") (help))
            ((equal cmd "i") (init))
            ((equal cmd "r") (run))
            ((equal cmd "s") (show))
            ((equal cmd "q") (progn 
                               (end-program) 
                               (return-from main-loop nil)))
            (t (unknown cmd))))
    (main-loop)
))


(defun init () 
  (progn 
    (format t "Size of memory: ")
    (setf _REGISTERS (read))
    (setf _MEMORY (make-array _REGISTERS))
))


(defun run () 
  (progn 
    (format t "Source file: ")
    (setf _SOURCE (read))
    (load _SOURCE)
    (register-program _MEMORY)
))


(defun show ()
  (progn
    (princ _MEMORY)
))


(defun end-program ()
  (progn
    (format t "Bye.")
    nil
))


(defun help ()
  (progn
    (let ((commands
           (list
            (cons "h" "This list.")
            (cons "i" "Initialize.")
            (cons "s" "Show.")
            (cons "q" "Quit.")
            )))
      (dolist (x commands nil)
        (format t "~S - ~S~%" (car x) (cdr x))
        ))
))


(defun unknown (cmd)
  (progn
    (format t "Unknown command: ~S" cmd)
    nil
))

