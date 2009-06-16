revNum :: Integer -> Integer
revNum = read . reverse . show

isPalindromic :: Integer -> Bool
isPalindromic n = n == revNum n

isLychrel :: Integer -> Bool
isLychrel = isL 50
  where isL 0 _ = True
        isL r n = let next = n + revNum n
                      in (not . isPalindromic) next && isL (r - 1) next

main :: IO ()
main = print $ length $ filter isLychrel [0..9999]
