module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
  | n < 1 = Nothing
  | otherwise = Just (filter isPrime [2 ..] !! (n - 1))
  where
    isPrime x =
      let iter i =
            i * i > x
              || (x `mod` i /= 0 && iter (i + 1))
       in iter 2
