;; Commands
;; 0 = halt
;; 1 n m = increment n, goto step m
;; 2 n m p = decrment n, goto step m unless n==0 whereby goto step p

;; Program - Zero out register 1; Number of decrements in register 2
(2 2 1 2)
(2 1 3 4)
(1 2 2)
(0)
