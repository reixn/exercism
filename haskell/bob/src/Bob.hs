{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import Data.Char
import Data.Text (Text)
import qualified Data.Text as T

responseFor :: Text -> Text
responseFor xs
  | isQuestion && isYell = "Calm down, I know what I'm doing!"
  | isQuestion = "Sure."
  | isYell = "Whoa, chill out!"
  | not (T.any isAlphaNum xs) = "Fine. Be that way!"
  | otherwise = "Whatever."
  where
    stripped = T.strip xs
    isQuestion = not (T.null stripped) && T.last stripped == '?'
    isYell = let f = T.filter isAlpha xs in not (T.null f) && T.all isUpper f
