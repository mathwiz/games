(ns game-proj.view)

(use 'game-proj.model)

(defn show_prompt [] 
  (println "Roll? [y/N]"))

(defn show_state [] 
  (println (str "Roll: " (get Model 
                              :roll))))

(defn show_end_game [] 
  (do (println) 
      (println "Ending game.")))

(defn show_pre_action [] 
  (println "Rolling..."))

(defn show_post_action [] 
  (println (get Model 
                :result)))
