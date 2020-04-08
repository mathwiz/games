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
  (labels ((pad (lst)
             (let ((len (- 64 (length lst))))
               (append (make-list len :initial-element 0) lst)))
           (get-bit (index)
             (if (logbitp index int)
                 1
                 0))
           (recur (index acc)
             (cond ((= index 0) (pad (reverse acc)))
                   (t (recur (1- index) (cons (get-bit (1- index)) acc))))))
    (recur (integer-length int) nil)))


(defun bits->board (bits)
  (labels ((recur (bs row board)
             (cond ((null bs) (reverse (cons (reverse row) board)))
                   (t (if (= (length row) 8)
                          (recur (cdr bs) (list (car bs)) (cons (reverse row) board))
                          (recur (cdr bs) (cons (car bs) row) board))))))
    (recur bits nil nil)))
