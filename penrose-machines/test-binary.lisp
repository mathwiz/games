(load "testlib.lisp")
(load "binary.lisp")

(check-expect '(list 1 0 1 1) (int-to-bin 11))
(check-expect '(list 1 1 0 0) (int-to-bin 12))
(check-expect '(list 1 1 0 1) (int-to-bin 13))
(check-expect "110" (bin-to-string(int-to-bin 2)))
(check-expect 2 2)
