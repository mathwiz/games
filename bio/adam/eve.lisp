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


(defun select-from-pop (array)
  (let* ((len (length array))
         (index (random len)))
    (aref array index)))


(defun count-unique (lst)
  (length (get-unique-elements lst)))


(defun count-elements (lst selector)
  (length (remove-if-not selector lst)))


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
      (setf (generation-number gen) 1)
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


;TODO: make this do any adjustment to ensure equality, etc.
(defun next-gen-parents (gen r)
  (let ((fs (generation-females gen))
        (ms (generation-males gen)))
    (cons fs ms))
)


;TODO: ensure each mother reproduces at least up to R/2
;Generate the necessary indexes into a list to loop over
(defun next-gen-mothers (females r)
  (let ((R 2.2))
    (loop for i from 1 to (round (* R (length females)))
          collect (select-from-pop females)))
)


(defun reproduce-generation (gen)
  (let* ((R 2.2)
         (parents (next-gen-parents gen R))
         (ms (cdr parents))
         (fs (car parents)))
    (loop for i from 1 to (round (* R (length fs))) collect
          (procreate
           (select-from-pop fs)
           (select-from-pop ms)))
))


(defun segregate-offspring (offspring)
  (labels ((recur (xs fs ms)
             (if (null xs)
                 (cons (coerce fs 'array)
                       (coerce ms 'array))
                 (let* ((item (car xs))
                        (gender (animal-gender item)))
                   (recur (cdr xs)
                          (if (= gender FEMALE) (cons item fs) fs)
                          (if (= gender MALE) (cons item ms) ms)
                          )))))
    (recur offspring nil nil))
)


(setq offspring
 (segregate-offspring
  (reproduce-generation (new-generation 4))))

(loop for x in '(a b c d e)
      for y = (cons 1 x)
      collect y)


(defun next-generation (current)
  (let ((offspring (segregate-offspring
                    (reproduce-generation current))) 
        (gen (make-generation)))
    (progn
      (setf (generation-number gen) (1+ (generation-number current)))
      (setf (generation-males gen) (cdr offspring))
      (setf (generation-females gen) (car offspring))
      (setf (generation-num-males gen) (length (generation-males gen)))
      (setf (generation-num-females gen) (length (generation-females gen)))
      )
    gen)
)


(setq next
 (next-generation gen))


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
