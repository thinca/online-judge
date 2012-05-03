main :: IO ()
main = print $ maximum $ factors 600851475143 2
  where factors 1 _ = []
        factors n i =
          case divMod n i of
               (d, 0) -> i:factors d i
               _      -> factors n (i + 1)
