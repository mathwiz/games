(load "eve.lisp")


(let ((reps 3)
      (pop 20)
      (gens 5))
(loop repeat reps do
      (run-sim pop gens)))
