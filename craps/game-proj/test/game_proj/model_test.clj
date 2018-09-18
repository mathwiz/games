(ns game-proj.model-test
  (:require [clojure.test :refer :all]
            [game-proj.core :refer :all]
            [game-proj.model :refer :all]))


(deftest roll-test
  (testing "roll."
    (let [sum (roll-dice 2 0)] 
      (is (and (> sum 1) (< sum 13))))))

(deftest update-state-test
  (testing "update-state"
    (let [model (get-model)]
      (is (and
           (update-state {:roll 3 :should-end true :result 7})
           (= (count State) 3)
           (= (get (get-model) :roll) 3)
           (= (get (get-model) :should-end true))
           (= (get (get-model) :result 7))
           )))))

(deftest action-test
  (testing "action-test"
    (let [model (action 'foo)]
      (is (and
           (roll-result))))))

