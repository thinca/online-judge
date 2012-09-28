(fn [c1 c2]
  ((fn [c1 c2 result]
    (if (or (empty? c1) (empty? c2))
      (reverse result)
      (recur (next c1) (next c2) (cons (first c2) (cons (first c1) result))))) c1 c2 []))
