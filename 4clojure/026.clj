(fn [n]
  ((fn [fib n]
     (if (= n 0)
       (reverse fib)
       (if (< (count fib) 2)
         (recur (cons 1 fib) (dec n))
         (recur (cons (+ (first fib) (second fib)) fib) (dec n))))) '() n))
