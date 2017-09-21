#r "System.ServiceModel"
#r "Newtonsoft.Json"
#r "System.Transactions"

using System;
using System.Linq;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Client;
using Microsoft.Crm.Sdk.Messages;
using System.ServiceModel.Description;
using Newtonsoft.Json.Linq;
using System.Xml;
using System.Transactions;

static IOrganizationService CRM;

public static string Run(string myQueueItem, TraceWriter log)
{
    ConnectToCRM("MDMTester@lookersmotorgroup.onmicrosoft.com", "L00kersTester", "https://lookers-sit-unstable.api.crm4.dynamics.com/XRMServices/2011/Organization.svc");

    var doc = new XmlDocument();
    doc.Load(@"D:\home\site\wwwroot\NewFunctionForTest\FetchXML\FetchXML(full).xml");

    OrganizationResponse efresp = new OrganizationResponse();

    using (var transaction = new TransactionScope())
    {
        doc.SelectNodes("//entity/filter/condition[@attribute='leadid']/@value").Item(0).Value = JObject.Parse(myQueueItem)["leadid"].ToString();

        efresp = CRM.Execute(new ExecuteFetchRequest { FetchXml = doc.InnerXml });

        transaction.Complete();
    }

    return efresp.Results.Values.First().ToString();
}

private static void ConnectToCRM(string UserName, string Password, string SoapOrgServiceUri)
{
    var connectionString = $"Url={SoapOrgServiceUri}; Username={UserName}; Password={Password}; authtype=Office365";
    CrmServiceClient conn = new CrmServiceClient(connectionString);
    CRM = (IOrganizationService)conn.OrganizationWebProxyClient != null ? (IOrganizationService)conn.OrganizationWebProxyClient : (IOrganizationService)conn.OrganizationServiceProxy;
}