(ns game-proj.model)

(def Model {:roll 1 
            :should-end false 
            :result nil})

(defn roll [] 
  (inc (rand-int 6)))

(defn action [args] 
  (do (def Model (assoc Model 
                        :result (+ (roll) 
                                   (roll)))) 
      (def Model (update-in Model [:roll] inc))))
