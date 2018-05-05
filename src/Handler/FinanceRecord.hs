{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FinanceRecord where

import Import
import Model.FinanceRecord

getFinanceRecordR :: Handler Html
getFinanceRecordR = defaultLayout $ do
    let records = [(FinanceRecord 1 "a" 100 1), (FinanceRecord 2 "b" 200 2)] :: [FinanceRecord]
    $(widgetFile "homepage")

putFinanceRecordR :: Handler Html
putFinanceRecordR = defaultLayout $ do
    let records = [] :: [FinanceRecord]
    $(widgetFile "homepage")

deleteFinanceRecordR :: Handler Html
deleteFinanceRecordR = defaultLayout $ do
    let records = [] :: [FinanceRecord]
    $(widgetFile "homepage")