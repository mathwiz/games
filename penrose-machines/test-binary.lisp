(load "testlib.lisp")
(load "binary.lisp")

(check-expect '(int-to-bin 11) (list 1 0 1 1))
(check-expect '(int-to-bin 12) (list 1 1 0 0))
(check-expect '(int-to-bin 13) (list 1 1 0 1))

(check-expect '(bin-to-string(int-to-bin 12)) "1100")
(check-expect '(bin-to-string(int-to-bin 13)) "1101")

(check-expect '(bin-to-int (list 1 0 1 1)) 11)
(check-expect '(bin-to-int (list 1 1 0 0)) 12)
(check-expect '(bin-to-int (list 1 1 0 1)) 13)

(check-expect '(ticks -1) nil)
(check-expect '(ticks 0) nil)
(check-expect '(ticks 5) '(1 1 1 1 1))

(setf contracted-tape 
  (list 1 0 0 1 2 1 1 2 1 0 0 3 1 1 4 0 2 ))
(setf expanded-tape 
  (list 1 0 0 0 1 0 1 1 0 1 0 1 0 1 1 0 1 0 0 0 1 1 1 0 1 0 1 0 1 1 1 1 0 0 1 1 0 ))
(check-expect '(contracted-to-expanded contracted-tape) expanded-tape)

(check-expect '(expanded-to-contracted expanded-tape) contracted-tape)
