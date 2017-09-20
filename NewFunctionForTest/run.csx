using System;
using System.Linq;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Client;
using Microsoft.Crm.Sdk.Messages;
using System.ServiceModel.Description;
using System.Xml;

static IOrganizationService CRM;

public static string Run(string myQueueItem, TraceWriter log)
{
    ConnectToCRM("MDMTester@lookersmotorgroup.onmicrosoft.com", "L00kersTester","https://lookers-sit-unstable.api.crm4.dynamics.com/XRMServices/2011/Organization.svc");

    var doc = new XmlDocument();
    doc.Load(@"D:\home\site\wwwroot\CrmLeadToCanonicalLead\FetchXML\FetchXML(full).xml");

    doc.SelectNodes("//entity/filter/condition[@attribute='leadid']/@value").Item(0).Value = (string)Object.Parse(myQueueItem)["leadid"];

    ExecuteFetchRequest efr = new ExecuteFetchRequest();
    efr.FetchXml = doc.InnerXml;
    var efresp = CRM.Execute(efr);

    return efresp.Results.Values.First();
}

public static void ConnectToCRM(string UserName, string Password, string SoapOrgServiceUri)
{
    try
    {
        ClientCredentials credentials = new ClientCredentials();
        credentials.UserName.UserName = UserName;
        credentials.UserName.Password = Password;
        Uri serviceUri = new Uri(SoapOrgServiceUri);
        OrganizationServiceProxy proxy = new OrganizationServiceProxy(serviceUri, null, credentials, null);
        proxy.EnableProxyTypes();
        CRM = (IOrganizationService)proxy;
    }
    catch (Exception ex)
    {

    }
}
