#r "Newtonsoft.Json"
#r "LeadSerializer.dll"

using System.Xml;
using System.Xml.Xsl;
using System.IO;
using System.Text;
using LeadSerializer;
using System.Xml.Serialization;
using Newtonsoft.Json;

public static string Run(string crmLead, TraceWriter log)
{
    /*CrmLead crmLead = JsonConvert.DeserializeObject<CrmLead>(crmJsonLead);
    
    XmlSerializer serializer = new XmlSerializer(typeof(CrmLead));

    XmlSerializerNamespaces ns = new XmlSerializerNamespaces();
    ns.Add("ns0", "http://Lookers.AsbManheim.CrmLead/1.0.0.0");*/

    XslCompiledTransform xslt = new XslCompiledTransform();

    xslt.Load(@"D:\home\site\wwwroot\CrmLeadToCanonicalLead\Maps\Lead_to_CanonicalLead.xsl", new XsltSettings(true, true), null);

    XmlDocument xmlRawLead = new XmlDocument();
    xmlRawLead.LoadXml(crmLead);

    xmlRawLead.Schemas.Add("", @"D:\home\site\wwwroot\CrmLeadToCanonicalLead\Schemas\LeadFromCrm.xsd");
    xmlRawLead.Validate(null);

    /*using (MemoryStream memoryStream = new MemoryStream())
    {
        serializer.Serialize(memoryStream, crmLead, ns);

        memoryStream.Position = 0;

        xmlRawLead.Load(memoryStream);
    }*/

    using (MemoryStream memoryStream = new MemoryStream())
    {
        xslt.Transform(xmlRawLead, null, memoryStream);

        memoryStream.Position = 0;

        xmlRawLead.Load(memoryStream);
    }

    return xmlRawLead.InnerXml;
}