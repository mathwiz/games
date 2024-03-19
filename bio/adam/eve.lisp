(defstruct simulation
  (males nil)
  (females nil)
  (num-males 0)
  (num-females 0)
)

(defun new-simulation (pop)
  (let ((s (make-simulation)))
    (progn
      (setf (simulation-males s) (make-array pop))
      (setf (simulation-females s) (make-array pop))
      )
    s)
)

(defstruct animal 
  (id nil)
  (mom nil)
  (dad nil)
  (gender nil)
)

(defun new-animal (id mom dad gender)
  (make-animal
   :id id
   :mom mom
   :dad dad
   :gender gender)
)

(defun procreate (mom dad)
  (let ((gender (random 2))
        (id (+ mom dad)))
    (* gender b)))

(loop for x from 1 to 20
      for y = (procreate 1 2)
      collect y)

(defun initialize (pop)
  (let ((ms (make-array pop))
        (fs (make-array pop)))
    (loop for i from 0 below pop
          (print i))
    (cons ms fs))
)

(defun simulate (pop gens)
  (let* ((sim (initialize 11))
         (ms (car sim))
         (fs (cdr sim)))
    (loop for i from 1 to gens
          do (print i)))
)

(defun run-sim ()
  (let ((pop 400)
        (gens 10)
        (counter 0))
    (simulate pop gens))
)
