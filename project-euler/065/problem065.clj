(defn list2approximation [coll]
  ((fn [coll sum]
     (if (empty? coll)
       sum
       (recur (next coll) (+ (first coll) (/ 1 sum))))) (next coll) (first coll)))

(defn e []
  (conj (apply concat (map #(do [1 % 1]) (iterate #(+ 2 %) 2))) 2))

(defn problem065 []
  (reduce
    #(+ %1 (Character/digit %2 10))
    0
    (str (numerator (list2approximation (reverse (take 100 (e))))))))

(print (problem065))
