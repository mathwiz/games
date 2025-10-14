(defparameter *binary-version* 0.01)
(defparameter *binary-nil* -1)

(defun even? (n)
  (= (rem n 2) 0))

(defun div2 (n)
  (floor n 2))

(defun int-to-bin (n)
  (labels ((recur (n acc)
             (if (< n 2)
               (cons (rem n 2) acc)
               (recur (div2 n) (cons (if (even? n) 0 1) acc)))))
   (recur n nil) 
  )
  )

(defun bin-to-string (bits)
  "10")
