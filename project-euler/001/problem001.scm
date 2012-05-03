(display (let loop ((n 999) (sum 0))
           (if (<= n 0)
             sum
             (loop (- n 1) (+ (if (or (= (remainder n 3) 0) (= (remainder n 5) 0)) n 0) sum)))))

