isPalindrome :: Int -> Bool
isPalindrome n = reverse (show n) == show n

main :: IO ()
main = print $ maximum $ filter isPalindrome $ concat $ matrix [100..999] [100..999]
  where matrix [] l = []
        matrix (n:ns) l = map (* n) l : matrix ns l
