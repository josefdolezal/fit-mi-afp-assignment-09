{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Finance where

import Import
import Yesod.Form.Bootstrap3

financeRecordForm :: Maybe FinanceRecord -> AForm Handler FinanceRecord
financeRecordForm record = FinanceRecord
    <$> areq textField (bfs ("Description" :: Text)) (financeRecordDescription <$> record)
    <*> areq doubleField (bfs ("Amount" :: Text)) (financeRecordAmount <$> record)
    <*> areq intField (bfs ("Timestamp" :: Text)) (financeRecordTimeStamp <$> record)

getFinanceR :: Handler Html
getFinanceR = do
    (widget, _) <- generateFormPost $ renderBootstrap3 BootstrapBasicForm (financeRecordForm Nothing)
    defaultLayout $ do
        $(widgetFile "finance/new")

postFinanceR :: Handler Html
postFinanceR = do
    ((res, widget), _) <- runFormPost $ renderBootstrap3 BootstrapBasicForm (financeRecordForm Nothing)
    case res of
        FormSuccess record -> do
            _ <- runDB $ insert record
            redirect HomeR
        _ -> defaultLayout $(widgetFile "finance/new")