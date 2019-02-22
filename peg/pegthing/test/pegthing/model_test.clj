(ns pegthing.model-test
  (:require [clojure.test :refer :all]
            [pegthing.model :refer :all]))


(def Board6
  {:rows 3,
   1     {:pegged true, :connections {6 3, 4 2}}
   2     {:pegged true}
   3     {:pegged true}
   4     {:pegged true, :connections {1 2, 6 5}}
   5     {:pegged true}
   6     {:pegged true, :connections {1 3, 4 5}}})


(deftest tri-test
  (testing "Triangular numbers."
           (is (= (take 1 tri) '(1)))
           (is (= (take 5 tri) '(1 3 6 10 15)))))

(deftest triangular?-test
  (testing "Test if a triangular number."
           (is (triangular? 6))
           (is (not (triangular? 5)))))


(deftest row-tri-test
  (testing "Test row-tri."
           (is (= (row-tri 1) 1))
           (is (= (row-tri 2) 3))
           (is (= (row-tri 3) 6))))


(deftest row-num-test
  (testing "Test row-num."
           (is (= (row-num 1) 1))
           (is (= (row-num 2) 2))
           (is (= (row-num 5) 3))))


(deftest connect-test
  (testing "Test connect."
           (is (= (connect {} 15 1 2 4) '{1 {:connections {4 2}} 4 {:connections {1 2}}}))
           (is (= (connect {} 10 3 5 9) '{3 {:connections {9 5}} 9 {:connections {3 5}}}))))


(deftest connection-making-test
  (testing "Test making connections."
           (is
            (= (connect-right {} 15 8) '{8 {:connections {10 9}} 10 {:connections {8 9}}}))
           (is
            (= (connect-down-left {} 15 1) '{1 {:connections {4 2}} 4 {:connections {1 2}}}))
           (is
            (= (connect-down-right {} 15 3) '{3 {:connections {10 6}} 10 {:connections {3 6}}}))))


(deftest add-pos-test
  (testing "Test adding a position to board"
           (is
            (= (add-pos {} 15 1)
               '{1 {:connections {6 3, 4 2}, :pegged true}
                 4 {:connections {1 2}}
                 6 {:connections {1 3}}}))))


(deftest new-board-test
  (testing "Test creating a board"
           (is
            (= (new-board 3)
               Board6))))


(deftest moving-pegs-test
  (testing "Test moving pegs"
           (let [initial  Board6
                 removed  (remove-peg (remove-peg Board6 5) 1)
                 moved    (move-peg removed 4 1)]
             (is (pegged? initial 5))
             (is (pegged? initial 2))
             (is (not (pegged? removed 5)))
             (is (not (pegged? removed 1)))
             (is (pegged? (place-peg removed 5) 5))
             (is (pegged? moved 1))
             (is (not (pegged? moved 4))))))

