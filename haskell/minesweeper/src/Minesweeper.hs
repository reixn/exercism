{-# LANGUAGE LambdaCase #-}

module Minesweeper (annotate) where

import Data.Char (intToDigit)

annotate :: [String] -> [String]
annotate =
  showBoard
    . (\b -> let cnt = count b in zipWith zip b cnt)
    . readBoard
  where
    zipAdjWith :: (a -> a -> a) -> a -> [a] -> [a]
    zipAdjWith f empty h = zipWith f h (zipWith f (empty : init h) (tail h ++ [empty]))

    readBoard :: [String] -> [[Int]]
    readBoard = fmap (fmap (\i -> if i == '*' then 1 else 0))

    showBoard :: [[(Int, Int)]] -> [String]
    showBoard =
      fmap
        ( fmap
            ( \case
                (1, _) -> '*'
                (_, 0) -> ' '
                (_, v) -> intToDigit v
            )
        )

    count :: [[Int]] -> [[Int]]
    count =
      zipAdjWith (zipWith (+)) (repeat 0)
        . fmap (zipAdjWith (+) 0)
