(load "eve.lisp")


(let ((reps 3)
      (pop 20)
      (gens 5))

(dotimes (i reps)
      (progn
        (format t "~&~A" (1+ i))
        (run-sim pop gens))))
