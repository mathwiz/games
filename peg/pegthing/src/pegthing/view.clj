(ns pegthing.view)

(use 'pegthing.model)

(def alpha-start 97)
(def alpha-end 123)
(def letters (map (comp str char) 
                  (range alpha-start alpha-end)))
(def pos-chars 3)


(defn render-pos [board pos] 
  (str (nth letters (dec pos)) 
       (if (get-in board [pos 
                          :pegged]) "0" "-")))


(defn row-positions "Return all positions in the given row" [row-num] 
  (range (inc (or (row-tri (dec row-num)) 
                  0)) 
         (inc (row-tri row-num))))


(defn row-padding "String of spaces to add to the beginning of a row to center it." [row-num rows] 
  (let [pad-length (/ (* (- rows row-num) pos-chars) 2)] 
    (apply str (take pad-length (repeat " ")))))


(defn render-row [board row-num] 
  (str (row-padding row-num 
                    (:rows board)) 
       (clojure.string/join " " (map (partial render-pos board) 
                                     (row-positions row-num)))))


(defn print-board [board] 
  (doseq [row-num (range 1 (inc 
                            (:rows board)))] 
    (println (render-row board row-num))))


(defn letter->pos "Converts a letter string to the corresponding position number" [letter] 
  (inc (- (int (first letter)) alpha-start)))
