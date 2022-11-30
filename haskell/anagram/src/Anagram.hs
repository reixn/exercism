module Anagram (anagramsFor) where

import Data.Char
import qualified Data.Map as M

count :: String -> M.Map Char Int
count = iter M.empty
  where
    iter m [] = m
    iter m (h : t) = iter (M.insertWith (+) h 1 m) t

anagramsFor :: String -> [String] -> [String]
anagramsFor xs =
  let lx = fmap toLower xs
      c = count lx
   in filter
        ( \s ->
            let ls = fmap toLower s
             in lx /= ls && count ls == c
        )
