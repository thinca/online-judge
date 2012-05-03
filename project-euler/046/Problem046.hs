import Data.List
import Data.Maybe

twice_square_numbers :: [Int]
twice_square_numbers = [x * x * 2 | x <- [1..]]

prime_numbers :: [Int]
prime_numbers = 2:f [3] [3,5..]
    where f (x:xs) ys = let (ps, qs) = span (< x^2) ys
                        in  ps ++ f (xs ++ ps) [z | z <- qs, mod z x /= 0]

odd_composite_numbers :: [Int]
odd_composite_numbers = [3, 5..] `sub` prime_numbers
  where sub xx@(x:xs) yy@(y:ys) = case x `compare` y of
                                       EQ -> sub xs ys
                                       LT -> x : sub xs yy
                                       GT -> sub xx ys

main :: IO ()
main = print $ fromJust $ find unexpected odd_composite_numbers
  where unexpected n = find (== n) [sq + pr |
          sq <- takeWhile (< n) twice_square_numbers,
          pr <- takeWhile (< n) prime_numbers] == Nothing
