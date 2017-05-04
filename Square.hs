{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}

module Square where 

import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc


getSquareR :: Int -> Handler TypedContent
getSquareR x = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Square"
        [whamlet|#{x} * #{x} = #{z}|]
    provideJson $ object ["First" .= x,
                          "Operator" .= '*',
                          "Second" .= x,
                          "result" .= z] 
  where
    z = x * x 
    