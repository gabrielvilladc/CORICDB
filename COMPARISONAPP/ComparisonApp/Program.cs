using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using ComparisonApp;
using System.Data;
using Microsoft.Extensions.Configuration;
using System.IO;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using ComparisonApp.Entities;
using System.Text;
using OfficeOpenXml;
using System.Drawing;
using OfficeOpenXml.Style;
using ComparisonApp.Entities.Performance;


//using Excel = Microsoft.Office.Interop.Excel;


var builder = new ConfigurationBuilder();
BuildConfig(builder);

IConfiguration configuration = builder.Build();

using IHost host = Host.CreateDefaultBuilder(args)
            .ConfigureServices((_, services) =>
                services
                //.AddTransient<ITransientOperation, DefaultOperation>()
                //.AddScoped<IScopedOperation, DefaultOperation>()
                .AddAutoMapper(typeof(Program).Assembly)
                .AddSingleton<ISingletonOperation, DefaultOperation>()
                .AddTransient<OperationLogger>())
                .Build();

List<FinalHoldingsComparison> _listFinalHoldingsDifferences = new List<FinalHoldingsComparison>();
_listFinalHoldingsDifferences = GetHoldingsDifferences(host.Services, args);
List<FinalPerformanceComparison> _listFinalPerformanceDifferences = new List<FinalPerformanceComparison>();
_listFinalPerformanceDifferences = GetPerformanceDifferences(host.Services, args);

GenerateReport(_listFinalHoldingsDifferences, _listFinalPerformanceDifferences, args[2], args[1]);
//await host.RunAsync();

static void BuildConfig(IConfigurationBuilder builder)
{
    builder.SetBasePath(Directory.GetCurrentDirectory())
        .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
        .AddJsonFile($"appsettings.{Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? "Production"}.json", optional: true)
        .AddEnvironmentVariables()
        .Build();
}

