(ns game-proj.core-test
  (:require [clojure.test :refer :all]
            [game-proj.core :refer :all]
            [game-proj.controller :refer :all]))

(deftest display-test
  (testing "display."
    (do (display)
        true)))
