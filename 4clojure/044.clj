(fn [n coll]
  (let [n (mod n (count coll))]
    (concat (drop n coll) (take n coll))))
