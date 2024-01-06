(defstruct simulation
  (males nil)
  (females nil)
  (num-males 0)
  (num-females 0)
)

(defun new-simulation (pop)
  (let ((s (make-simulation)))
    (progn
      (setf (simulation-males s) (make-array pop :initial-element 0))
      (setf (simulation-females s) (make-array pop :initial-element 0))
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
    (loop nil))
)

(defun simulate (pop gens)
)
