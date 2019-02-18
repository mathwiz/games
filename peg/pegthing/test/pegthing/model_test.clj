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

