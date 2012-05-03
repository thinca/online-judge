import Data.List
import Data.Maybe

sameAll :: Eq a => [a] -> Bool
sameAll (_:[]) = True
sameAll (x:xs@(y:_)) = x == y && sameAll xs

correct :: Int -> Bool
correct n = sameAll $ take 6 $ map (\x -> sort $ show (n * x)) [1..]

main :: IO ()
main = print $ fromJust $ find correct [1..]
