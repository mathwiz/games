(ns game-proj.model)

(def State [])

(def Model {:roll 1 
            :should-end false 
            :result nil})

(defn update-state [model] 
  (def State (cons model State)))

(defn get-model [] 
  (cond (= (count State) 0) 
        (do (def State (cons Model State)) Model) 
        :else (first State)))

(defn roll-number [] 
  (get (get-model) 
       :roll))

(defn roll-result [] 
  (get (get-model)
       :result))

(defn roll [] 
  (inc (rand-int 6)))

(defn roll-dice [n acc] 
  (cond (= n 0) acc 
        :else (recur (dec n) 
                     (+ acc (roll)))))

(defn action [& args] 
  (let [model (get-model)] 
    (do (update-state (update-in (assoc model 
                                        :result (roll-dice 2 0)) 
                                 [:roll] inc)) 
        (get-model))))
