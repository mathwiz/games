(ns pegthing.controller)

(use 'pegthing.model 'pegthing.view)

(declare prompt-move user-entered-valid-move user-entered-invalid-move game-over prompt-rows)


(defn get-input "Waits for user to enter text and hit enter, then cleans the input" ([] 
                                                                                     (get-input
                                                                                      nil)) 
  ([default] 
   (let [input (clojure.string/trim (read-line))] 
     (if (empty? input) default (clojure.string/lower-case input)))))


(defn characters-as-strings [input] 
  (re-seq #"[a-zA-Z]" input))


(defn prompt-move [board] 
  (println "\nHere is your board:") 
  (print-board board) 
  (println "Move from where to where? Enter two letters:") 
  (let [input (map letter->pos (characters-as-strings (get-input)))] 
    (if-let [new-board (make-move board (first input) 
                                  (second input))] 
      (user-entered-valid-move new-board) 
      (user-entered-invalid-move board))))


(defn user-entered-invalid-move "Handles the next step after a user has entered an invalid move"
  [board] 
  (println "\n!!! That was an invalid move: \n") 
  (prompt-move board))


(defn user-entered-valid-move "Handles the next step after a user has entered a valid move" [board] 
  (if (can-move? board) 
    (prompt-move board) 
    (game-over board)))


(defn game-over "Announce the game is over and prompt to play again" [board] 
  (let [remaining-pegs (count (filter :pegged (vals board)))] 
    (println "Game over! You had" remaining-pegs "pegs left:") 
    (print-board board) 
    (println "Play again? y/n [y]") 
    (let [input (get-input "y")] 
      (if (= "y" input) 
        (prompt-rows) 
        (do (println "Bye!") 
            (System/exit 0))))))


(defn prompt-empty-peg [board] 
  (println "Here is your board:") 
  (print-board board) 
  (println "Remove which peg? [e]") 
  (prompt-move (remove-peg board (letter->pos (get-input "e")))))


(defn prompt-rows [] 
  (println "How many rows? [5]") 
  (let [rows (Integer. (get-input 5)) board (new-board rows)] 
    (prompt-empty-peg board)))
