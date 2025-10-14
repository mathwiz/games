(load "testlib.lisp")
(load "binary.lisp")


(check-expect "10" (bin-to-string(int-to-bin 2)))
(check-expect 2 2)
