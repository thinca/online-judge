import Data.List
import Data.Maybe

main :: IO ()
main = print $ fromJust $ find (40755 <) combines
  where combines = triangle `common` pentagonal `common` hexagonal
        triangle   = [n * (n + 1) `div` 2     | n <- [1..]]
        pentagonal = [n * (3 * n - 1) `div` 2 | n <- [1..]]
        hexagonal  = [n * (2 * n - 1)         | n <- [1..]]
        common xx@(x:xs) yy@(y:ys) = case x `compare` y of
                               EQ -> x : common xs ys
                               LT -> common xs yy
                               GT -> common xx ys
