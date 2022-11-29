module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = iter 0 1
  where
    factors' = filter (> 0) factors
    check n f = n `mod` f == 0
    iter s n
      | n >= limit = s
      | any (check n) factors' = iter (s + n) (n + 1)
      | otherwise = iter s (n + 1)
