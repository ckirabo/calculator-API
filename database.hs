{-# LANGUAGE OverloadedStrings          #-}

-- here is code that would have been used to be able to link to link to local host 3000:
--only fixed dummy data can be inputted.

import Control.Applicative
import Database.SQLite.Simple 
import Database.SQLite.Simple.FromRow


data DummyData = DummyData Int Int String Int Int 

instance FromRow DummyData where
   fromRow = DummyData <$> field <*> field <*> field <*> field <*> field

instance ToRow DummyData where
   toRow (DummyData eqid first operator second result) = toRow (eqid,first,operator,second,result)


main :: IO ()
main = do
    conn <- open "Kalk_DB.db"
    execute conn "INSERT INTO Kalk_Info (Equation_ID,First_Number,Operator,Second_Number,Result) VALUES (?,?,?,?,?)" (DummyData 1 1 "+" 2 3)
    close conn