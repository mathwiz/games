;; Helpers *************************************************

(load "helpers.lisp")

(defun select-from-pop (array)
  (select-randomly-from-array array)
)

(defun pop-size (generation)
  (+ (generation-num-females generation)
     (generation-num-males generation))
)

(defun extinctp (generation)
  (or (zerop (generation-num-females generation))
      (zerop (generation-num-males generation)))
)

(defun unique-mitochondria (generation)
  (let ((fs (coerce (generation-females generation) 'list)))
   (length (remove-duplicates
      (mapcar (lambda (x) (animal-mt x)) fs)))
))

(defun unique-ychromosome (generation)
  (let ((ms (coerce (generation-males generation) 'list)))
   (length (remove-duplicates
      (mapcar (lambda (x) (animal-y x)) ms)))
))


;; Helpers *************************************************

(defconstant *FEMALE* 0)
(defconstant *MALE* 1)
(defconstant *repro-rate* 2.0)


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
              (setf (aref fs i) (new-animal f-id nil nil *FEMALE* f-id nil))
              (setf (aref ms i) (new-animal m-id nil nil *MALE* nil m-id))
              )))
    (cons fs ms))
)


;; (loop repeat 10 do
;;       (print (select-from-pop (generation-males gen))))


(defun new-gender ()
  (random 2))


(defun new-id ()
  (round (random (expt 10 9))))


(defun procreate (mom dad)
  (let* ((g (new-gender))
         (mt (animal-mt mom))
         (y (if (= g *MALE*) (animal-y dad) nil)))
    (new-animal (new-id)
                (animal-id mom)
                (animal-id dad)
                g
                mt
                y)
))


;TODO: make this do any adjustment to ensure equality, etc.
(defun next-gen-parents (gen R)
  (let* ((fs (generation-females gen))
         (ms (generation-males gen))
         (mating-fs (round (* R (length fs)))))
    (cons fs ms))
)


;TODO: ensure each mother reproduces at least up to R/2
;Generate the necessary indexes into a list to loop over
(defun next-gen-mothers (females r)
  (let ((R 2.0))
    (loop for i from 1 to (round (* R (length females)))
          collect (select-from-pop females)))
)


(defun reproduce-generation (gen &optional rate)
  (let* ((R (if (null rate) *repro-rate* rate))
         (parents (next-gen-parents gen R))
         (ms (cdr parents))
         (fs (car parents))
         (fs-matings (round (* R (length fs)))))
    (loop for i from 1 to fs-matings collect
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
                          (if (= gender *FEMALE*) (cons item fs) fs)
                          (if (= gender *MALE*) (cons item ms) ms)
                          )))))
    (recur offspring nil nil))
)


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


(defun simulate (pop gens)
  (let ((initial (new-generation pop)))
    (labels ((recur (gen num)
               (progn
                 (report-generation gen)
                 (if (or 
                      (= num gens)
                      (extinctp gen))
                    gen
                    (recur (next-generation gen) (1+ num))))))
      (recur initial 1)))
)


(defun report-generation (gen)
  (let* ((fs (generation-females gen))
         (ms (generation-males gen))
         (unique-mito (unique-mitochondria gen))
         (unique-y (unique-ychromosome gen))
         (gen-num (generation-number gen)))
    (progn
      (format t "~&~A" gen-num)
      (format t ",~A" (generation-num-females gen))
      (format t ",~A" (generation-num-males gen))
      (format t ",~A" unique-mito)
      (format t ",~A" unique-y)
      )
))


(defun run-sim (&optional pop-size num-gens)
  (let ((pop (if (null pop-size) 256 pop-size))
        (gens (if (null num-gens) 150 num-gens)))
    (let ((final (simulate pop gens)))
      (pop-size final)))
)
