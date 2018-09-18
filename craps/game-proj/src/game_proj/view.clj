(ns game-proj.view)

(use 'game-proj.model)

(defn show_prompt [] 
  (println "Roll? [y/N]"))

(defn show_state [] 
  (println (str "Roll: " (roll-number))))

(defn show_end_game [] 
  (do (println) 
      (println "Ending game.")))

(defn show_pre_action [] 
  (print "Rolling..."))

(defn show_post_action [] 
  (println (roll-result)))
