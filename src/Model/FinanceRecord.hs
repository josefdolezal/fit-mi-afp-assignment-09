module Model.FinanceRecord where

import Data.Time
import qualified Data.Text as T

type FinanceRecordId = Integer

data FinanceRecord = FinanceRecord
                   { frId           :: Integer
                   , frDescription  :: T.Text
                   , frAmount       :: Double
                   , frTimeStamp    :: Integer
                   }
