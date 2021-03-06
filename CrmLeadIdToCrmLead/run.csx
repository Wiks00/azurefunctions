#r "System.ServiceModel"
#r "System.Transactions"
#r "Newtonsoft.Json"

using System;
using System.Net;
using System.Linq;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Client;
using Microsoft.Crm.Sdk.Messages;
using System.ServiceModel.Description;
using System.Transactions;
using Newtonsoft.Json.Linq;
using System.Xml;

static IOrganizationService CRM;

public static HttpResponseMessage Run(HttpRequestMessage req, TraceWriter log)
{
    try
    {
        ConnectToCRM("MDMTester@lookersmotorgroup.onmicrosoft.com", "L00kersTester", "https://lookers-sit-unstable.api.crm4.dynamics.com/XRMServices/2011/Organization.svc");

        var doc = new XmlDocument();
        doc.Load(@"D:\home\site\wwwroot\CrmLeadIdToCrmLead\FetchXML\FetchXML(full).xml");

        OrganizationResponse efresp = new OrganizationResponse();

        using (var transaction = new TransactionScope())
        {
            doc.SelectNodes("//entity/filter/condition[@attribute='leadid']/@value").Item(0).Value = JObject.Parse(req.Content.ReadAsStringAsync().Result)["leadid"].ToString();

            efresp = CRM.Execute(new ExecuteFetchRequest { FetchXml = doc.InnerXml });

            transaction.Complete();
        }

        return req.CreateResponse(HttpStatusCode.OK, efresp.Results.Values.First().ToString());
    }
    catch (Exception ex)
    {
        return req.CreateResponse(HttpStatusCode.InternalServerError, "{\"type\": \"" + ex.GetType() + "\",\"message\": \"" + ex.Message + "\"}");
    }
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