(fn [coll n]
  (vals (group-by #(rem % n) coll)))
