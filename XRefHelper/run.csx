#r "System.Configuration"
#r "System.Data"

using System.Net;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading.Tasks;

public static HttpResponseMessage Run(HttpRequestMessage req, string dealerName, string valueXRef, TraceWriter log)
{
    string resultValue = string.Empty;

    var str = ConfigurationManager.ConnectionStrings["XRef_connetion"].ConnectionString;

    using (SqlConnection conn = new SqlConnection(str))
    {
        conn.Open();
        var query = $"SELECT appValue FROM xref_ValueXRef_Data WHERE valueXRefID = (SELECT valueXRefID FROM xref_ValueXRef WHERE valueXRefName = '{valueXRef}') AND appTypeID = (SELECT appTypeID from xref_AppType WHERE appType = '{dealerName}')";

        using (SqlCommand cmd = new SqlCommand(query, conn))
        {
            resultValue = (string)cmd.ExecuteScalar();
        }
    }

    return req.CreateResponse(HttpStatusCode.OK, resultValue);
}