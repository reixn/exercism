{-# LANGUAGE MultiWayIf #-}

module Acronym (abbreviate) where

import Data.Char
import Data.Text (Text)
import qualified Data.Text as T

abbreviate :: Text -> Text
abbreviate =
  T.concat
    . fmap
      ( \t ->
          if
              | T.all isUpper t -> T.singleton (T.head t)
              | T.all isLower t -> T.singleton (toUpper (T.head t))
              | otherwise -> T.filter isUpper t
      )
    . filter (not . T.null)
    . T.split (\c -> c == '-' || c == ' ')