{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Sub where 

import Foundation 
import Yesod.Core
import Data.Aeson
import GHC.Generics

--haskell that interacts with the json side of things .. week 5 --
data Calcs = Calcs{
 firstValue :: Int,
 secondValue :: Int, 
 operator :: String,
 result :: Int	
}deriving (Generic)

instance ToJSON Calcs

getSubR :: Int -> Int -> Handler TypedContent 
getSubR x y = selectRep $ do 
	provideRep $ defaultLayout $ do 
		setTitle "Subtraction"
		[whamlet|#{x} - #{y} = #{z}|] --html presentation of method--
	provideJson $ c --json representation--
   where 
     z = x - y
     c = Calcs x y "-" z 

--to add a new module drag the Kalk.cabal file and edit it--
--adding the module name to the list--     
