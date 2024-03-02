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
  (mito nil)
)

(defun new-animal (id mito)
  (let ((a (make-animal)))
    (progn
      (setf (animal-id a) id)
      (setf (animal-mito a) mito)
      a))
)


(defun initialize (pop)
  (let ((ms (make-array pop))
        (fs (make-array pop)))
    (print pop)
    (cons ms fs))
)

(defun simulate (pop gens)
  (let ((sim (initialize 11)))
    (loop for i from 1 to gens
          do (print i)))
)

(defun run-sim ()
  (let ((pop 400)
        (gens 10))
    (simulate pop gens))
)
