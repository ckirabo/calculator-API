{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE DeriveGeneric #-}


import Foundation
import Yesod.Core
import Data.Aeson
import GHC.Generics
import Calc


getSqrR :: Int -> Handler TypedContent
getSqrR x = selectRep $ do
    provideRep $ defaultLayout $ do
        setTitle "Sqaure Root"
        [whamlet|# {x} = #{z}|]
    provideJson $ object ["Operator" .= '√',
                          "First" .= x,                    
                          "result" .= z]


--  where
--  z = sqrt(fromIntegral x)