static List<FinalHoldingsComparison> GetHoldingsDifferences(IServiceProvider services, string[] args)
{
    using IServiceScope serviceScope = services.CreateScope();
    IServiceProvider provider = serviceScope.ServiceProvider;

    OperationLogger logger = provider.GetRequiredService<OperationLogger>();
    string perdioId = args[0];
    string periodDate = args[1];
    string clientName = args[2];
    string cellGroup = args[3];
    string productCode = logger.GetClientProductCode(clientName);


    //**********           HOLDINGS LIST, from SLCCORICDB (CORICAPP)        ******************
    //Getting the data from SP into a Data Table
    DataTable holdingsTable = logger.GetHoldingsReport(perdioId);
    //Converting DataTable to List
    List<ComparisonApp.Entities.HoldingsAndPositionsReport> holdingsList = new List<ComparisonApp.Entities.HoldingsAndPositionsReport>();
    holdingsList = ConvertDataTable<ComparisonApp.Entities.HoldingsAndPositionsReport>(holdingsTable);
    //Filttering the list by Client
    holdingsList = holdingsList.Where(x => x.ProductID == productCode).ToList();
    //Mapping the records to a standard class list
    List<FinalHoldings> _listFinalHoldings = new List<FinalHoldings>();
    _listFinalHoldings = logger.MappHoldings(holdingsList);


    //**********           POSITIONS LIST, from Development DB (GetPositions SP)        ******************
    //Getting the data from SP into a Data Table
    DataTable positionsReportTable = logger.GetPositionReport(periodDate, clientName, cellGroup);
    //Converting DataTable to List
    List<ComparisonApp.Entities.HoldingsAndPositionsReport> positionsList = new List<ComparisonApp.Entities.HoldingsAndPositionsReport>();
    positionsList = ConvertDataTable<ComparisonApp.Entities.HoldingsAndPositionsReport>(positionsReportTable);
    //Mapping the records to a standard class list
    List<FinalHoldings> _listFinalPositions = new List<FinalHoldings>();
    _listFinalPositions = logger.MappHoldings(positionsList);


    List<FinalHoldingsComparison> _listFinalDifferences = new List<FinalHoldingsComparison>();

    foreach (var item in _listFinalPositions.Select((value, i) => new { i, value }))
    {

        if (item.value.ClosingPrice != _listFinalHoldings[item.i].ClosingPrice) 
        {
            _listFinalHoldings[item.i].ClosingPriceDifference = true;
        }
        if (item.value.Collateral != _listFinalHoldings[item.i].Collateral)
        {
            _listFinalHoldings[item.i].CollateralDifference = true;
        }
        if (item.value.Coupon != _listFinalHoldings[item.i].Coupon)
        {
            _listFinalHoldings[item.i].CouponDifference = true;
        }
        if (item.value.MaturityDate != _listFinalHoldings[item.i].MaturityDate) 
        {
            _listFinalHoldings[item.i].MaturityDateDifference = true;
        }
        if (item.value.MarketValue != _listFinalHoldings[item.i].MarketValue)
        {
            _listFinalHoldings[item.i].MarketValueDifference = true;
        }
        if (item.value.Moodys != _listFinalHoldings[item.i].Moodys) 
        {
            _listFinalHoldings[item.i].MoodysDifference = true;
        }
        if (item.value.Paramount != _listFinalHoldings[item.i].Paramount)
        {
            _listFinalHoldings[item.i].ParamountDifference = true;
        }
        if (item.value.SAndP != _listFinalHoldings[item.i].SAndP)
        {
            _listFinalHoldings[item.i].SAndPDifference = true;
        }
        if (item.value.TsySpread != _listFinalHoldings[item.i].TsySpread)
        {
            _listFinalHoldings[item.i].TsySpreadDifference = true;
        }
        if (item.value.YTW != _listFinalHoldings[item.i].YTW)
        {
            _listFinalHoldings[item.i].YTWDifference = true;
        }

        if (_listFinalHoldings[item.i].ClosingPriceDifference ||
            _listFinalHoldings[item.i].CollateralDifference ||
            _listFinalHoldings[item.i].CouponDifference ||
            _listFinalHoldings[item.i].MaturityDateDifference ||
            _listFinalHoldings[item.i].MarketValueDifference ||
            _listFinalHoldings[item.i].MoodysDifference ||
            _listFinalHoldings[item.i].ParamountDifference ||
            _listFinalHoldings[item.i].SAndPDifference ||
            _listFinalHoldings[item.i].TsySpreadDifference ||
            _listFinalHoldings[item.i].YTWDifference)
        {
            FinalHoldingsComparison finalHoldingsComparisson = new FinalHoldingsComparison()
            {
                Holdings = _listFinalHoldings[item.i],
                Positions = item.value
            };
            _listFinalDifferences.Add(finalHoldingsComparisson);
        }
    }

    return _listFinalDifferences;
}

