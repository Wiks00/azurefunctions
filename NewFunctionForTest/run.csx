#r "System.ServiceModel"
#r "Newtonsoft.Json"

using System;
using System.Linq;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Client;
using Microsoft.Crm.Sdk.Messages;
using System.ServiceModel.Description;
using Newtonsoft.Json.Linq;
using System.Xml;

static IOrganizationService CRM;

public static string Run(string myQueueItem, TraceWriter log)
{
    ConnectToCRM("MDMTester@lookersmotorgroup.onmicrosoft.com", "L00kersTester", "https://lookers-sit-unstable.api.crm4.dynamics.com/XRMServices/2011/Organization.svc");

    var doc = new XmlDocument();
    doc.Load(@"D:\home\site\wwwroot\CrmLeadToCanonicalLead\FetchXML\FetchXML(full).xml");

    doc.SelectNodes("//entity/filter/condition[@attribute='leadid']/@value").Item(0).Value = JObject.Parse(myQueueItem)["leadid"].ToString();

    var efresp = CRM.Execute(new ExecuteFetchRequest { FetchXml = doc.InnerXml });

    return efresp.Results.Values.First().ToString();
}

public static void ConnectToCRM(string UserName, string Password, string SoapOrgServiceUri)
{
    ClientCredentials credentials = new ClientCredentials();
    credentials.UserName.UserName = UserName;
    credentials.UserName.Password = Password;
    Uri serviceUri = new Uri(SoapOrgServiceUri);
    OrganizationServiceProxy proxy = new OrganizationServiceProxy(serviceUri, null, credentials, null);
    proxy.EnableProxyTypes();
    CRM = (IOrganizationService)proxy;
}