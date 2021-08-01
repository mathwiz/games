(defparameter *SUIT-SYMBOLS* '(s h d c))
(defparameter *SUIT-NAMES* '(spades hearts diamonds clubs))
(defparameter *RANK-SYMBOLS* '(2 3 4 5 6 7 8 9 10 j q k a))
(defparameter *RANK-NAMES* '(deuce three four five six seven eight nine ten jack queen king ace))


(defun poker-value (hand)
  (let ((ranked (compute-ranks hand))
        (pair (pair-value (compute-ranks hand)))
        (full-house (fh-value (compute-ranks hand)))
        (straight (straight? hand))
        (flush (flush? hand)))
    (cond ((and flush straight (equal (high-card ranked) 'ace))
           (list 'royal 'flush '- flush))
          ((and flush straight)
           (list 'straight 'flush '- straight 'high 'of flush))
          ((quads? ranked)
           (list 'four 'of 'a 'kind '- (quads? ranked)))
          (full-house)
          (flush 
           (list high-card '-high 'flush flush))
          (straight
           (list stright '-high 'straight))
          ((trips? ranked)
           (list 'three 'of 'a 'kind '- (trips ranked)))
          (pair)
          (t
           (list 'high 'card (high-card ranked))))))


(defun compute-ranks (hand)
  (cond ((hand 1))
        (t 2)))

(defun pair-value (hand)
  (cond ((hand 1))
        (t 2)))

(defun trips? (hand)
  (cond ((hand 1))
        (t 2)))

(defun quads? (hand)
  (cond ((hand 1))
        (t 2)))

(defun flush? (hand)
  (cond ((hand 1))
        (t 2)))

(defun straight? (hand)
  (cond ((hand 1))
        (t 2)))

(defun fh-value (hand)
  (cond ((hand 1))
        (t 2)))