static List<FinalPerformanceComparison> GetPerformanceDifferences(IServiceProvider services, string[] args)
{
    using IServiceScope serviceScope = services.CreateScope();
    IServiceProvider provider = serviceScope.ServiceProvider;

    OperationLogger logger = provider.GetRequiredService<OperationLogger>();
    string perdioId = args[0];
    string periodDate = args[1];
    string clientName = args[2];
    string cellGroup = args[3];
    string productCode = logger.GetClientProductCode(clientName);


    //**********           PERFORMANCE LIST, from SLCCORICDB (CORICAPP)        ******************
    //Getting the data from SP into a Data Table
    DataTable dataTable = logger.GetPerformanceReport(perdioId);
    //Converting DataTable to List
    List<PerformanceAndCellData> temporalList = new List<PerformanceAndCellData>();
    temporalList = ConvertDataTable<PerformanceAndCellData>(dataTable);
    //Filttering the list by Client
    temporalList = temporalList.Where(x => x.ProductID == productCode).ToList();
    //Mapping the records to a standard class list
    List<FinalPerformance> _finalList = new List<FinalPerformance>();
    _finalList = logger.MappPerformance(temporalList);

    //**********           PERFORMANCE LIST, from Development DB (GetCellData SP)        ******************
    //Getting the data from SP into a Data Table
    DataTable dataTable2 = logger.GetCellData(periodDate, clientName, cellGroup);
    //Converting DataTable to List
    List<PerformanceAndCellData> temporalList2 = new List<PerformanceAndCellData>();
    temporalList2 = ConvertDataTable<PerformanceAndCellData>(dataTable2);
    //Filttering the list by just TOTAL
    temporalList2 = temporalList2.Where(x => x.CellLabel == "TOTAL").ToList();
    //Mapping the records to a standard class list
    List<FinalPerformance> _finalList2 = new List<FinalPerformance>();
    _finalList2 = logger.MappPerformance(temporalList2);

    List<FinalPerformanceComparison> _listFinalDifferences = new List<FinalPerformanceComparison>();
    foreach (var item in _finalList2.Select((value, i) => new { i, value }))
    {
        if (item.value.SinceInceptionReturn != _finalList[item.i].SinceInceptionReturn)
            _finalList[item.i].SinceInceptionReturnDifference = true;
        if (item.value.QTD != _finalList[item.i].QTD)
            _finalList[item.i].QTDDifference = true;
        if (item.value.MTD != _finalList[item.i].MTD)
            _finalList[item.i].MTDDifference = true;
        if (item.value.YTD != _finalList[item.i].YTD)
            _finalList[item.i].YTDDifference = true;

        if (_finalList[item.i].SinceInceptionReturnDifference ||
            _finalList[item.i].QTDDifference ||
            _finalList[item.i].MTDDifference ||
            _finalList[item.i].YTDDifference)
        {
            FinalPerformanceComparison finalPerformanceComparisson = new FinalPerformanceComparison()
            {
                PerformanceReport = _finalList[item.i],
                CellDataSP = item.value
            };
            _listFinalDifferences.Add(finalPerformanceComparisson);
        }
    }
    return _listFinalDifferences;
}

static List<T> ConvertDataTable<T>(DataTable dt)
{
    List<T> data = new List<T>();
    foreach (DataRow row in dt.Rows)
    {
        T item = GetItem<T>(row);
        data.Add(item);
    }

    return data;
}

static T GetItem<T>(DataRow dr)
{
    Type temp = typeof(T);
    T obj = Activator.CreateInstance<T>();

    foreach (DataColumn column in dr.Table.Columns)
    {
        foreach (PropertyInfo pro in temp.GetProperties())
        {
            if (pro.Name == column.ColumnName)
            {
                pro.SetValue(obj, dr[column.ColumnName] == DBNull.Value ? null : dr[column.ColumnName], null);
                break;
            }
            else
                continue;
        }
    }

    return obj;
}

