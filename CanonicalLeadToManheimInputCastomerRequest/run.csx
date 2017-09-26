using System.Net;
using System.Xml;
using System.Xml.Xsl;
using System.IO;

public static string Run(HttpRequestMessage req, TraceWriter log)
{
    XmlDocument xmlLead = new XmlDocument();
    xmlLead.Load(req.Content.ReadAsStreamAsync().Result);

    XslCompiledTransform xslt = new XslCompiledTransform();

    xslt.Load(@"D:\home\site\wwwroot\CanonicalLeadToManheimInputCastomerRequest\Maps\CanonicalLead_to_ManheimLead.xsl", new XsltSettings(true, true), null);

    using (MemoryStream memoryStream = new MemoryStream())
    {
        xslt.Transform(xmlLead, null, memoryStream);

        memoryStream.Position = 0;

        xmlLead.Load(memoryStream);
    }

    return  xmlLead.InnerXml;
}
