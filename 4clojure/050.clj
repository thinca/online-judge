(fn [coll]
  (vals (reduce
          (fn [m v]
            (update-in m [(type v)] #(do (if (nil? %) [v] (conj % v)))))
          {} coll)))
