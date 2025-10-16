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

(defun machine-step (machine tape pos state)
  (let ((state-pair 1)
        (next 1)
        (write 1)
        (move 1))
    (cond 
      ((> step limit) step)
      ((eq move *machine-stop*) step)
      (t (recur (1+ pos) (1+ step)))
      )
    )
  )

(defun run-machine (machine tape limit)
  (labels ((recur (pos step)
            (let (
                  (state 1)
                  (write 1)
                  (move 1))
              (cond 
                ((> step limit) step)
                ((eq move *machine-stop*) step)
                (t (recur (1+ pos) (1+ step)))
                )
              )
            ))
    (recur 0 0)
    ))
