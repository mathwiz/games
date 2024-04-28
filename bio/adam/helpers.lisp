
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



(defun select-randomly-from-array (array)
  (let* ((len (length array))
         (index (if (= len 0)
                    -1
                    (random len))))
    (if (= index -1)
        nil
        (aref array index))))


(defun count-unique (lst)
  (length (get-unique-elements lst)))


(defun count-elements (lst selector)
  (length (remove-if-not selector lst)))
