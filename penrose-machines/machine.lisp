(defparameter *machine-left* -1)
(defparameter *machine-right* 1)
(defparameter *machine-stop* 0)
(defparameter *machine-zero* 0)
(defparameter *machine-one* 1)

(defun make-machine (states)
  (let ((ht (make-hash-table)))
    (labels ((recur (i pairs)
                    (cond ((null pairs) ht)
                          (t (progn 
                               (setf
                                 (gethash i ht)
                                 (first pairs))
                               (recur (1+ i) (rest pairs)))))	
                    ))
            (recur 0 states)
            )
    )
  )

(defun make-action (to-state write move)
  (list
    to-state
    write 
    move
    )
  )

(defun make-state-pair (zero-action one-action)
  (append zero-action one-action)
  )

(defun get-state-pair (machine state)
  (gethash state machine)
  )

(defun get-next-state (state-pair read-value)
  (if (eq read-value *machine-zero*)
      (nth 0 state-pair)
      (nth 3 state-pair))
  )

(defun get-next-write (state-pair read-value)
  (if (eq read-value *machine-zero*)
      (nth 1 state-pair)
      (nth 4 state-pair))
  )

(defun get-next-move (state-pair read-value)
  (if (eq read-value *machine-zero*)
      (nth 2 state-pair)
      (nth 5 state-pair))
  )

(defun read-tape (tape pos)
  (nth pos tape)
  )

(defun machine-step (machine state read-value)
  (let ((state-pair (get-state-pair machine state))
        )
    (list 
      (get-next-state state-pair read-value) 
      (get-next-write state-pair read-value) 
      (get-next-move state-pair read-value)))
  )

(defun run-machine (machine tape limit)
  (labels ((recur (pos state step)
            (let* ((read-value (read-tape tape pos))
                  (next (machine-step machine state read-value))
                  (state (nth 0 next))
                  (write (nth 1 next))
                  (move (nth 2 next))
                  (dummy (setf (nth pos tape) write)))
              (progn     
                (format t "~%read: ~A state:~A write:~A move:~A" read-value state write move)
                (print next)
                (print tape)
              	(cond 
                      ((> step limit) tape)
                      ((eq move *machine-stop*) tape)
                      (t (recur (1+ pos) state (1+ step)))
                      ))
              )
            ))
    (print machine)
    (print tape)
    (recur 0 0 0)
    ))
