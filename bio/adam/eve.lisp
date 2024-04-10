;; Helpers *************************************************

(defun get-unique-elements (lst)
  (labels ((recur (l seen acc)
             (cond ((null l) acc)
                   ((or (member (car l) (cdr l))
                        (member (car l) seen))
                    (recur (remove-if (lambda (x) (equal x (car l))) l) (cons (car l) seen) acc))
                   (t
                    (recur (cdr l) (cons (car l) seen) (cons (car l) acc))))))
    (recur lst nil nil)))


(defun get-unique-elements-hash (lst)
  (let ((hash-table (make-hash-table :test 'equal)))
    (dolist (element lst)
      (incf (gethash element hash-table 0)))
    (loop for key being the hash-keys of hash-table
          if (= (gethash key hash-table) 1)
          collect key)))

;; Helpers *************************************************

(defconstant FEMALE 0)
(defconstant MALE 1)

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
  (trait nil)
)

(defun new-animal (id mom dad gender trait)
  (make-animal
   :id id
   :mom mom
   :dad dad
   :gender gender
   :trait trait)
)

(defun new-gender ()
  (random 2))

(defun new-id ()
  (round (random (expt 10 9))))

(defun procreate (mom dad)
  (let* ((g (new-gender))
         (id (new-id))
         (trait nil))
    (new-animal id mom dad g trait)))

(defun count-unique (lst)
  (length (get-unique-elements lst)))

(defun count-elements (lst selector)
  (length (remove-if-not selector lst)))

;; tester
;;(length (remove-if (lambda (x) (= x 0)) (loop for x from 0 to 1000 collect (new-gender))))
 
(defun reproduce-pop (females males)
  (labels ((recur (fs ms acc)
             nil))
    (recur females males nil)))


(loop for x from 1 to 4
      for y = (procreate (new-id) (new-id))
      collect y)

(defun initialize (pop)
  (let ((ms (make-array pop))
        (fs (make-array pop)))
    (loop for i from 0 below pop do
          (let ((f-id i)
                (m-id (* i -1)))
            (progn 
              (setf (aref fs i) (new-animal f-id nil nil FEMALE f-id))
              (setf (aref ms i) (new-animal m-id nil nil MALE m-id))
              )))
    (cons ms fs))
)

(initialize 4)

(defun select-from-pop (array)
  (let* ((len (length array))
         (index (random len)))
    (aref array index)))

(defun simulate (pop gens)
  (let* ((sim (initialize 11))
         (ms (car sim))
         (fs (cdr sim)))
    (loop for i from 1 to gens do
          (print i)))
)

(defun run-sim ()
  (let ((pop 400)
        (gens 10)
        (counter 0))
    (simulate pop gens))
)

