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
      (make-state-pair ;0
        (make-action 0 0 1)
        (make-action 1 0 1))
      (make-state-pair ;1
        (make-action 0 1 1)
        (make-action 2 0 1))
      (make-state-pair ;10
        (make-action 3 1 1)
        (make-action nil nil nil))
      (make-state-pair ;11
        (make-action 0 1 *machine-stop*)
        (make-action nil nil nil))
      )
    )
  )

(princ xn*2)


(setf xn+1 
  (make-machine
    (list
      (make-state-pair ;0
        (make-action 0 0 1)
        (make-action 1 1 1))
      (make-state-pair ;1
        (make-action 0 0 1)
        (make-action 2 1 1))
      (make-state-pair ;10
        (make-action 3 0 -1)
        (make-action 2 1 1))
      (make-state-pair ;11
        (make-action 6 1 1)
        (make-action 4 0 -1))
      (make-state-pair ;100
        (make-action 5 1 -1)
        (make-action 4 1 -1))
      (make-state-pair ;101 
        (make-action 6 0 1)
        (make-action 2 1 1))
      (make-state-pair ;110 
        (make-action 6 1 *machine-stop*)
        (make-action 7 1 1))
      (make-state-pair ;111
        (make-action 3 1 1)
        (make-action 7 0 1))
      )
    )
  )

(princ xn+1)


(setf state-pair '(1 2 3 4 5 6))

(check-expect '(get-next-state state-pair 0) 1) 
(check-expect '(get-next-state state-pair 1) 4) 
(check-expect '(get-next-write state-pair 0) 2) 
(check-expect '(get-next-write state-pair 1) 5) 
(check-expect '(get-next-move state-pair 0) 3) 
(check-expect '(get-next-move state-pair 1) 6) 

(check-expect '(get-state-pair xn*2 3) '(0 1 0 nil nil nil))
(check-expect '(get-state-pair xn*2 1) '(0 1 1 2 0 1))

(check-expect '(machine-step xn*2 0 (read-tape (contracted-to-expanded tape) 0)) '(1 0 1))

(check-expect '(update-tape (contracted-to-expanded tape) 0 -1) '(-1 0 0 1 0 0 0 1 0 1 0 1 0 1 1 0))
(check-expect '(update-tape (contracted-to-expanded tape) 1 -1) '(1 -1 0 1 0 0 0 1 0 1 0 1 0 1 1 0))
(check-expect '(update-tape (contracted-to-expanded tape) 15 -1) '(1 0 0 1 0 0 0 1 0 1 0 1 0 1 1 -1))
(check-expect '(update-tape (contracted-to-expanded tape) 16 -1) '(1 0 0 1 0 0 0 1 0 1 0 1 0 1 1 0 0))

(check-expect '(run-machine xn*2 (contracted-to-expanded tape) 21) 
  '(0 1 0 0 1 0 0 0 1 0 1 0 1 0 0 1 1 0))
(check-expect '(bin-to-int (tape-to-bin (run-machine xn*2 (contracted-to-expanded tape) 21)))
  334)

(check-expect '(bin-to-int (tape-to-bin (run-machine xn+1 (contracted-to-expanded tape) 81)))
  168)





