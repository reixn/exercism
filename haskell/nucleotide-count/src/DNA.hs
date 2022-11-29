module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map)
import qualified Data.Map as M

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right (M.fromList [(A, 0), (C, 0), (G, 0), (T, 0)])
nucleotideCounts (x : xs) =
  let iter n = fmap (M.insertWith (+) n 1) (nucleotideCounts xs)
   in case x of
        'A' -> iter A
        'C' -> iter C
        'G' -> iter G
        'T' -> iter T
        _ -> Left "error"
