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
