(defun life ()
  (let ((_SIZE nil) 
        (_GEN1 nil)
        (_GEN2 nil))
    (progn 
      (init)
      (main-loop))))


(defun init ()
  nil)

(defun main-loop ()
  (princ 'done))

;; Run it
(life)
