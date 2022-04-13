using AutoMapper;
using ComparisonApp.Entities;
using ComparisonApp.Entities.Performance;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ComparisonApp
{
    internal class OperationLogger
    {
        private readonly ISingletonOperation _singletonOperation;
        private readonly IConfiguration _config;
        private readonly IMapper _mapper;

        public OperationLogger(ISingletonOperation singletonOperation, IConfiguration config, IMapper mapper)
        {
            _config = config;
            _singletonOperation = singletonOperation;
            _mapper = mapper;
        }

        #region Client
        public string GetClientProductCode(string clientName)
        {
            string productCode = string.Empty;
            try
            {
                string connectString = _config.GetConnectionString("SLCCORICConnection");

                SqlConnectionStringBuilder builder =
                    new SqlConnectionStringBuilder(connectString);

                using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {
                    connection.Open();

                    String sql = string.Format("SELECT ProductCode FROM [Parameter].Product WHERE Name = '{0}'", clientName);

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                productCode = $"USTR{reader.GetString(0)}";
                            }
                        }
                    }
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }

            return productCode;
        }
        #endregion

        #region Holdings
        public List<FinalHoldings> MappHoldings(List<HoldingsAndPositionsReport> _listHoldings)
        {
            List<FinalHoldings> listFinalHoldings = _mapper.Map<List<HoldingsAndPositionsReport>, List<FinalHoldings>>(_listHoldings);

            return listFinalHoldings;
        }

        public DataTable GetPositionReport(string period, string client, string cellgroup)
        {
            DataTable table = new DataTable();
            try
            {
                string connectString = _config.GetConnectionString("DevelopmentConnection");

                SqlConnectionStringBuilder builder =
                    new SqlConnectionStringBuilder(connectString);

                using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {
                    connection.Open();

                    String sql = $"EXEC [dbo].[GetPositionReports] '{period}', '{client}', '{cellgroup}'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.CommandTimeout = 60;
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            table.Load(reader);
                        }
                    }
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }

            return table;
        }

        public DataTable GetHoldingsReport(string periodId)
        {
            DataTable table = new DataTable();
            try
            {
                string connectString = _config.GetConnectionString("SLCCORICConnection");

                SqlConnectionStringBuilder builder =
                    new SqlConnectionStringBuilder(connectString);

                using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {
                    connection.Open();

                    String sql = $"EXEC SLCCORIC.[dbo].[GetHoldingsReport] '{periodId}'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.CommandTimeout = 60;
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            table.Load(reader);
                        }
                    }
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }

            return table;
        }

        #endregion

        #region Performance
        public List<FinalPerformance> MappPerformance(List<PerformanceAndCellData> _listPerformance)
        {
            List<FinalPerformance> listFinalPerformance = _mapper.Map<List<PerformanceAndCellData>, List<FinalPerformance>>(_listPerformance);

            return listFinalPerformance;
        }

        public DataTable GetCellData(string period, string client, string cellgroup)
        {
            DataTable table = new DataTable();
            try
            {
                string connectString = _config.GetConnectionString("DevelopmentConnection");

                SqlConnectionStringBuilder builder =
                    new SqlConnectionStringBuilder(connectString);

                using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {
                    connection.Open();

                    String sql = $"EXEC [dbo].[GetCellData] '2021-01-31', '2022-01-31', 'BC-IND2', 'CBIS'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            table.Load(reader);
                        }
                    }
                    sql = $"EXEC [dbo].[GetCellData] '2021-01-31', '2022-01-31', 'BC-IND2', 'BCP-AGG'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            table.Load(reader);
                        }
                    }
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }

            return table;
        }

        public DataTable GetPerformanceReport(string periodId)
        {
            DataTable table = new DataTable();
            try
            {
                string connectString = _config.GetConnectionString("SLCCORICConnection");

                SqlConnectionStringBuilder builder =
                    new SqlConnectionStringBuilder(connectString);

                using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
                {
                    connection.Open();

                    String sql = $"EXEC SLCCORIC.[dbo].[GetPerformanceReport] '14'";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.CommandTimeout = 60;
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            table.Load(reader);
                        }
                    }
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }

            return table;
        }

        #endregion
    }
}
