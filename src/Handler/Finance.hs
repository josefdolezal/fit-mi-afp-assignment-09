{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Finance where

import Import
import Yesod.Form.Bootstrap3

financeRecordForm :: AForm Handler FinanceRecord
financeRecordForm = FinanceRecord
    <$> areq textField (bfs ("Description" :: Text)) Nothing
    <*> areq doubleField (bfs ("Amount" :: Text)) Nothing
    <*> areq intField (bfs ("Timestamp" :: Text)) Nothing

getFinanceR :: Handler Html
getFinanceR = do
    (widget, _) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm financeRecordForm
    defaultLayout $ do
        $(widgetFile "finance/new")

postFinanceR :: Handler Html
postFinanceR = do
    ((res, widget), _) <- runFormPost $ renderBootstrap3 BootstrapBasicForm financeRecordForm
    case res of
        FormSuccess record -> do
            _ <- runDB $ insert record
            redirect HomeR
        _ -> defaultLayout $(widgetFile "finance/new")