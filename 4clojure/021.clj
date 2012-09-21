(fn [coll index]
  (if (= index 0)
    (first coll)
    (recur (next coll) (- index 1))))
