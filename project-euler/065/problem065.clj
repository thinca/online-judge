(defn list2approximation [coll]
  (loop [c (next coll)
         sum (first coll)]
    (if (empty? c)
      sum
      (recur (next c) (+ (first c) (/ 1 sum))))))

(def e (conj (apply concat (map #(do [1 % 1]) (iterate #(+ 2 %) 2))) 2))

(defn problem065 []
  (apply + (map #(Character/digit % 10) (str (numerator (list2approximation (reverse (take 100 e))))))))

(print (problem065))
