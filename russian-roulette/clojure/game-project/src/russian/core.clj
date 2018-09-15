(ns russian.core
  (:gen-class))

(use 'russian.game)

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (do (println "Welcome to Russian Roulette!")
      (println (str "Shooting up to " (first args) " shots."))
      (play (first args))))
