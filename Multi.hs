{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Multi where

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics

--haskell that interacts with the json side of things .. week 5 --
data Calculator = Calculator{
firstNumber :: Int,
secondNumber :: Int,
operator :: String,
result :: Int    
}deriving (Generic)

instance ToJSON Calculator

--getAddR already provided and used as the method to add--
-- used frame work for all other operations--
getMultiR :: Int -> Int -> Handler TypedContent
getMultiR x y = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Multiplication"
        [whamlet|#{x} * #{y} = #{z}|]
    provideJson $ c
  where
    z = x * y
    c = Calculator x y "*" z

--stack build to check it works --
-- stack exec Kalk to run it--
-- data types are to have caps on first letter--
-- type local host 3000 in browser to see if it works--