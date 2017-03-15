{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Add where

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics

--haskell that interacts with the json side of things .. week 5 --

data Calc = Calc {
firstValue :: Int,
secondValue :: Int,
operator :: String,
result :: Int
} deriving (Generic)

instance ToJSON Calc

--getAddR already provided and used as the method to add--
-- used frame work for all other operations--
getAddR :: Int -> Int -> Handler TypedContent
getAddR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Addition"
        [whamlet|#{x} + #{y} = #{z}|]
    provideJson $ c
  where
    z = x + y
    c = Calc x y "+" z

--stack build to check it works --
-- stack exec Kalk to run it--
-- data types are to have caps on first letter--
-- type local host 3000 in browser to see if it works--