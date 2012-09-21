(fn [coll]
  ((fn [coll rev]
     (if (empty? coll)
       rev
       (recur (next coll) (cons (first coll) rev)))) coll []))
