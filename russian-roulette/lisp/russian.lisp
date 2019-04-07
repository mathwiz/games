(defun load-gun (shots) 
  (1+ (random shots)))

(defun prompt (n)
  (print (concatenate 'string "Shot " (write-to-string n) ". Shoot? [Y/n]"))
  nil)

(defun mock ()
  (print "Chicken!")
  nil)

(defun kill ()
  (print "Bang! You're dead!")
  nil)

(defun take-turn (current chamber)
  (prompt current)
  (let ((answer (read)))
    (if (equal 'n answer)
        (mock)
        (if (equal current chamber)
            (kill)
            (take-turn (1+ current) chamber)))))

(defun play (shots)
  (let ((chamber (load-gun shots)))
    (take-turn 1 chamber)))
