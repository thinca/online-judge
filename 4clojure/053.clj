(fn [coll]
  (loop [coll coll
         [longest current] [(empty coll) '()]]
    (prn coll longest current)
    (if (empty? coll)
      (let [longest (if (< (count longest) (count current)) current longest)]
        (if (< 1 (count longest))
          (reverse longest)
          []))
      (let [v (first coll)]
        (recur (next coll)
               (cond
                 (or (empty? current) (= v (inc (first current))))
                 [longest (cons v current)]

                 (< (count longest) (count current))
                 [current (list v)]

                 :else
                 [longest '()]))))))
