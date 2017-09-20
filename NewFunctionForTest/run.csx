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
    ConnectToCRM("MDMTester@lookersmotorgroup.onmicrosoft.com", "L00kersTester",
"https://lookers-sit-unstable.api.crm4.dynamics.com/XRMServices/2011/Organization.svc");

    var doc = new XmlDocument();
    doc.Load("..\\..\\FetchXML(full).xml");

    doc.SelectNodes("//entity/filter/condition[@attribute='leadid']/@value").Item(0).Value = "{F3AFDAD1-5E65-E711-810C-70106FAAC331}";

    ExecuteFetchRequest efr = new ExecuteFetchRequest();
    efr.FetchXml = doc.InnerXml;
    var efresp = CRM.Execute(efr);

    return "{\"leadid\":\"111\"}";
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
