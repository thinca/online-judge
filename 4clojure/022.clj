(fn [coll]
  ((fn [coll n]
    (if (empty? coll)
      n
      (recur (next coll) (inc n)))) coll 0))
