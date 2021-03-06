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
  "Take the peg at given pos out of board, returning board"
  [board pos]
  (assoc-in board [pos :pegged] false))


(defn place-peg
  "Put peg at given pos in board, returning board"
  [board pos]
  (assoc-in board [pos :pegged] true))


(defn move-peg
  "Move peg from from p1 to p2, returning board"
  [board p1 p2]
  (place-peg (remove-peg board p1) p2))


(defn valid-moves
  "Return a map of all valid moves for pos where the key is the
  destination and the value is the jumped position"
  [board pos]
  (into {}
        (filter
          (fn [[destination jumped]]
            (and (not (pegged? board destination))
                 (pegged? board jumped)))
          (get-in board [pos :connections]))))


(defn valid-move?
  "Return jumped position if p1 to p2 is valid, nil otherwise"
  [board p1 p2]
  (get (valid-moves board p1) p2))


(defn make-move
  "Move peg from p1 to p2, removing jumped peg"
  [board p1 p2]
  (if-let [jumped (valid-move? board p1 p2)]
    (move-peg (remove-peg board jumped) p1 p2)))


(defn can-move?
  "Do any of the pegged positions have valid moves"
  [board]
  (some (comp not-empty (partial valid-moves board))
        (map first (filter #(get (second %) :pegged) board))))




