(fn [sep coll]
   (rest (interleave (repeat sep) coll)))
