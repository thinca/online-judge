combination :: Integer -> Integer -> Integer
combination n r = fact n `div` (fact r * fact (n - r))
  where fact n = product [1..n]

main :: IO ()
main = print $ length $ filter (1000000 <=) $ [combination n r | n <- [1..100], r <- [1..n]]
