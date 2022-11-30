{-# LANGUAGE LambdaCase #-}

module Luhn (isValid) where

import Data.Char

isValid :: String -> Bool
isValid =
  maybe
    False
    ( \case
        [] -> False
        [_] -> False
        x -> luhn (reverse x) `mod` 10 == 0
    )
    . toNum
  where
    luhn :: [Int] -> Int
    luhn [] = 0
    luhn [x] = x
    luhn (x : y : xs) = x + (if y < 5 then y * 2 else y * 2 - 9) + luhn xs

    toNum :: String -> Maybe [Int]
    toNum [] = Just []
    toNum (x : xs)
      | isNumber x = fmap (digitToInt x :) (toNum xs)
      | x == ' ' = toNum xs
      | otherwise = Nothing
