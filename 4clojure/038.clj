(fn [& coll] (reduce #(if (> %1 %2) %1 %2) coll))
