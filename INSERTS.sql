USE [SLCCORIC]

/*MARIA*/
insert into Parameters.Field VALUES
('ProductID','Product ID in the Product table','ProductId','2022-01-04',NULL,'Varchar', 1,'',NULL,''),
('PeriodDate','Date of Period','PeriodDate','2022-01-04',NULL,'Date',1,'yyyy-MM-dd',NULL,''),
('AdhocFlag','Massive or not','AdhocFlag','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('LineofBusinessCode','Line of business code','LineofBusinessCode','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('SortOrder','Field Order','SortOrder','2022-01-04',NULL,'Int',1,'',NULL,''),
('EquityFlag','Equity Flag','EquityFlag','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('CUSIP','BBG ID','CUSIP','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('SecurityType','Type of Security','SecurityType','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('StateCode','Code of State','StateCode','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('DateAcquired','Adquisition Date','DateAcquired','2022-01-04',NULL,'Date',1,'yyyy-MM-dd',NULL,''),
('Quantity','Quantity','Quantity','2022-01-04',NULL,'Double',1,'',NULL,''),
('Field_Description','CUSIP Field_Description','Field_Description','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('Coupon','Coupon Value','Coupon','2022-01-04',NULL,'Double',1,'',NULL,''),
('EffectiveMaturity','Maturity Date','MaturityDate','2022-01-04',NULL,'Date',1,'yyyy-MM-dd',NULL,''),
('MaturityDate','MaturityDate','MaturityDate','2022-01-04',NULL,'Date',1,'yyyy-MM-dd',NULL,''),
('OriginalCost','Original Cost','OriginalCost','2022-01-04',NULL,'Double',1,'',NULL,''),
('BookValue','Book Value','BookValue','2022-01-04',NULL,'Double',1,'',NULL,''),
('MarketValue','Market Value','MarketValue','2022-01-04',NULL,'Double',1,'',NULL,''),
('UnrealizedGainLoss','UnrealizedGainLoss','UnrealizedGainLoss','2022-01-04',NULL,'Double',1,'',NULL,''),
('BookYield','BookYield','BookYield','2022-01-04',NULL,'Double',1,'',NULL,''),
('MarketYield','MarketYield','MarketYield','2022-01-04',NULL,'Double',1,'',NULL,''),
('EffectiveDuration','EffectiveDuration','EffectiveDuration','2022-01-04',NULL,'Date',1,'yyyy-MM-dd',NULL,''),
('Convexity','Convexity','Convexity','2022-01-04',NULL,'Double',1,'',NULL,''),
('SAndP','Standard And Poors','SAndP','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('Moody','Moodys','Moodys','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('NAICRating','NAICRating','NAICRating','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('InternalRating','InternalRating','InternalRating','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('Ticker','Ticker','Ticker','2022-01-04',NULL,'Varchar',1,'',NULL,''),
('ClosingPrice','ClosingPrice','ClosingPrice','2022-01-04',NULL,'Double',1,'',NULL,''),
('AcquiredIncome','AcquiredIncome','AcquiredIncome','2022-01-04',NULL,'Double',1,'',NULL,'')

/***RELATIONSHIP***/
INSERT INTO Parameters.ReportFileField VALUES (1,1,'Varchar','',NULL,1,1),
(1,2,'Date','yyyy-MM-dd',NULL,2,1),
(1,3,'Varchar','',NULL,3,1),
(1,4,'Fixed','','USTR',4,1),
(1,5,'Int','','',5,1),
(1,6,'Varchar','',NULL,6,1),
(1,7,'Fixed','','N',7,1),
(1,8,'Varchar','',NULL,8,1),
(1,9,'Varchar','',NULL,9,1),
(1,10,'Fixed','','',10,1),
(1,11,'Fixed','','',11,1),
(1,12,'Varchar','',NULL,12,1),
(1,13,'Double','',NULL,13,1),
(1,14,'Date','yyyy-MM-dd',NULL,14,1),
(1,15,'Fixed','','',15,1),
(1,16,'Double','',NULL,16,1),
(1,17,'Fixed','','',17,1),
(1,18,'Fixed','','',18,1),
(1,19,'Double','',NULL,19,1),
(1,20,'Fixed','','',20,1),
(1,21,'Fixed','','',21,1),
(1,22,'Date','yyyy-MM-dd',NULL,22,1),
(1,23,'Double','',NULL,23,1),
(1,24,'Varchar','',NULL,24,1),
(1,25,'Varchar','',NULL,25,1),
(1,26,'Varchar','',NULL,26,1),
(1,27,'Fixed','','',27,1),
(1,28,'Fixed','','',28,1),
(1,29,'Fixed','','',29,1)
/**/


 /*CRISTIAN*/

--Field
GO
INSERT Parameters.Field VALUES (N'GainOrLoss', N'GainOrLoss', N'GainOrLoss', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'PreTaxBookYield', N'PreTaxBookYield', N'PreTaxBookYield', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtGainNumber', N'SecuritiesAtGainNumber', N'SecuritiesAtGainNumber', NULL, NULL, NULL, 1, N'Integer', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtGainAmount', N'SecuritiesAtGainAmount', N'SecuritiesAtGainAmount', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtLossNumber', N'SecuritiesAtLossNumber', N'SecuritiesAtLossNumber', NULL, NULL, NULL, 1, N'Integer', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecuritiesAtLossAmount', N'SecuritiesAtLossAmount', N'SecuritiesAtLossAmount', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'Weight', N'Weight', N'Weight', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkWeight', N'BenchmarkWeight', N'BenchmarkWeight', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkCoupon', N'BenchmarkCoupon', N'BenchmarkCoupon', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'YTW', N'YTW', N'YTW', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkYTW', N'BenchmarkYTW', N'BenchmarkYTW', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'ModifiedDuration', N'ModifiedDuration', N'ModifiedDuration', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkModifiedDuration', N'BenchmarkModifiedDuration', N'BenchmarkModifiedDuration', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkConvexity', N'BenchmarkConvexity', N'BenchmarkConvexity', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'DailyReturn', N'DailyReturn', N'DailyReturn', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkDailyReturn', N'BenchmarkDailyReturn', N'BenchmarkDailyReturn', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'MTD', N'MTD', N'MTD', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkMTD', N'BenchmarkMTD', N'BenchmarkMTD', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'QTD', N'QTD', N'QTD', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkQTD', N'BenchmarkQTD', N'BenchmarkQTD', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'YTD', N'YTD', N'YTD', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'CummReturn', N'CummReturn', N'CummReturn', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkCummReturn', N'BenchmarkCummReturn', N'BenchmarkCummReturn', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkBookYield', N'BenchmarkBookYield', N'BenchmarkBookYield', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkMarketYield', N'BenchmarkMarketYield', N'BenchmarkMarketYield', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkEffectiveDuration', N'BenchmarkEffectiveDuration', N'BenchmarkEffectiveDuration', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'SecurityGroup', N'SecurityGroup', N'SecurityGroup', NULL, NULL, NULL, 1, N'Varchar', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'PreTaxMarketYield', N'PreTaxMarketYield', N'PreTaxMarketYield', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO
INSERT Parameters.Field VALUES (N'BenchmarkYTD', N'BenchmarkYTD', N'BenchmarkYTD', NULL, NULL, NULL, 1, N'Double', NULL, N'Portfolio')
GO

--ReportFile
INSERT INTO Parameters.ReportFile VALUES 
('USTR_PortfolioStats_MTH_{Period}_{GenerationDate}.csv', 'PortfolioStats report', '\\sunlifecorp.com\dfsslc\RL\Reports\CORIC\', 6, 1, NULL, NULL, 'Horizontal'))

 
 
 /**/


 /*GABRIEL*/
--FIELDS
INSERT [dbo].[Field] VALUES 
(N'ProductId', NULL, N'ProductId', NULL, NULL, NULL, N'varchar', 1, NULL, 'Product'),																																												
(N'PeriodDate', NULL, N'PeriodDate', NULL, NULL, N'YYYY-MM-DD', N'date   ', 1, NULL, 'Product'),
(N'AdhocFlag', NULL, N'AdhocFlag', NULL, NULL, NULL, N'char(1)', 1, NULL, 'Product'),
(N'LineofBusinessCode', NULL, N'LineofBusinessCode', NULL, NULL, NULL, N'varchar', 1, 'USTR', 'Product'),
(N'SortOrder', NULL, N'SortOrder', NULL, NULL, NULL, N'integer', 1, NULL, 'Product'),
(N'EquityFlag', NULL, N'EquityFlag', NULL, NULL, NULL, N'varchar', 1, NULL, 'Product'),
(N'TaxType', NULL, N'TaxType', NULL, NULL, NULL, N'varchar', 1, NULL, 'Product'),
(N'BenchmarkFlag', NULL, N'BenchmarkFlag', NULL, NULL, NULL, N'varchar', 1, NULL, 'Product'),
(N'PerformanceType', NULL, N'PerformanceType', NULL, NULL, NULL, N'varchar', 1, NULL, 'Product'),
(N'Field_Description', NULL, N'Field_Description', NULL, NULL, NULL, N'varchar', 1, NULL, 'Product'),
(N'MTD', NULL, N'MTD', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'QTD', NULL, N'QTD', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'OneYear', NULL, N'OneYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorTwoYear', NULL, N'PriorTwoYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorThreeYear', NULL, N'PriorThreeYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorFourYear', NULL, N'PriorFourYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorFiveYear', NULL, N'PriorFiveYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorSevenYear', NULL, N'PriorSevenYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorTenYear', NULL, N'PriorTenYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorYear', NULL, N'CYPriorYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorTwoYear', NULL, N'CYPriorTwoYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorThreeYear', NULL, N'CYPriorThreeYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorFourYear', NULL, N'CYPriorFourYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorFiveYear', NULL, N'CYPriorFiveYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorSixYear', NULL, N'CYPriorSixYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorSevenYear', NULL, N'CYPriorSevenYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorEightYear', NULL, N'CYPriorEightYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorNineYear', NULL, N'CYPriorNineYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorTenYear', NULL, N'CYPriorTenYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorElevenYear', NULL, N'CYPriorElevenYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'CYPriorTwelveYear', NULL, N'CYPriorTwelveYear', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'SinceInceptionReturn', NULL, N'SinceInceptionReturn', NULL, NULL, NULL, N'', 1, NULL, 'Product'),
(N'InceptionDate', NULL, N'InceptionDate', NULL, NULL, N'YYYY-MM-DD', N'date', 1, NULL, 'Product'),
(N'CurrentQuarter', NULL, N'CurrentQuarter', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'ValueAdded', NULL, N'ValueAdded', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'Risk',, NULL, N'Risk', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'TrackingError', NULL, N'TrackingError', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'InfoRatio', NULL, N'InfoRatio', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorThreeMonth', NULL, N'PriorThreeMonth', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorSixMonth', NULL, N'PriorSixMonth', NULL, NULL, NULL, N'double', 1, NULL, 'Product'),
(N'PriorNineMonth', NULL, N'PriorNineMonth', NULL, NULL, NULL, N'double', 1, NULL, 'Product')

--ReportFile
INSERT [dbo].[ReportFile] VALUES (N'USTR_Performance_MTH_20211231_202201071445.csv', N'Performance', N'C:/', NULL, 1, NULL, NULL, NULL)

--ReportFileField

/* */

