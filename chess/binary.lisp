(defun bits->int (bits)
  (labels ((pow (lst) 
             (expt 2 (1- (length lst))))
           (recur (bs acc)
             (cond ((null bs) acc)
                   (t (recur (cdr bs) 
                             (if (= (car bs) 1)
                                 (+ (pow bs) acc)
                                 acc))))))
    (recur bits 0)))


(defun board->bits (board)
  (reduce #'append (mapcar #'reverse board)))

