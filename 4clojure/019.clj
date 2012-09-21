(fn [col]
  (if-let [n (next col)]
    (recur n)
    (first col)))
