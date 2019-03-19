(defun load-gun (shots) 
  (1+ (random shots)))

(defun prompt ()
  (print "Shoot? [Y/n]")
  nil)

(defun take-turn (current chamber)
  (prompt)
  (let ((answer (read)))
    (if (equal 'n answer)
        (print "Chicken!")
        (if (equal current chamber)
            (print "Bang! You're dead!")
            (take-turn (1+ current) chamber)))))

(defun play (shots)
  (let ((chamber (load-gun shots)))
    (take-turn 1 chamber)))