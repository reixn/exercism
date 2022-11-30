module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n < 1 = Nothing
  | otherwise =
      Just
        ( case compare (factorSum 1 0 - n) n of
            EQ -> Perfect
            LT -> Deficient
            GT -> Abundant
        )
  where
    factorSum i s
      | i * i > n = s
      | otherwise =
          let (q, r) = n `divMod` i
           in if r == 0
                then (if q == i then s + q else factorSum (i + 1) (s + i + q))
                else factorSum (i + 1) s
