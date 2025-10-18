(load "testlib.lisp")
(load "binary.lisp")
(load "machine.lisp")

(defvar tape)
(defvar state-pair)

(setf tape
  (list 1 0 1 0 0 1 1 1 2)
  ) ; 167 binary compact


(setf xn*2 
  (make-machine
    (list
      (make-state-pair
        (make-action 0 0 1)
        (make-action 1 0 1))
      (make-state-pair
        (make-action 0 1 1)
        (make-action 2 0 1))
      (make-state-pair
        (make-action 3 1 1)
        (make-action nil nil nil))
      (make-state-pair
        (make-action 0 1 *machine-stop*)
        (make-action nil nil nil))
      )
    )
  )


(princ xn*2)

(setf state-pair '(1 2 3 4 5 6))

(check-expect '(get-next-state state-pair 0) 1) 
(check-expect '(get-next-state state-pair 1) 4) 
(check-expect '(get-next-write state-pair 0) 2) 
(check-expect '(get-next-write state-pair 1) 5) 
(check-expect '(get-next-move state-pair 0) 3) 
(check-expect '(get-next-move state-pair 1) 6) 

(check-expect '(get-state-pair xn*2 3) '(0 1 0 nil nil nil))
(check-expect '(get-state-pair xn*2 1) '(0 1 1 2 0 1))

(check-expect '(machine-step xn*2 0 (read-tape (contracted-to-expanded tape) 0)) '(0 0 1))

(check-expect '(run-machine xn*2 (contracted-to-expanded tape) 16) '(1 0 0 1 0 0 0 1 0 1 0 1 0 1 1 0))