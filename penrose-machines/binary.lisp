(defun even? (n)
  (= (rem n 2) 0))

(defun div2 (n)
  (floor n 2))

(defun pow2 (n)
  (expt 2 n))

(defun ticks (n)
  (labels ((recur (counter acc)
             (if (< counter 1)
               acc
               (recur (1- counter) (cons 1 acc)))))
   (recur n nil)
  ))
    

(defun int-to-bin (n)
  (labels ((recur (n acc)
             (if (< n 2)
               (cons (rem n 2) acc)
               (recur (div2 n) (cons (rem n 2) acc)))))
   (recur n nil) 
  ))

(defun bin-to-string (bits)
  (labels ((recur (bs acc)
             (if (null bs)
               acc
               (recur (rest bs) (concatenate 'string 
                                  acc
                                  (write-to-string (first bs)))))))
   (recur bits "") 
  ))


(defun bin-to-int (bits)
  (labels ((recur (bs pow acc)
             (if (null bs)
               acc
               (recur (rest bs) (1+ pow) (+ (* (first bs) (pow2 pow)) acc)))))
   (recur (reverse bits) 0 0)
  ))

(defun contracted-to-expanded (ints)
  (labels ((recur (xs acc)
             (if (null xs)
               acc
               (recur (rest xs) (translate (first xs) acc)))
             )
           
           (translate (digit existing)
             (append 
               (cond  ((eq digit 0) '(0))
                      ((eq digit 1) '(1 0))
                      ((eq digit 2) '(1 1 0))
                      (t (reverse (cons 0 (ticks digit)))))
               existing)
           )
           )
   (recur (reverse ints) nil)
  ))
  
;TODO
(defun expanded-to-contracted (bits)
  (labels ((recur (xs acc)
             (if (null xs)
               acc
               (recur (rest xs) (translate (first xs) acc)))
             )
           
           (translate (digit existing)
             (append 
               (cond  ((eq digit 0) '(0))
                      ((eq digit 1) '(1 0))
                      ((eq digit 2) '(1 1 0))
                      (t (reverse (cons 0 (ticks digit)))))
               existing)
           )
           )
   (recur bits nil)
  ))
