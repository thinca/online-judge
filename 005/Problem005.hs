main :: IO ()
main = print $ foldl1 lcm [2..20]
