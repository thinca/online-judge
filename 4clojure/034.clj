(fn [from to]
  (take (- to from) (iterate inc from)))
