USE [SLCCORIC]

/*MARIA*/
insert into Parameters.Field VALUES
('ProductID','Product ID in the Product table','ProductId',GETDATE(),NULL,'', 1,'Varchar',NULL,''),
('PeriodDate','Date of Period','PeriodDate',GETDATE(),NULL,'yyyy-MM-dd',1,'Date',NULL,''),
('AdhocFlag','Massive or not','AdhocFlag',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('LineofBusinessCode','Line of business code','LineofBusinessCode',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('SortOrder','Field Order','SortOrder',GETDATE(),NULL,'',1,'Int',NULL,''),
('EquityFlag','Equity Flag','EquityFlag',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('CUSIP','BBG ID','CUSIP',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('SecurityType','Type of Security','SecurityType',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('StateCode','Code of State','StateCode',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('DateAcquired','Adquisition Date','DateAcquired',GETDATE(),NULL,'yyyy-MM-dd',1,'Date',NULL,''),
('Quantity','Quantity','Quantity',GETDATE(),NULL,'',1,'Double',NULL,''),
('Field_Description','CUSIP Field_Description','Field_Description',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('Coupon','Coupon Value','Coupon',GETDATE(),NULL,'',1,'Double',NULL,''),
('EffectiveMaturity','Maturity Date','MaturityDate',GETDATE(),NULL,'yyyy-MM-dd',1,'Date',NULL,''),
('MaturityDate','MaturityDate','MaturityDate',GETDATE(),NULL,'yyyy-MM-dd',1,'Date',NULL,''),
('OriginalCost','Original Cost','OriginalCost',GETDATE(),NULL,'',1,'Double',NULL,''),
('BookValue','Book Value','BookValue',GETDATE(),NULL,'',1,'Double',NULL,''),
('MarketValue','Market Value','MarketValue',GETDATE(),NULL,'',1,'Double',NULL,''),
('UnrealizedGainLoss','UnrealizedGainLoss','UnrealizedGainLoss',GETDATE(),NULL,'',1,'Double',NULL,''),
('BookYield','BookYield','BookYield',GETDATE(),NULL,'',1,'Double',NULL,''),
('MarketYield','MarketYield','MarketYield',GETDATE(),NULL,'',1,'Double',NULL,''),
('EffectiveDuration','EffectiveDuration','EffectiveDuration',GETDATE(),NULL,'yyyy-MM-dd',1,'Date',NULL,''),
('Convexity','Convexity','Convexity',GETDATE(),NULL,'',1,'Double',NULL,''),
('SAndP','Standard And Poors','SAndP',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('Moody','Moodys','Moodys',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('NAICRating','NAICRating','NAICRating',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('InternalRating','InternalRating','InternalRating',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('Ticker','Ticker','Ticker',GETDATE(),NULL,'',1,'Varchar',NULL,''),
('ClosingPrice','ClosingPrice','ClosingPrice',GETDATE(),NULL,'',1,'Double',NULL,''),
('AcquiredIncome','AcquiredIncome','AcquiredIncome',GETDATE(),NULL,'',1,'Double',NULL,'')

/*REPORTFILE*/
INSERT INTO Parameters.ReportFile VALUES ('USTR_Holdings_MTH_{Period}_{GenerationDate}.csv','Holdings report','\\sunlifecorp.com\dfsslc\RL\Reports\CORIC\',2,1,NULL,NULL,'Horizontal')
/**/


 /*CRISTIAN*/

--Field
GO
INSERT Parameters.Field VALUES (N'GainOrLoss', N'GainOrLoss', N'GainOrLoss', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'PreTaxBookYield', N'PreTaxBookYield', N'PreTaxBookYield', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtGainNumber', N'SecuritiesAtGainNumber', N'SecuritiesAtGainNumber', GETDATE(), NULL, NULL, 1, N'Integer', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtGainAmount', N'SecuritiesAtGainAmount', N'SecuritiesAtGainAmount', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtLossNumber', N'SecuritiesAtLossNumber', N'SecuritiesAtLossNumber', GETDATE(), NULL, NULL, 1, N'Integer', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtLossAmount', N'SecuritiesAtLossAmount', N'SecuritiesAtLossAmount', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'Weight', N'Weight', N'Weight', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkWeight', N'BenchmarkWeight', N'BenchmarkWeight', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkCoupon', N'BenchmarkCoupon', N'BenchmarkCoupon', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'YTW', N'YTW', N'YTW', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkYTW', N'BenchmarkYTW', N'BenchmarkYTW', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'ModifiedDuration', N'ModifiedDuration', N'ModifiedDuration', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkModifiedDuration', N'BenchmarkModifiedDuration', N'BenchmarkModifiedDuration', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkConvexity', N'BenchmarkConvexity', N'BenchmarkConvexity', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'DailyReturn', N'DailyReturn', N'DailyReturn', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkDailyReturn', N'BenchmarkDailyReturn', N'BenchmarkDailyReturn', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'MTD', N'MTD', N'MTD', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkMTD', N'BenchmarkMTD', N'BenchmarkMTD', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'QTD', N'QTD', N'QTD', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkQTD', N'BenchmarkQTD', N'BenchmarkQTD', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'YTD', N'YTD', N'YTD', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'CummReturn', N'CummReturn', N'CummReturn', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkCummReturn', N'BenchmarkCummReturn', N'BenchmarkCummReturn', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkBookYield', N'BenchmarkBookYield', N'BenchmarkBookYield', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkMarketYield', N'BenchmarkMarketYield', N'BenchmarkMarketYield', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkEffectiveDuration', N'BenchmarkEffectiveDuration', N'BenchmarkEffectiveDuration', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecurityGroup', N'SecurityGroup', N'SecurityGroup', GETDATE(), NULL, NULL, 1, N'Varchar', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'PreTaxMarketYield', N'PreTaxMarketYield', N'PreTaxMarketYield', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkYTD', N'BenchmarkYTD', N'BenchmarkYTD', GETDATE(), NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO

--ReportFile
INSERT INTO Parameters.ReportFile VALUES 
('USTR_PortfolioStats_MTH_{Period}_{GenerationDate}.csv', 'PortfolioStats report', '\\sunlifecorp.com\dfsslc\RL\Reports\CORIC\', 6, 1, NULL, NULL, 'Horizontal')

 
 
 /**/
update Parameters.Field set Field_NameInDB = 'Description', Field_Description= 'CUSIP Description', Field_NameInExcel ='Description' where Field_Id = 13

 /*GABRIEL*/
--FIELDS
INSERT Parameters.Field VALUES 

(N'TaxType', 'TaxType', N'TaxType', GETDATE(), NULL, NULL, 1, N'varchar', NULL, 'Product'),
(N'BenchmarkFlag', 'BenchmarkFlag', N'BenchmarkFlag', GETDATE(), NULL, NULL, 1, N'varchar', NULL, 'Product'),
(N'PerformanceType', 'PerformanceType', N'PerformanceType', GETDATE(), NULL, NULL, N'varchar', 1, NULL, 'Product'),
(N'OneYear', 'OneYear', N'OneYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorTwoYear', 'PriorTwoYear', N'PriorTwoYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorThreeYear', 'PriorThreeYear', N'PriorThreeYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorFourYear', 'PriorFourYear', N'PriorFourYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorFiveYear', 'PriorFiveYear', N'PriorFiveYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorSevenYear', 'PriorSevenYear', N'PriorSevenYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorTenYear', 'PriorTenYear', N'PriorTenYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorYear', 'CYPriorYear', N'CYPriorYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorTwoYear', 'CYPriorTwoYear', N'CYPriorTwoYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorThreeYear', 'CYPriorThreeYear', N'CYPriorThreeYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorFourYear', 'CYPriorFourYear', N'CYPriorFourYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorFiveYear', 'CYPriorFiveYear', N'CYPriorFiveYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorSixYear', 'CYPriorSixYear', N'CYPriorSixYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorSevenYear', 'CYPriorSevenYear', N'CYPriorSevenYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorEightYear', 'CYPriorEightYear', N'CYPriorEightYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorNineYear', 'CYPriorNineYear', N'CYPriorNineYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorTenYear', 'CYPriorTenYear', N'CYPriorTenYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorElevenYear', 'CYPriorElevenYear', N'CYPriorElevenYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'CYPriorTwelveYear', 'CYPriorTwelveYear', N'CYPriorTwelveYear', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'SinceInceptionReturn', 'SinceInceptionReturn', N'SinceInceptionReturn', GETDATE(), NULL, NULL, 1, N'', NULL, 'Product'),
(N'InceptionDate', 'InceptionDate', N'InceptionDate', GETDATE(), NULL, N'YYYY-MM-DD', 1, N'date', NULL, 'Product'),
(N'CurrentQuarter', 'CurrentQuarter', N'CurrentQuarter', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'ValueAdded', 'ValueAdded', N'ValueAdded', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'Risk', 'Risk', N'Risk', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'TrackingError', 'TrackingError', N'TrackingError', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'InfoRatio', 'InfoRatio', N'InfoRatio', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorThreeMonth', 'PriorThreeMonth', N'PriorThreeMonth', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorSixMonth', 'PriorSixMonth', N'PriorSixMonth', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product'),
(N'PriorNineMonth', 'PriorNineMonth', N'PriorNineMonth', GETDATE(), NULL, NULL, 1, N'double', NULL, 'Product')

--ReportFile
INSERT Parameters.ReportFile VALUES (N'USTR_Performance_MTH_{Period}_{GenerationDate}.csv', N'Performance', N'\\sunlifecorp.com\dfsslc\RL\Reports\CORIC\', 3, 1, NULL, NULL, 'Horizontal')

--ReportFileField

/* */

