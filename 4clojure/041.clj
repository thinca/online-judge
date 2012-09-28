(fn [coll i]
        (vec (flatten (map #((if (= i (count %)) drop-last identity) %) (partition-all i coll)))))
