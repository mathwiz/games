(ns pegthing.model
  (require [clojure.set :as set]))


(defn tri*
  "Generates lazy sequence of triangular numbers"
  ([] (tri* 0 1))
  ([sum n]
   (let [new-sum (+ sum n)]
     (cons new-sum (lazy-seq (tri* new-sum (inc n)))))))


(def tri (tri*))


(defn triangular?
  "Is the number triangular?"
  [n]
  (= n (last (take-while #(>= n %) tri))))


(defn row-tri
  "The triangular number at the end of row n"
  [n]
  (last (take n tri)))


(defn row-num
  "Return row number that the position belongs to."
  [pos]
  (inc (count (take-while #(> pos %) tri))))


(defn connect
  "Form a mutual connection between two positions."
  [board max-pos pos neighbor destination]
  (if (<= destination max-pos)
    (reduce
     (fn [new-board [p1 p2]] (assoc-in new-board [p1 :connections p2] neighbor))
     board
     [[pos destination] [destination pos]])
    board))


(defn connect-right
  [board max-pos pos]
  (let [neighbor    (inc pos)
        destination (inc neighbor)]
    (if-not (or (triangular? neighbor) (triangular? pos))
      (connect board max-pos pos neighbor destination) board)))


(defn connect-down-left
  [board max-pos pos]
  (let [row         (row-num pos)
        neighbor    (+ row pos)
        destination (+ 1 row neighbor)]
    (connect board max-pos pos neighbor destination)))


(defn connect-down-right
  [board max-pos pos]
  (let [row         (row-num pos)
        neighbor    (+ 1 row pos)
        destination (+ 2 row neighbor)]
    (connect board max-pos pos neighbor destination)))


(defn add-pos
  "Pegs the position and performs connctions"
  [board max-pos pos]
  (let [pegged-board (assoc-in board [pos :pegged] true)]
    (reduce
     (fn [new-board connection-creation-fn]
       (connection-creation-fn new-board max-pos pos))
     pegged-board
     [connect-right connect-down-left connect-down-right])))


(defn new-board
  "Creates a new board with the given number of rows"
  [rows]
  (let [initial-board {:rows rows}
        max-pos       (row-tri rows)]
    (reduce (fn [board pos] (add-pos board max-pos pos))
            initial-board
            (range 1 (inc max-pos)))))


(defn pegged?
  "Does pos have a peg?"
  [board pos]
  (get-in board [pos :pegged]))


(defn remove-peg
  "Take the peg at given pos out of board"
  [board pos]
  (assoc-in board [pos :pegged] false))


(defn place-peg
  "Put peg at given pos in board"
  [board pos]
  (assoc-in board [pos :pegged] true))


(defn move-peg
  "Move peg from from p1 to p2"
  [board p1 p2]
  (place-peg (remove-peg board p1) p2))


