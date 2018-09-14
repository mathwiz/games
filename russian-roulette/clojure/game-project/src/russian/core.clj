(ns russian.core
  (:gen-class))

(use 'clojure.string)

(defn prompt []
  (println "Shoot? [y/N] "))

(defn load [shots]
  (rand-int (Integer/parseInt shots)))

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

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (do (println "Welcome to Russian Roulette!")
      (println (str "Shooting up to " (first args) " shots."))
      (play (first args))))
