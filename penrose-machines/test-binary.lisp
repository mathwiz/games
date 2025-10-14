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

