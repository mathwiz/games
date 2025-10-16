(load "testlib.lisp")
(load "binary.lisp")
(load "machine.lisp")

(defvar tape)

(setf tape
  (list 1 0 1 0 0 1 1 1 2)
  ) ; 167 binary compact


(setf xn*2 
  (make-machine
    (list
      (make-state-pair
        (make-action 0 0 1)
        (make-action 0 0 1))
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


(princ (contracted-to-expanded tape))
(princ xn*2)

(check-expect '(run-machine xn*2 (contracted-to-expanded tape) 10) 11)