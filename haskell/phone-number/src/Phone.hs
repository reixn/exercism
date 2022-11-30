module Phone (number) where

import Data.Char

number :: String -> Maybe String
number xs
  | any isAlpha xs = Nothing
  | otherwise =
      let fl = case filter isNumber xs of
            ('1' : ns) -> ns
            v -> v
          chk idx = digitToInt (fl !! idx) > 1
       in if length fl == 10 && chk 0 && chk 3
            then Just fl
            else Nothing