static void GenerateReport(List<FinalHoldingsComparison> _listHoldingsDifferences, List<FinalPerformanceComparison> _listPerformanceDifferences,  string clientName, string periodDate)
{
    //string delimeter = ",";
    string filePath = $"C:\\Users\\sp72\\Documents\\CORIC_Files\\ComparisonApp\\Comparison_{clientName}_{periodDate}_{DateTime.Now.ToString("yyyyMMdd")}{DateTime.Now.ToString("HH")}{DateTime.Now.ToString("mm")}{DateTime.Now.ToString("ss")}.xls";

    // If you use EPPlus in a noncommercial context
    // according to the Polyform Noncommercial license:
    ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

    using (ExcelPackage excelPackage = new ExcelPackage())
    {
        //Set some properties of the Excel document
        //excelPackage.Workbook.Properties.Author = "VDWWD";
        //excelPackage.Workbook.Properties.Title = "Title of Document";
        //excelPackage.Workbook.Properties.Subject = "EPPlus demo export data";
        excelPackage.Workbook.Properties.Created = DateTime.Now;

        //Create the WorkSheet
        ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("Sheet 1");

        worksheet.Cells[1, 1].Value = clientName;
        worksheet.Cells[1,1,1, _listHoldingsDifferences.FirstOrDefault().Holdings.GetType().GetProperties().Where(x=>x.PropertyType.Name =="String").Count()].Merge = true;
        var someCells = worksheet.Cells["A1"];
        someCells.Style.Font.Bold = true;
        someCells.Style.Font.Color.SetColor(Color.Ivory);
        someCells.Style.Fill.PatternType = ExcelFillStyle.Solid;
        someCells.Style.Fill.BackgroundColor.SetColor(Color.Navy);
        someCells.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

        #region Holdings
        int columnNumber = 1;
        int rowNumber = 2;
        worksheet.Cells[rowNumber, 1].Value = "Holdings";
        worksheet.Cells[rowNumber, 1, rowNumber, _listHoldingsDifferences.FirstOrDefault().Holdings.GetType().GetProperties().Where(x => x.PropertyType.Name == "String").Count()].Merge = true;
        worksheet.Cells[rowNumber, 1].Style.Font.Bold = true;
        //worksheet.Cells[rowNumber, 1].Style.Font.Color.SetColor(Color.Ivory);
        worksheet.Cells[rowNumber, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
        worksheet.Cells[rowNumber, 1].Style.Fill.BackgroundColor.SetColor(Color.LightGray);
        worksheet.Cells[rowNumber, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        rowNumber++;
        foreach (PropertyInfo propertyInfo in _listHoldingsDifferences.FirstOrDefault().Holdings.GetType().GetProperties())
        {
            if (propertyInfo.PropertyType == typeof(string))
            {
                worksheet.Cells[rowNumber, columnNumber].Value = propertyInfo.Name;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[rowNumber, columnNumber].Style.Fill.BackgroundColor.SetColor(Color.LightGray);
                worksheet.Cells[rowNumber, columnNumber].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                columnNumber++;
            }
        }
        int lastRowNumber = 0;
        rowNumber++;
        foreach (var item in _listHoldingsDifferences.Select((value, i) => new { i, value }))
        {
            lastRowNumber = rowNumber;
            columnNumber = 1;
            //Row for holdings
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.Source;
            worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.CUSIP;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.SecurityType;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.Coupon;
            if (item.value.Holdings.CouponDifference) {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.MaturityDate;
            if (item.value.Holdings.MaturityDateDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.MarketValue;
            if (item.value.Holdings.MarketValueDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.SAndP;
            if (item.value.Holdings.SAndPDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.Moodys;
            if (item.value.Holdings.MoodysDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.ClosingPrice;
            if (item.value.Holdings.ClosingPriceDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.Paramount;
            if (item.value.Holdings.ParamountDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.YTW;
            if (item.value.Holdings.YTWDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.Collateral;
            if (item.value.Holdings.CollateralDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Holdings.TsySpread;
            if (item.value.Holdings.TsySpreadDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            //Next row for GetPositions
            rowNumber++;
            columnNumber = 1;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.Source;
            worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.CUSIP;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.SecurityType;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.Coupon;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.MaturityDate;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.MarketValue;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.SAndP;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.Moodys;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.ClosingPrice;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.Paramount;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.YTW;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.Collateral;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.Positions.TsySpread;
            if (item.i % 2 == 0)
            {
                worksheet.Cells[lastRowNumber,1,rowNumber,columnNumber].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[lastRowNumber, 1, rowNumber, columnNumber].Style.Fill.BackgroundColor.SetColor(Color.LightBlue);
            }
            rowNumber++;
        }

        worksheet.Cells[rowNumber, 1].Value = $"Different records:{ _listHoldingsDifferences.Count()}";
        worksheet.Cells[rowNumber, 1, rowNumber, _listHoldingsDifferences.FirstOrDefault().Holdings.GetType().GetProperties().Where(x => x.PropertyType.Name == "String").Count()].Merge = true;
        worksheet.Cells[rowNumber, 1].Style.Font.Bold = true;
        worksheet.Cells[rowNumber, 1].Style.Font.Color.SetColor(Color.Ivory);
        worksheet.Cells[rowNumber, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
        worksheet.Cells[rowNumber, 1].Style.Fill.BackgroundColor.SetColor(_listHoldingsDifferences.Count() > 0 ? Color.LightSalmon : Color.LightGreen);
        worksheet.Cells[rowNumber, 1, rowNumber, _listHoldingsDifferences.FirstOrDefault().Holdings.GetType().GetProperties().Where(x => x.PropertyType.Name == "String").Count()].Style.Border.Bottom.Style = ExcelBorderStyle.Medium;
        worksheet.Cells[rowNumber, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        #endregion

        #region Performance
        rowNumber++;
        worksheet.Cells[rowNumber, 1].Value = "Performance";
        worksheet.Cells[rowNumber, 1, rowNumber, _listPerformanceDifferences.FirstOrDefault().PerformanceReport.GetType().GetProperties().Where(x => x.PropertyType.Name == "String").Count()].Merge = true;
        worksheet.Cells[rowNumber, 1].Style.Font.Bold = true;
        //worksheet.Cells[rowNumber, 1].Style.Font.Color.SetColor(Color.Ivory);
        worksheet.Cells[rowNumber, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
        worksheet.Cells[rowNumber, 1].Style.Fill.BackgroundColor.SetColor(Color.LightGray);
        worksheet.Cells[rowNumber, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        rowNumber++;
        columnNumber = 1;
        foreach (PropertyInfo propertyInfo in _listPerformanceDifferences.FirstOrDefault().PerformanceReport.GetType().GetProperties())
        {
            if (propertyInfo.PropertyType == typeof(string))
            {
                worksheet.Cells[rowNumber, columnNumber].Value = propertyInfo.Name;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[rowNumber, columnNumber].Style.Fill.BackgroundColor.SetColor(Color.LightGray);
                worksheet.Cells[rowNumber, columnNumber].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                columnNumber++;
            }
        }
        lastRowNumber = 0;
        rowNumber++;
        foreach (var item in _listPerformanceDifferences.Select((value, i) => new { i, value }))
        {
            lastRowNumber = rowNumber;
            columnNumber = 1;
            //Row for performance report
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.PerformanceReport.Source;
            worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.PerformanceReport.SinceInceptionReturn;
            if (item.value.PerformanceReport.SinceInceptionReturnDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.PerformanceReport.MTD;
            if (item.value.PerformanceReport.MTDDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.PerformanceReport.QTD;
            if (item.value.PerformanceReport.QTDDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.PerformanceReport.YTD;
            if (item.value.PerformanceReport.YTDDifference)
            {
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
                worksheet.Cells[rowNumber, columnNumber].Style.Font.Color.SetColor(Color.Red);
            }
            //Next row for GetCellData
            rowNumber++;
            columnNumber = 1;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.CellDataSP.Source;
            worksheet.Cells[rowNumber, columnNumber].Style.Font.Bold = true;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.CellDataSP.SinceInceptionReturn;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.CellDataSP.MTD;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.CellDataSP.QTD;
            columnNumber++;
            worksheet.Cells[rowNumber, columnNumber].Value = item.value.CellDataSP.YTD;

            if (item.i % 2 == 0)
            {
                worksheet.Cells[lastRowNumber, 1, rowNumber, columnNumber].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[lastRowNumber, 1, rowNumber, columnNumber].Style.Fill.BackgroundColor.SetColor(Color.LightBlue);
            }
            rowNumber++;
        }
        worksheet.Cells[rowNumber, 1].Value = $"Different records:{ _listPerformanceDifferences.Count()}";
        worksheet.Cells[rowNumber, 1, rowNumber, _listPerformanceDifferences.FirstOrDefault().PerformanceReport.GetType().GetProperties().Where(x => x.PropertyType.Name == "String").Count()].Merge = true;
        worksheet.Cells[rowNumber, 1].Style.Font.Bold = true;
        worksheet.Cells[rowNumber, 1].Style.Font.Color.SetColor(Color.Ivory);
        worksheet.Cells[rowNumber, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
        worksheet.Cells[rowNumber, 1].Style.Fill.BackgroundColor.SetColor(_listPerformanceDifferences.Count() > 0 ? Color.LightSalmon : Color.LightGreen);
        worksheet.Cells[rowNumber, 1, rowNumber, _listPerformanceDifferences.FirstOrDefault().PerformanceReport.GetType().GetProperties().Where(x => x.PropertyType.Name == "String").Count()].Style.Border.Bottom.Style = ExcelBorderStyle.Medium;
        worksheet.Cells[rowNumber, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        #endregion

        worksheet.Cells.AutoFitColumns();

        //Save your file
        FileInfo fi = new FileInfo(filePath);
        excelPackage.SaveAs(fi);
    }
}
