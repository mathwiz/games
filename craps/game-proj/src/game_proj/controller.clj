(ns game-proj.controller)

(use 'clojure.string)
(use 'game-proj.model)
(use 'game-proj.view)

(defn display [] 
  (do (println) 
      (show_state) 
      (show_prompt)))

(defn take-turn [turn] 
  (display)
  (let [answer (trim (read-line))] 
    (cond (or (= "Y" answer) 
              (= "y" answer)) 
          (do (show_pre_action) 
              (action answer) 
              (show_post_action) 
              (recur (inc turn))) 
          :else (do (show_end_game)))))

(defn play [] 
  (do (take-turn 1)))
