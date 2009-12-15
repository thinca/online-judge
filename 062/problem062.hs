import Data.List

cubes :: [Integer]
cubes = [x ^ 3 | x <- [1..]]

lists :: [(Integer, String)]
lists = map (\x -> (x, sort $ show x)) cubes

main :: IO ()
main = print $ fst $ last $ head $ dropWhile (\x -> 5 /= length x) $ map (heads . reverse) $ inits lists
  where heads [] = []
        heads xx@((_, x):_) = filter (\(_, y) -> y == x) xx
