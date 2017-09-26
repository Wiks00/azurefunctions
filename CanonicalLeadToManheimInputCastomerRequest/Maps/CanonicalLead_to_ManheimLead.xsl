<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:s0="http://Lookers.ESB.LeadServer.Schemas.Lead" xmlns:ns0="http://webservices" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Lead" />
  </xsl:template>
  <xsl:template match="/s0:Lead">
    <xsl:variable name="var:v2" select="string(s0:Dealer/s0:DealerName/text())" />
    <xsl:variable name="var:v4" select="userCSharp:StringConcat(&quot;0&quot;)" />
    <xsl:variable name="var:v7" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:Forename))" />
    <xsl:variable name="var:v8" select="userCSharp:LogicalNot(string($var:v7))" />
    <xsl:variable name="var:v11" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:Surname))" />
    <xsl:variable name="var:v12" select="userCSharp:LogicalNot(string($var:v11))" />
    <xsl:variable name="var:v16" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:AddressLine2))" />
    <xsl:variable name="var:v17" select="userCSharp:LogicalNot(string($var:v16))" />
    <xsl:variable name="var:v20" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:AddressLine3))" />
    <xsl:variable name="var:v21" select="userCSharp:LogicalNot(string($var:v20))" />
    <xsl:variable name="var:v24" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:City))" />
    <xsl:variable name="var:v25" select="userCSharp:LogicalNot(string($var:v24))" />
    <xsl:variable name="var:v28" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:PostalCode))" />
    <xsl:variable name="var:v29" select="userCSharp:LogicalNot(string($var:v28))" />
    <xsl:variable name="var:v32" select="userCSharp:LogicalExistence(boolean(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactElectronicAddress/s0:ElectronicAddress))" />
    <xsl:variable name="var:v33" select="userCSharp:LogicalNot(string($var:v32))" />
    <xsl:variable name="var:v36" select="userCSharp:StringConcat(&quot;&quot;)" />
    <xsl:variable name="var:v37" select="userCSharp:StringConcat(&quot;242656&quot;)" />
    <xsl:variable name="var:v38" select="userCSharp:LogicalExistence(boolean(s0:Message))" />
    <xsl:variable name="var:v39" select="userCSharp:LogicalNot(string($var:v38))" />
    <xsl:variable name="var:v42" select="userCSharp:LogicalExistence(boolean(s0:VehiclesOfInterest/s0:VehicleLookup/s0:NewOrUsed))" />
    <xsl:variable name="var:v43" select="userCSharp:LogicalNot(string($var:v42))" />
    <xsl:variable name="var:v46" select="userCSharp:LogicalExistence(boolean(s0:VehiclesOfInterest/s0:StockVehicle/s0:Derivative))" />
    <xsl:variable name="var:v47" select="userCSharp:LogicalNot(string($var:v46))" />
    <xsl:variable name="var:v50" select="userCSharp:LogicalExistence(boolean(s0:VehiclesOfInterest/s0:StockVehicle/s0:VRM))" />
    <xsl:variable name="var:v51" select="userCSharp:LogicalNot(string($var:v50))" />
    <xsl:variable name="var:v54" select="userCSharp:LogicalExistence(boolean(s0:PartExchange/s0:Derivative))" />
    <xsl:variable name="var:v55" select="userCSharp:LogicalNot(string($var:v54))" />
    <xsl:variable name="var:v62" select="userCSharp:LogicalExistence(boolean(s0:PartExchange/s0:Odometer/s0:Reading))" />
    <xsl:variable name="var:v63" select="userCSharp:LogicalNot(string($var:v62))" />
    <ns0:inputcustomer>
      <xsl:variable name="var:v1" select="userCSharp:GetXRefData(string(s0:Dealer/s0:DealerName/text()) , &quot;Username&quot;)" />
      <username>
        <xsl:value-of select="$var:v1" />
      </username>
      <xsl:variable name="var:v3" select="userCSharp:GetXRefData($var:v2 , &quot;Password&quot;)" />
      <password>
        <xsl:value-of select="$var:v3" />
      </password>
      <egmcustid>
        <xsl:value-of select="$var:v4" />
      </egmcustid>
      <xsl:variable name="var:v5" select="userCSharp:MapChannelToMoc(string(s0:LeadChannel/s0:Channel/text()))" />
      <moc>
        <xsl:value-of select="$var:v5" />
      </moc>
      <enqsource>
        <xsl:value-of select="s0:LeadSource/text()" />
      </enqsource>
      <xsl:variable name="var:v6" select="userCSharp:MapTitle(string(s0:Person/s0:Title/text()))" />
      <title>
        <xsl:value-of select="$var:v6" />
      </title>
      <xsl:if test="string($var:v8)='true'">
        <xsl:variable name="var:v9" select="&quot;&quot;" />
        <forename>
          <xsl:value-of select="$var:v9" />
        </forename>
      </xsl:if>
      <xsl:if test="string($var:v7)='true'">
        <xsl:variable name="var:v10" select="s0:Person/s0:Forename/text()" />
        <forename>
          <xsl:value-of select="$var:v10" />
        </forename>
      </xsl:if>
      <xsl:if test="string($var:v12)='true'">
        <xsl:variable name="var:v13" select="&quot;&quot;" />
        <surname>
          <xsl:value-of select="$var:v13" />
        </surname>
      </xsl:if>
      <xsl:if test="string($var:v11)='true'">
        <xsl:variable name="var:v14" select="s0:Person/s0:Surname/text()" />
        <surname>
          <xsl:value-of select="$var:v14" />
        </surname>
      </xsl:if>
      <xsl:variable name="var:v15" select="userCSharp:MyConcat(string(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:HouseNumber/text()) , string(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:HouseName/text()) , string(s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:AddressLine1/text()))" />
      <address1>
        <xsl:value-of select="$var:v15" />
      </address1>
      <xsl:if test="string($var:v17)='true'">
        <xsl:variable name="var:v18" select="&quot;&quot;" />
        <address2>
          <xsl:value-of select="$var:v18" />
        </address2>
      </xsl:if>
      <xsl:if test="string($var:v16)='true'">
        <xsl:variable name="var:v19" select="s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:AddressLine2/text()" />
        <address2>
          <xsl:value-of select="$var:v19" />
        </address2>
      </xsl:if>
      <xsl:if test="string($var:v21)='true'">
        <xsl:variable name="var:v22" select="&quot;&quot;" />
        <address3>
          <xsl:value-of select="$var:v22" />
        </address3>
      </xsl:if>
      <xsl:if test="string($var:v20)='true'">
        <xsl:variable name="var:v23" select="s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:AddressLine3/text()" />
        <address3>
          <xsl:value-of select="$var:v23" />
        </address3>
      </xsl:if>
      <xsl:if test="string($var:v25)='true'">
        <xsl:variable name="var:v26" select="&quot;&quot;" />
        <town>
          <xsl:value-of select="$var:v26" />
        </town>
      </xsl:if>
      <xsl:if test="string($var:v24)='true'">
        <xsl:variable name="var:v27" select="s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:City/text()" />
        <town>
          <xsl:value-of select="$var:v27" />
        </town>
      </xsl:if>
      <xsl:if test="string($var:v29)='true'">
        <xsl:variable name="var:v30" select="&quot;&quot;" />
        <postcode>
          <xsl:value-of select="$var:v30" />
        </postcode>
      </xsl:if>
      <xsl:if test="string($var:v28)='true'">
        <xsl:variable name="var:v31" select="s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactPostalAddress/s0:PostalCode/text()" />
        <postcode>
          <xsl:value-of select="$var:v31" />
        </postcode>
      </xsl:if>
      <tel>
        <xsl:for-each select="//s0:Person/s0:ContactMechanisms/s0:Mechanism">
          <xsl:if test="s0:ContactTelecommsNumber/s0:PhoneType = 'LandlinePhone'">
            <xsl:if test="s0:Usage = 'Personal'">
              <xsl:value-of select="s0:ContactTelecommsNumber/s0:TelecommsNumber/text()" />
            </xsl:if>
          </xsl:if>
        </xsl:for-each>
      </tel>
      <workno>
        <xsl:for-each select="//s0:Person/s0:ContactMechanisms/s0:Mechanism">
          <xsl:if test="s0:ContactTelecommsNumber/s0:PhoneType = 'LandlinePhone'">
            <xsl:if test="s0:Usage = 'Business'">
              <xsl:value-of select="s0:ContactTelecommsNumber/s0:TelecommsNumber/text()" />
            </xsl:if>
          </xsl:if>
        </xsl:for-each>
      </workno>
      <mobile>
        <xsl:for-each select="//s0:Person/s0:ContactMechanisms/s0:Mechanism">
          <xsl:if test="s0:ContactTelecommsNumber/s0:PhoneType = 'MobilePhone'">
            <xsl:value-of select="s0:ContactTelecommsNumber/s0:TelecommsNumber/text()" />
          </xsl:if>

        </xsl:for-each>
      </mobile>
      <fax>
        <xsl:for-each select="//s0:Person/s0:ContactMechanisms/s0:Mechanism">
          <xsl:if test="s0:ContactTelecommsNumber/ns0:PhoneType = 'FaxPhone'">
            <xsl:value-of select="s0:ContactTelecommsNumber/s0:TelecommsNumber/text()" />
          </xsl:if>
        </xsl:for-each>
      </fax>
      <xsl:if test="string($var:v33)='true'">
        <xsl:variable name="var:v34" select="&quot;&quot;" />
        <email>
          <xsl:value-of select="$var:v34" />
        </email>
      </xsl:if>
      <xsl:if test="string($var:v32)='true'">
        <xsl:variable name="var:v35" select="s0:Person/s0:ContactMechanisms/s0:Mechanism/s0:ContactElectronicAddress/s0:ElectronicAddress/text()" />
        <email>
          <xsl:value-of select="$var:v35" />
        </email>
      </xsl:if>
      <website>
        <xsl:value-of select="$var:v36" />
      </website>
      <salesmanname>
        <xsl:value-of select="$var:v36" />
      </salesmanname>
      <salesmanid>
        <xsl:value-of select="$var:v37" />
      </salesmanid>
      <iscentrallead>
        <xsl:value-of select="$var:v36" />
      </iscentrallead>
      <budgeted>
        <xsl:value-of select="$var:v4" />
      </budgeted>
      <changemonth>
        <xsl:value-of select="$var:v4" />
      </changemonth>
      <xsl:if test="string($var:v39)='true'">
        <xsl:variable name="var:v40" select="&quot;&quot;" />
        <notes>
          <xsl:value-of select="$var:v40" />
        </notes>
      </xsl:if>
      <xsl:if test="string($var:v38)='true'">
        <xsl:variable name="var:v41" select="s0:Message/text()" />
        <notes>
          <xsl:value-of select="$var:v41" />
        </notes>
      </xsl:if>
      <xsl:if test="string($var:v43)='true'">
        <xsl:variable name="var:v44" select="&quot;New&quot;" />
        <newused>
          <xsl:value-of select="$var:v44" />
        </newused>
      </xsl:if>
      <xsl:if test="string($var:v42)='true'">
        <xsl:variable name="var:v45" select="s0:VehiclesOfInterest/s0:VehicleLookup/s0:NewOrUsed/text()" />
        <newused>
          <xsl:value-of select="$var:v45" />
        </newused>
      </xsl:if>
      <xsl:if test="s0:VehiclesOfInterest/s0:StockVehicle/s0:Manufacturer">
        <nextmake>
          <xsl:value-of select="s0:VehiclesOfInterest/s0:StockVehicle/s0:Manufacturer/text()" />
        </nextmake>
      </xsl:if>
      <xsl:if test="s0:VehiclesOfInterest/s0:StockVehicle/s0:Model">
        <nextmodel>
          <xsl:value-of select="s0:VehiclesOfInterest/s0:StockVehicle/s0:Model/text()" />
        </nextmodel>
      </xsl:if>
      <xsl:if test="string($var:v47)='true'">
        <xsl:variable name="var:v48" select="&quot;&quot;" />
        <nextspec>
          <xsl:value-of select="$var:v48" />
        </nextspec>
      </xsl:if>
      <xsl:if test="string($var:v46)='true'">
        <xsl:variable name="var:v49" select="s0:VehiclesOfInterest/s0:StockVehicle/s0:Derivative/text()" />
        <nextspec>
          <xsl:value-of select="$var:v49" />
        </nextspec>
      </xsl:if>
      <nextcolour>
        <xsl:value-of select="$var:v36" />
      </nextcolour>
      <xsl:if test="string($var:v51)='true'">
        <xsl:variable name="var:v52" select="&quot;&quot;" />
        <nextreg>
          <xsl:value-of select="$var:v52" />
        </nextreg>
      </xsl:if>
      <xsl:if test="string($var:v50)='true'">
        <xsl:variable name="var:v53" select="s0:VehiclesOfInterest/s0:StockVehicle/s0:VRM/text()" />
        <nextreg>
          <xsl:value-of select="$var:v53" />
        </nextreg>
      </xsl:if>
      <nextcarrequireddate>
        <xsl:value-of select="$var:v36" />
      </nextcarrequireddate>
      <xsl:if test="s0:PartExchange/s0:Manufacturer">
        <presmake>
          <xsl:value-of select="s0:PartExchange/s0:Manufacturer/text()" />
        </presmake>
      </xsl:if>
      <xsl:if test="s0:PartExchange/s0:Model">
        <presmodel>
          <xsl:value-of select="s0:PartExchange/s0:Model/text()" />
        </presmodel>
      </xsl:if>
      <xsl:if test="string($var:v55)='true'">
        <xsl:variable name="var:v56" select="&quot;&quot;" />
        <presmodelspec>
          <xsl:value-of select="$var:v56" />
        </presmodelspec>
      </xsl:if>
      <xsl:if test="string($var:v54)='true'">
        <xsl:variable name="var:v57" select="s0:PartExchange/s0:Derivative/text()" />
        <presmodelspec>
          <xsl:value-of select="$var:v57" />
        </presmodelspec>
      </xsl:if>
      <xsl:if test="s0:ManufacturerLead/s0:ManufacturerLeadID">
        <extdburn>
          <xsl:value-of select="s0:ManufacturerLead/s0:ManufacturerLeadID/text()" />
        </extdburn>
      </xsl:if>
      <extdburn2>
        <xsl:value-of select="$var:v36" />
      </extdburn2>
      <dpagroup>
        <xsl:value-of select="$var:v4" />
      </dpagroup>
      <dpathirdparty>
        <xsl:value-of select="$var:v4" />
      </dpathirdparty>
      <dpatel>
        <xsl:value-of select="$var:v4" />
      </dpatel>
      <dpaemail>
        <xsl:value-of select="$var:v4" />
      </dpaemail>
      <dpapostal>
        <xsl:value-of select="$var:v4" />
      </dpapostal>
      <dpasms>
        <xsl:value-of select="$var:v4" />
      </dpasms>
      <xsl:variable name="var:v58" select="userCSharp:MapContactMethod(string(s0:Person/s0:PreferredContactMethod/text()))" />
      <prefcontactmethod>
        <xsl:value-of select="$var:v58" />
      </prefcontactmethod>
      <xsl:variable name="var:v59" select="userCSharp:MapTimeOfDayToContactTime(string(s0:PreferredCall/s0:PreferredTimeOfDay/text()))" />
      <prefcontacttime>
        <xsl:value-of select="$var:v59" />
      </prefcontacttime>
      <xsl:variable name="var:v60" select="userCSharp:MapFuel(string(s0:VehiclesOfInterest/s0:StockVehicle/s0:FuelType/text()))" />
      <nextfuel>
        <xsl:value-of select="$var:v60" />
      </nextfuel>
      <xsl:variable name="var:v61" select="userCSharp:MapFuel(string(s0:PartExchange/s0:FuelType/text()))" />
      <presfuel>
        <xsl:value-of select="$var:v61" />
      </presfuel>
      <xsl:if test="string($var:v63)='true'">
        <xsl:variable name="var:v64" select="&quot;&quot;" />
        <presmileage>
          <xsl:value-of select="$var:v64" />
        </presmileage>
      </xsl:if>
      <xsl:if test="string($var:v62)='true'">
        <xsl:variable name="var:v65" select="s0:PartExchange/s0:Odometer/s0:Reading/text()" />
        <presmileage>
          <xsl:value-of select="$var:v65" />
        </presmileage>
      </xsl:if>
      <presenginesize>
        <xsl:value-of select="$var:v36" />
      </presenginesize>
    </ns0:inputcustomer>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <![CDATA[
public string StringConcat(string param0)
{
   return param0;
}


public bool LogicalExistence(bool val)
{
	return val;
}


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


        public string MyConcat(string houseNu, string houseNa, string line1)
        {
            if (line1 != string.Empty)
            {
                if (houseNu != string.Empty)
                {
                    if (houseNa != string.Empty)
                    {
                        return houseNu + " " + houseNa + " " + line1;
                    }

                    return houseNu + " " + line1;
                }
                if (houseNa != string.Empty)
                {
                    return houseNa + " " + line1;
                }
            }

            return "";
        }


public string GetXRefData(string dealerName, string valueXRef)
{
            System.Net.WebRequest request = System.Net.WebRequest.Create(@"https://asbfunctions.azurewebsites.net/api/" + String.Format(@"{0}/{1}?code=UI/SHedxtKkAIEjrZaGtpHDywy90Tsaa2VSgNQmP2Yb8Wypd6TpDKw==", dealerName, valueXRef));
            
            var response = (System.Net.HttpWebResponse)request.GetResponse();
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                System.IO.Stream contentStream = response.GetResponseStream();
                if (contentStream != null)
                {
                    System.IO.StreamReader reader = new System.IO.StreamReader(contentStream);
                    return reader.ReadToEnd();
                }
            }

           return string.Empty;
}

        public string MapChannelToMoc(string channel)
        {
            switch (channel.ToLower())
            {
                //case "web":->TBD
                //case "showroom": - > TBD
                case "telephone":
                    return "Telephone";
                case "email":
                    return "Email";
                //case "livechat": - > TBD
                //case "prospect":->TBD
                //case "socialmedia": - > TBD
                case "vehiclemanufacturer":
                    return "Manufacturer Lead";
                //case "referral": - > TBD
            }
            return "";
        }


        public string MapTitle(string title)
        {
            switch (title.ToLower())
            {
                case "mr":
                    return "Mr";
                case "mrs":
                    return "Mts";
                case "miss":
                    return "Miss";
                case "ms":
                    return "Ms";
                case "dr":
                    return "Dr";
                case "sir":
                    return "Sir";
                case "lord":
                    return "Lord";
            }
            return "";
        }


        public string MapFuel(string fuel)
        {
            switch (fuel.ToLower())
            {
                case "diesel":
                    return "Diesel";

                case "petrol":
                    return "Petrol";

                case "electric":
                    return "Electric";

                case "hybrid":
                case "petrol/electrtc hybrtd":
                case "diesel/electrtc hybrtd":
                case "dtesel/bio ethanol(E85)":
                case "inspecified":
                    return "Hybrid";
            }

            return "";
        }


        public string MapTimeOfDayToContactTime(string time)
        {
            switch (time.ToLower())
            {
                case "anytime":
                    return "Anytime";

                case "morning":
                    return "Morning";

                case "afternoon":
                    return "Afternoon";

                case "evening":
                    return "Evening";
            }

            return "";
        }

        public string MapContactMethod(string method)
        {
            switch (method)
            {
                case "Email":
                case "Fax":
                    return method.ToLower();
            }

            return "";
        }

public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool ValToBool(string val)
{
	if (val != null)
	{
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		val = val.Trim();
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		double d = 0;
		if (IsNumeric(val, ref d))
		{
			return (d > 0);
		}
	}
	return false;
}


]]>
  </msxsl:script>
</xsl:stylesheet>