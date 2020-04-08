(defun bits->int (bits)
  (labels ((pow (lst) 
             (expt 2 (1- (length lst))))
           (recur (bs acc)
             (cond ((null bs) acc)
                   (t (recur (cdr bs) 
                             (if (not (= (car bs) 0))
                                 (+ (pow bs) acc)
                                 acc))))))
    (recur bits 0)))


(defun board->bits (board)
  (reduce #'append (mapcar #'reverse board)))


(defun int->bits (int)
  (labels ((bit (index)
             (if (logbitp index int)
                 1
                 0))
           (recur (index acc)
             (cond ((= index 0) (reverse acc))
                   (t (recur (1- index) (cons (bit (1- index)) acc))))))
    (recur (integer-length int) nil)))


(defun bits->board (bits)
  nil)
