import Data.List
import Data.Function

-- Suits
data Suit = Club | Diamond | Heart | Spade deriving (Eq, Ord)

instance Show Suit where
  show Club = "C"
  show Diamond = "D"
  show Heart = "H"
  show Spade = "S"

instance Read Suit where
  readsPrec _ = readSuit
                where readSuit ('C':xs) = [(Club, xs)]
                      readSuit ('D':xs) = [(Diamond, xs)]
                      readSuit ('H':xs) = [(Heart, xs)]
                      readSuit ('S':xs) = [(Spade, xs)]
                      readSuit _ = []


-- Values
data Value = N2 | N3 | N4 | N5 | N6 | N7 | N8 | N9 | N10 | Jack | Queen | King | Ace deriving (Eq, Ord, Enum)

instance Show Value where
  show N2 = "2"
  show N3 = "3"
  show N4 = "4"
  show N5 = "5"
  show N6 = "6"
  show N7 = "7"
  show N8 = "8"
  show N9 = "9"
  show N10 = "T"
  show Jack = "J"
  show Queen = "Q"
  show King = "K"
  show Ace = "A"

instance Read Value where
  readsPrec _ = readValue
                where readValue ('2':xs) = [(N2, xs)]
                      readValue ('3':xs) = [(N3, xs)]
                      readValue ('4':xs) = [(N4, xs)]
                      readValue ('5':xs) = [(N5, xs)]
                      readValue ('6':xs) = [(N6, xs)]
                      readValue ('7':xs) = [(N7, xs)]
                      readValue ('8':xs) = [(N8, xs)]
                      readValue ('9':xs) = [(N9, xs)]
                      readValue ('T':xs) = [(N10, xs)]
                      readValue ('J':xs) = [(Jack, xs)]
                      readValue ('Q':xs) = [(Queen, xs)]
                      readValue ('K':xs) = [(King, xs)]
                      readValue ('A':xs) = [(Ace, xs)]
                      readValue _ = []


-- Card
data Card = Card {cardValue :: Value, cardSuit :: Suit} deriving (Eq, Ord)

instance Show Card where
  show (Card v s) = show v ++ show s

instance Read Card where
  readsPrec _ = readCard
                where readCard (v:s:xs) = [(Card (read [v]) (read [s]), xs)]
                      readCard _ = []


-- Card in hand
data Hand = Hand Card Card Card Card Card deriving (Eq, Show)

instance Read Hand where
  readsPrec _ = readHand
                where readHand s = case map read $ words s of
                                        [c1, c2, c3, c4, c5] -> [(Hand c1 c2 c3 c4 c5, "")]
                                        otherwise            -> []


-- Pat
data Pat = HighCard | OnePair | TwoPairs | ThreeOfAKind | Straight | Flush | FullHouse | FourOfAKind | StraightFlush | RoyalFlush deriving (Show, Eq, Ord, Enum)
data Rank = Rank {rankPat :: Pat, inPat :: Maybe Value, outPat :: Maybe Value} deriving (Show, Eq, Ord)

judge :: Hand -> Rank
judge (Hand c1 c2 c3 c4 c5) = j $ sort [c1, c2, c3, c4, c5]
  where j cards = if isStraight cards
                     then
                     if isFlush cards
                        then
                        if cardValue (head cards) == N10
                           then Rank RoyalFlush (Just N10) Nothing
                           else Rank StraightFlush (lastValue cards) Nothing
                        else Rank Straight (lastValue cards) Nothing
                     else
                     if isFlush cards
                        then Rank Flush (lastValue cards) Nothing
                        else
                        let groups  = groupBy (\a b -> cardValue a == cardValue b) cards
                            singles = concat $ filter ((1 ==) . length) groups
                            sames   = maximumBy (compare `on` length) groups -- maximumBy selects last one.
                            in case length sames of
                                    4 -> Rank FourOfAKind (lastValue sames) (lastValue singles)
                                    3 -> if length groups == 2
                                            then Rank FullHouse (lastValue sames) Nothing
                                            else Rank ThreeOfAKind (lastValue sames) (lastValue singles)
                                    2 -> if length groups == 3
                                            then Rank TwoPairs (lastValue sames) (lastValue singles)
                                            else Rank OnePair (lastValue sames) (lastValue singles)
                                    otherwise -> Rank HighCard Nothing (lastValue cards)

        lastValue cards = Just (cardValue $ last cards)

        isStraight cards = all (== 1) $ map (\(a, b) -> fromEnum (cardValue b) - fromEnum (cardValue a)) $ zip cards $ tail cards
        isFlush = (== 1) . length . nub . map cardSuit


main :: IO ()
main = do text <- readFile "poker.txt"
          print $ length $ filter (== GT) $ map cardsToResult $ lines text
  where cardsToResult = duel . splitAt 5 . words
        duel (p1, p2) = toRank p1 `compare` toRank p2
        toRank = judge . read . unwords
