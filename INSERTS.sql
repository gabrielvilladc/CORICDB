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
('Description','CUSIP Description','Field_Description',GETDATE(),NULL,'',1,'Varchar',NULL,''),
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
insert into Parameters.ReportFileField VALUES
(1,1,'Varchar','',NULL,1,1),
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
(1,29,'Fixed','','',29,1),
(1,30,'Fixed','','',30,1)


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

--PENDING
/*
FieldId	FieldNameInDB	Description	FieldNameInExcel	SortOrder	CreatedOn	LastUpdate	Format	FieldType	IsActive
12	Coupon	Coupon Value	Coupon	12	2022-01-04 09:34:43.570	NULL	NULL	Double	1
*/

--ReportFile
INSERT INTO Parameters.ReportFile VALUES 
('USTR_PortfolioStats_MTH_{Period}_{GenerationDate}.csv', 'PortfolioStats report', '\\sunlifecorp.com\dfsslc\RL\Reports\CORIC\', 6, 1, NULL, NULL, 'Horizontal')


--Report File Field
INSERT INTO Parameters.ReportFileField VALUES 
--Report file, Field, Field Type, Field Format, Default value, Sort Order column, Sort Order Row
(2, 1, 'Varchar', NULL, NULL, 1, 1),
(2, 2, 'Date', 'yyyy-MM-dd', NULL, 2, 1),
(2, 3, 'Varchar', NULL, NULL, 3, 1),
(2, 4, 'Fixed', NULL, 'USTR', 4, 1),
(2, 5, 'Integer', NULL, NULL, 5, 1),
(2, 57, 'Varchar', NULL, NULL, 6, 1),
(2, 8, 'Varchar', NULL, NULL, 7, 1),
(2, 17, 'Double', NULL, NULL, 8, 1),
(2, 18, 'Double', NULL, NULL, 9, 1),
(2, 31, 'Double', NULL, NULL, 10, 1),
(2, 32, 'Double', NULL, NULL, 11, 1),
(2, 58, 'Double', NULL, NULL, 12, 1),
(2, 13, 'Double', NULL, NULL, 13, 1),
(2, 22, 'Date', 'yyyy-MM-dd', NULL, 14, 1),
(2, 33, 'Double', NULL, NULL, 15, 1),
(2, 34, 'Double', NULL, NULL, 16, 1),
(2, 35, 'Double', NULL, NULL, 17, 1),
(2, 36, 'Double', NULL, NULL, 18, 1),
(2, 37, 'Double', NULL, NULL, 19, 1),
(2, 38, 'Double', NULL, NULL, 20, 1),
(2, 39, 'Double', NULL, NULL, 21, 1),
(2, 40, 'Double', NULL, NULL, 22, 1),
(2, 41, 'Double', NULL, NULL, 23, 1),
(2, 42, 'Double', NULL, NULL, 24, 1),
(2, 43, 'Double', NULL, NULL, 25, 1),
(2, 23, 'Double', NULL, NULL, 26, 1),
(2, 44, 'Double', NULL, NULL, 27, 1),
(2, 45, 'Double', NULL, NULL, 28, 1),
(2, 46, 'Double', NULL, NULL, 29, 1),
(2, 47, 'Double', NULL, NULL, 30, 1),
(2, 48, 'Double', NULL, NULL, 31, 1),
(2, 49, 'Double', NULL, NULL, 32, 1),
(2, 50, 'Double', NULL, NULL, 33, 1),
(2, 51, 'Double', NULL, NULL, 34, 1),
(2, 59, 'Double', NULL, NULL, 35, 1),
(2, 52, 'Double', NULL, NULL, 36, 1),
(2, 53, 'Double', NULL, NULL, 37, 1),
(2, 20, 'Double', NULL, NULL, 38, 1),
(2, 54, 'Double', NULL, NULL, 39, 1),
(2, 21, 'Double', NULL, NULL, 40, 1),
(2, 55, 'Double', NULL, NULL, 41, 1),
(2, 56, 'Double', NULL, NULL, 42, 1)

 
 /**/


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
--INSERTS ReportFileField
DECLARE @idField int 
DECLARE @SortOrder INT
SET @SortOrder = 1
DECLARE db_cursor CURSOR FOR 
SELECT Field_Id 
FROM Parameters.Field
WHERE Field_Id in (1,2,3,4,5,6,12,47,49,51) OR (Field_Id >61 AND Field_Id < 94)

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @idField  
WHILE @@FETCH_STATUS = 0  
BEGIN  
	IF ((select Field_NameInDB from Parameters.Field where Field_Id=@idField) = 'Description')
	BEGIN
		SET @SortOrder = 10
	END
	IF ((select Field_NameInDB from Parameters.Field where Field_Id=@idField) = 'TaxType')
	BEGIN
		SET @SortOrder = 7
	END
	IF ((select Field_NameInDB from Parameters.Field where Field_Id=@idField) = 'OneYear')
	BEGIN
		SET @SortOrder = 14
	END
      select @idField, Field_NameInDB, Field_Type,Field_Format,Field_DefaultValue,Field_DefaultValue, (select @SortOrder) as SortOrder from Parameters.Field where Field_Id=@idField
	  INSERT Parameters.ReportFileField VALUES 
		(3,@idField, (select Field_Type from Parameters.Field where Field_Id=@idField), (select Field_Format from Parameters.Field where Field_Id=@idField), (select Field_DefaultValue from Parameters.Field where Field_Id=@idField), @SortOrder,1)
      SET @SortOrder = @SortOrder + 1
	  FETCH NEXT FROM db_cursor INTO @idField 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 
/* */

