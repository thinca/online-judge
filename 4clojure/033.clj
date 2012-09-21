(fn [coll n]
  (apply concat (map #(repeat n %) coll)))
