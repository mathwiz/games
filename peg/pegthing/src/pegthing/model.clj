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


