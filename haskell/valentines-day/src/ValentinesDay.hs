module ValentinesDay where

-- Define the function and required algebraic data types (ADT) below.

data Approval
  = Yes
  | No
  | Maybe

data Cuisine = Korean | Turkish

data Genre
  = Crime
  | Horror
  | Romance
  | Thriller

data Activity
  = BoardGame
  | Chill
  | Movie Genre
  | Restaurant Cuisine
  | Walk Int

rateActivity :: Activity -> Approval
rateActivity BoardGame = No
rateActivity Chill = No
rateActivity (Movie Romance) = Yes
rateActivity (Movie _) = No
rateActivity (Restaurant Korean) = Yes
rateActivity (Restaurant Turkish) = Maybe
rateActivity (Walk d)
  | d < 3 = Yes
  | d <= 5 = Maybe
  | otherwise = No
