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


(defstruct animal 
  (id nil)
  (mom nil)
  (dad nil)
  (gender nil)
  (mt nil)
  (y nil)
)


(defun new-animal (id mom dad gender mt y)
  (make-animal
   :id id
   :mom mom
   :dad dad
   :gender gender
   :mt mt
   :y y)
)


(defstruct generation
  (number nil)
  (males nil)
  (females nil)
  (num-males 0)
  (num-females 0)
)


(defun new-generation (pop-size)
  (let ((gen (make-generation))
        (animals (initialize pop-size)))
    (progn
      (setf (generation-males gen) (cdr animals))
      (setf (generation-females gen) (car animals))
      (setf (generation-num-males gen) (length (generation-males gen)))
      (setf (generation-num-females gen) (length (generation-females gen)))
      )
    gen)
)


(defun initialize (pop)
  (let ((ms (make-array pop))
        (fs (make-array pop)))
    (loop for i from 0 below pop do
          (let ((f-id (1+ i))
                (m-id (* (1+ i) -1)))
            (progn 
              (setf (aref fs i) (new-animal f-id nil nil FEMALE f-id nil))
              (setf (aref ms i) (new-animal m-id nil nil MALE nil m-id))
              )))
    (cons fs ms))
)


;; test initialize
(setf gen (new-generation 4))
(select-from-pop (generation-females gen))
(select-from-pop (generation-males gen))

(loop repeat 10 do
      (print (select-from-pop (generation-males gen))))


(defun new-gender ()
  (random 2))


(defun new-id ()
  (round (random (expt 10 9))))


(defun procreate (mom dad)
  (let* ((g (new-gender))
         (mt (animal-mt mom))
         (y (if (= g MALE) (animal-y dad) nil)))
    (new-animal (new-id) 
                (animal-id mom) 
                (animal-id dad) 
                g 
                mt 
                y)
))


(defun count-unique (lst)
  (length (get-unique-elements lst)))


(defun count-elements (lst selector)
  (length (remove-if-not selector lst)))


(defun reproduce-generation (gen)
  (let ((R 2.2)
        (females (generation-females gen))
        (males (generation-males gen)))
    (loop for i from 1 to (round (* R (length females))) do
          (print i)))
)


(defun select-from-pop (array)
  (let* ((len (length array))
         (index (random len)))
    (aref array index)))


(defun simulate (pop gens)
  (let* ((gen (new-generation pop))
         (ms (generation-males gen))
         (fs (generation-females gen)))
    (loop for i from 0 below pop do
          (print (aref fs i))
          ))
)


(defun iterate-pop (xs)
  (let ((a 1)
        (b 2))
    (print (+ a b)))
)


(defun run-sim ()
  (let ((pop 10)
        (gens 10)
        (counter 0))
    (simulate pop gens))
)

