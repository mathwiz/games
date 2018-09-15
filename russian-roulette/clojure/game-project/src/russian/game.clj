(ns russian.game)

(use 'clojure.string)
(use 'russian.gun)

(defn prompt []
  (println "Shoot? [y/N] "))


(defn take-turn [current loaded]
  (prompt)
  (let [answer (trim (read-line))]
    (cond (or (= "Y" answer) (= "y" answer)) 
          (do (println "Shooting...")
              (if (= current loaded)
                (println "Bang! You're dead.")
                (do (println "Whew! No bullet!")
                    (recur (inc current) loaded))))
          :else
          (do (println "Chicken! Game endend.")))))


(defn play [shots]
  (let [loaded (load shots)]
    (take-turn 0 loaded)))

