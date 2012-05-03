main :: IO()
main = print $ sum $ filter (\e -> e `mod` 3 == 0 || e `mod` 5 == 0) [1..1000]
