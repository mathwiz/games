(ns game-proj.core
  (:gen-class))

(use 'game-proj.controller)

(defn -main
  [& args]
  (do (println "Welcome to Craps!")
      (play)))
