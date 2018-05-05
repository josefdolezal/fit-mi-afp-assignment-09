{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FinanceRecord where

import Import
import Model.FinanceRecord

getFinanceRecordR :: FinanceRecordId -> Handler Html
getFinanceRecordR id = defaultLayout $ do
    let record = (FinanceRecord id "a" 1 1)
    $(widgetFile "finance")

putFinanceRecordR :: FinanceRecordId -> Handler Html
putFinanceRecordR id = defaultLayout $ do
    redirect (FinanceRecordR id)

deleteFinanceRecordR :: FinanceRecordId -> Handler Html
deleteFinanceRecordR id = defaultLayout $ do
    redirect (FinanceRecordR id)