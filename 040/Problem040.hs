import Data.Char

takeIndex :: [Int] -> [a] -> [a]
takeIndex nx x = map (x !!) nx

main :: IO ()
main = print $ product $ take 7 $
  takeIndex (map (subtract 1) $ iterate (* 10) 1) $
  concatMap (map digitToInt . show) [1..]
