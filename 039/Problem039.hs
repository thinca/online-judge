import Data.List
import Data.Maybe

isRightTriangle :: Int -> Int -> Int -> Bool
isRightTriangle a b c = a ^ 2 + b ^ 2 == c ^ 2

maximumIndex :: Ord a => [a] -> Maybe Int
maximumIndex x = elemIndex (maximum x) x

main :: IO ()
main = print $ fromJust $ maximumIndex $ map (length . triPiece) [0..1000]
  where triPiece n = [0 |
          a <- [1..n-2],
          b <- [1..n-a-1],
          c <- [n-a-b],
          a <= b,
          a <= c && b <= c,
          isRightTriangle a b c]
