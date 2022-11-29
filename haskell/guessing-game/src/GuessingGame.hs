module GuessingGame (reply) where

reply :: Int -> String
reply n
  | n == 42 = "Correct"
  | n == 41 || n == 43 = "So close"
  | n < 41 = "Too low"
  | n > 43 = "Too high"
