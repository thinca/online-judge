import Data.List
import Data.Maybe

triangle :: [Int]
triangle = map (\n -> n * (n + 1) `div` 2) [1..]

square :: [Int]
square = map (\n -> n * n) [1..]

pentagonal :: [Int]
pentagonal = map (\n -> n * (3 * n - 1) `div` 2) [1..]

hexagonal :: [Int]
hexagonal = map (\n -> n * (2 * n - 1)) [1..]

heptagonal :: [Int]
heptagonal = map (\n -> n * (5 * n - 3) `div` 2) [1..]

octagonal :: [Int]
octagonal = map (\n -> n * (3 * n - 2)) [1..]


figurates :: [[Int]]
figurates = [triangle, square, pentagonal, hexagonal, heptagonal, octagonal]


digits :: Int -> Int
digits = length . show

fourDigit :: [Int] -> [Int]
fourDigit = dropWhile (\n -> digits n < 4) . takeWhile (\n -> digits n <= 4)

fourDigits :: [[Int]]
fourDigits = map fourDigit figurates

splitDigit :: Int -> (String, String)
splitDigit = splitAt 2 . show

isChain :: Int -> Int -> Bool
isChain n m = (snd . splitDigit) n == (fst . splitDigit) m


search :: [[Int]] -> [[Int]]
search (x:xs) = s x xs []
  where s yy [] res = map (:res) $ filter (\y -> isChain y (last res)) yy
        s yy zz@(z:zs) res = concatMap (\y -> s (filter (isChain y) z) zs (y:res)) yy

combi :: Eq a => [[a]] -> [[a]]
combi xx@((x:_):_) = filter (\(y:_) -> x == y) xx

result = find (not . null) $ concatMap search $ combi $ permutations fourDigits


main :: IO ()
main = print $ sum $ fromJust result
