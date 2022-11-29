module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right []
toRNA (x : xs) =
  let trans c = fmap (c :) (toRNA xs)
   in case x of
        'G' -> trans 'C'
        'C' -> trans 'G'
        'T' -> trans 'A'
        'A' -> trans 'U'
        c -> Left c
