module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (`elem` lower) alphabet
  where
    lower = fmap toLower text
    alphabet = ['a' .. 'z']
