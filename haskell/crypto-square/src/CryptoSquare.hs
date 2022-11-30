module CryptoSquare (encode) where

import Data.Char
import qualified Data.List as L

encode :: String -> String
encode xs = unwords $ L.transpose (iterMatrix mr (normalized ++ repeat ' '))
  where
    normalized = toLower <$> filter isAlphaNum xs

    mr, mc :: Int
    (mr, mc) =
      let l = length normalized
          sq = sqrt (fromIntegral l) :: Double
       in (round sq, ceiling sq)

    iterMatrix :: Int -> String -> [String]
    iterMatrix 0 _ = []
    iterMatrix r x =
      let (h, t) = splitAt mc x
       in h : iterMatrix (r - 1) t
