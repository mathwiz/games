(load "get-file.lisp")

(defun main ()
  (let ((_REGISTERS nil)
        (_MEMORY nil)
        (_PROGRAM nil))
    (progn
      (main-loop))))


(defun main-loop ()
  (progn
    (format t "~%(h = Help)> ")
    (let ((cmd (read-line)))
      (cond ((equal cmd "h") (help))
            ((equal cmd "i") (init))
            ((equal cmd "j") (set-register))
            ((equal cmd "l") (load-program))
            ((equal cmd "p") (list-program))
            ((equal cmd "r") (run))
            ((equal cmd "s") (show))
            ((equal cmd "q") (progn 
                               (end-program) 
                               (return-from main-loop nil)))
            (t (unknown cmd))))
    (main-loop)
))


(defun help ()
  (progn
    (let ((commands
           (list
            (cons "h" "This list.")
            (cons "i" "Initialize registers.")
            (cons "j" "Set register.")
            (cons "l" "Load program.")
            (cons "p" "List program.")
            (cons "r" "Run program.")
            (cons "s" "Show registers.")
            (cons "q" "Quit.")
            )))
      (dolist (x commands nil)
        (format t "~S - ~S~%" (car x) (cdr x))
        ))
))


(defun init () 
  (progn 
    (format t "Size of memory: ")
    (setf _REGISTERS (read))
    (setf _MEMORY (make-array _REGISTERS))
))


(defun set-register ()
  (let ((index nil)
        (value nil))
    (progn
      (format t "Register: ")
      (setf index (read))
      (format t "value: ")
      (setf value (read))
      (setf (aref _MEMORY (1- index)) value)
)))


(defun load-program () 
  (progn 
    (format t "Source file: ")
    (setf _SOURCE (read))
    ;(load _SOURCE)
    (setf _PROGRAM (extract-program (get-file _SOURCE)))
))


(defun list-program () 
  (loop for x in _PROGRAM
    do (progn
         (format t "~S~%" x)
         )
))


(defun extract-program (lines)
  (mapcar #'READ-FROM-STRING lines)
)


(defun run () 
  (progn 
    (run-register-program _PROGRAM _MEMORY)
))


(defun run-register-program (program registers)
  (labels ((recur (line)
             nil)))
  (loop for x in _PROGRAM
    do (progn
         (format t "~S~%" x)
         (execute-command x registers)
         )
))


(defun execute-command (line registers)
  (let ((cmd (first line)))
    (cond ((equal cmd 1) (inc line registers))
          ((equal cmd 2) (deb line registers))
          (t (end)))
))


(defun inc (line registers)
  1
)

(defun deb (line registers)
  1
)

(defun end ()
  -1
)


(defun show ()
  (progn
    (princ _MEMORY)
))


(defun end-program ()
  (progn
    (format t "Bye.")
    nil
))


(defun unknown (cmd)
  (progn
    (format t "Unknown command: ~S" cmd)
    nil
))

