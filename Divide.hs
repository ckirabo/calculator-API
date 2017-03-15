{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Divide where 

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics

-- remember to take in consideration the constraints this will have--

data Calc = Calc {
firstValue :: Int,
secondValue :: Int,
operator :: String,
result :: Int
} deriving (Generic)

instance ToJSON Calc

getDivR :: Int -> Int -> Handler TypedContent
getDivR x y = selectRep $ do
	--if x = 0 let x = "Invalid Operation"
    --    else if y = 0 then "Invalid Operation"
    	-- for if it becomes a decimal round up 
    provideRep $ defaultLayout $ do
        setTitle "Divide"
        [whamlet|#{x} / #{y} = #{z}|]
    provideJson $ z
  where
    z = x / y
    -- for if it becomes a decimal round up 

 