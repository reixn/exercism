module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = if n > 0 then Just (iter 0 n) else Nothing
  where
    iter :: Integer -> Integer -> Integer
    iter step 1 = step
    iter step v =
      if odd v
        then iter (step + 1) (3 * v + 1)
        else iter (step + 1) (v `div` 2)
