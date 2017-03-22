{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Sub where 

import Foundation 
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc

getSubR :: Int -> Int -> Handler TypedContent 
getSubR x y = selectRep $ do 
	provideRep $ defaultLayout $ do 
		setTitle "Subtraction"
		[whamlet|#{x} - #{y} = #{z}|] --html presentation of method--
	provideJson $ object ["First" .= x,
                          "Operator" .= '-',
                          "Second" .= y,
                          "result" .= z] --json representation--
   where 
     z = x - y

--to add a new module drag the Kalk.cabal file and edit it--
--adding the module name to the list--     
