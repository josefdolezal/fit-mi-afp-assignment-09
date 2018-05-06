{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.FinanceRecord where

import Import
import Yesod.Form.Bootstrap3
import Handler.Finance

getFinanceRecordR :: FinanceRecordId -> Handler Html
getFinanceRecordR recordId = do
    record <- runDB $ get404 recordId
    (widget, _) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm (financeRecordForm $ Just record)
    defaultLayout $(widgetFile "finance/update")

postFinanceRecordR :: FinanceRecordId -> Handler Html
postFinanceRecordR recordId = do
    record <- runDB $ get404 recordId
    ((res, widget), _) <- runFormPost $ renderBootstrap3 BootstrapBasicForm (financeRecordForm $ Just record)
    case res of
        FormSuccess updatedRecord -> do
            runDB $ replace recordId updatedRecord
            redirect (FinanceRecordR recordId)
        _ -> defaultLayout $(widgetFile "finance/update")

deleteFinanceRecordR :: FinanceRecordId -> Handler Html
deleteFinanceRecordR recordId = do
    runDB $ delete recordId
    redirect HomeR