(ns pegthing.model-test
  (:require [clojure.test :refer :all]
            [pegthing.model :refer :all]))


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
