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

(defun new-gender ()
  (random 2))

(defun new-id ()
  (round (random (expt 10 9))))

(defun procreate (mom dad)
  (let ((g (new-gender))
        (id (new-id)))
    (new-animal id mom dad g)))

(loop for x from 1 to 4
      for y = (procreate (new-id) (new-id))
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


(defun has-only-unique-elements-p (lst)
  (or (null lst)
      (and (not (member (car lst) (cdr lst)))
           (has-only-unique-elements-p (cdr lst)))))

(defun get-unique-elements (lst)
  (cond ((null lst) nil)
        ('t (adjoin (car lst) (get-unique-elements (cdr lst))))
))

;; Example usage:
(setq my-list '(1 2 3 4 4 5 6 6 7 8 8 8 8))
(setq unique-elements (get-unique-elements my-list))
;; unique-elements will be (1 2 3 5 7)


(defun get-unique-elements-hash (lst)
  (let ((hash-table (make-hash-table :test 'equal)))
    (dolist (element lst)
      (incf (gethash element hash-table 0)))
    (loop for key being the hash-keys of hash-table
          if (= (gethash key hash-table) 1)
          collect key)))

;; Example usage:
(setq unique-elements-hash (get-unique-elements-hash my-list))
;; unique-elements-hash will be (1 2 3 5 7)
