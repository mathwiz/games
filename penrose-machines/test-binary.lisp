(load "testlib.lisp")
(load "binary.lisp")


(check-expect "110" (bin-to-string(int-to-bin 2)))
(check-expect 2 2)
