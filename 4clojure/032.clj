(fn [coll]
  (apply concat (map #(do [%1 %1]) coll)))
