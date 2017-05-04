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
		[whamlet|#{x} - #{y} = #{z}|] 
	provideJson $ object ["First" .= x,
                          "Operator" .= '-',
                          "Second" .= y,
                          "result" .= z] 
   where 
     z = x - y
