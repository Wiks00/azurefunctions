<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var" version="1.0" xmlns:ns0="http://Lookers.ESB.LeadServer.Schemas.Lead" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/resultset" />
  </xsl:template>
  <xsl:template match="/resultset">
    <ns0:Lead>
      <xsl:if test="result/leadid">
        <ns0:ID>
          <xsl:value-of select="result/leadid/text()" />
        </ns0:ID>
      </xsl:if>
      <xsl:for-each select="result">
        <xsl:for-each select="lookers_inboundchannel">
          <ns0:LeadChannel>
            <xsl:if test="@name">
              <ns0:Channel>
                <xsl:value-of select="@name" />
              </ns0:Channel>
            </xsl:if>
          </ns0:LeadChannel>
        </xsl:for-each>
      </xsl:for-each>
      <xsl:if test="result/lookers_source/@name">
        <ns0:LeadSource>
          <xsl:value-of select="result/lookers_source/@name" />
        </ns0:LeadSource>
      </xsl:if>
      <xsl:for-each select="result">
        <xsl:for-each select="lookers_calltime">
          <ns0:PreferredCall>
            <xsl:if test="@name">
              <ns0:PreferredTimeOfDay>
                <xsl:value-of select="@name" />
              </ns0:PreferredTimeOfDay>
            </xsl:if>
          </ns0:PreferredCall>
        </xsl:for-each>
      </xsl:for-each>
      <ns0:Person>
        <xsl:for-each select="result">
          <xsl:for-each select="lookers_title">
            <xsl:if test="@name">
              <ns0:Title>
                <xsl:value-of select="@name" />
              </ns0:Title>
            </xsl:if>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="result">
          <xsl:if test="firstname">
            <ns0:Forename>
              <xsl:value-of select="firstname/text()" />
            </ns0:Forename>
          </xsl:if>
        </xsl:for-each>
        <xsl:for-each select="result">
          <xsl:if test="lastname">
            <ns0:Surname>
              <xsl:value-of select="lastname/text()" />
            </ns0:Surname>
          </xsl:if>
        </xsl:for-each>
        <xsl:variable name="PostCode" select="//result/address1_postalcode/text()" />
        <xsl:variable name="Address" select="//result/address1_line1/text()" />
        <xsl:variable name="City" select="//result/address1_city/text()" />
        <ns0:ContactMechanisms xmlns:ns0="http://Lookers.ESB.LeadServer.Schemas.Lead">

          <xsl:if test="//result/emailaddress1!=''">
            <ns0:Mechanism>
              <ns0:ContactElectronicAddress>
                <ns0:ElectronicType>Email</ns0:ElectronicType>
                <ns0:ElectronicAddress>
                  <xsl:value-of select="//result/emailaddress1/text()" />
                </ns0:ElectronicAddress>
              </ns0:ContactElectronicAddress>
              <ns0:Type>ElectronicAddress</ns0:Type>
            </ns0:Mechanism>
          </xsl:if>

          <xsl:if test="//result/mobilephone!=''">
            <ns0:Mechanism>
              <ns0:ContactTelecommsNumber>
                <ns0:PhoneType>MobilePhone</ns0:PhoneType>
                <ns0:TelecommsNumber>
                  <xsl:value-of select="//result/mobilephone/text()" />
                </ns0:TelecommsNumber>
              </ns0:ContactTelecommsNumber>
              <ns0:Type>PhoneNumber</ns0:Type>
              <ns0:Usage>Personal</ns0:Usage>
            </ns0:Mechanism>
          </xsl:if>

          <xsl:if test="//result/telephone1!=''">
            <ns0:Mechanism>
              <ns0:ContactTelecommsNumber>
                <ns0:PhoneType>LandlinePhone</ns0:PhoneType>
                <ns0:TelecommsNumber>
                  <xsl:value-of select="//result/telephone1/text()" />
                </ns0:TelecommsNumber>
              </ns0:ContactTelecommsNumber>
              <ns0:Type>PhoneNumber</ns0:Type>
              <ns0:Usage>Personal</ns0:Usage>
            </ns0:Mechanism>
          </xsl:if>

          <xsl:if test="//result/telephone2!=''">
            <ns0:Mechanism>
              <ns0:ContactTelecommsNumber>
                <ns0:PhoneType>LandlinePhone</ns0:PhoneType>
                <ns0:TelecommsNumber>
                  <xsl:value-of select="//result/telephone2/text()" />
                </ns0:TelecommsNumber>
              </ns0:ContactTelecommsNumber>
              <ns0:Type>PhoneNumber</ns0:Type>
              <ns0:Usage>Business</ns0:Usage>
            </ns0:Mechanism>
          </xsl:if>

          <xsl:if test="//result/customerid.fax!=''">
            <ns0:Mechanism>
              <ns0:ContactTelecommsNumber>
                <ns0:PhoneType>FaxPhone</ns0:PhoneType>
                <ns0:TelecommsNumber>
                  <xsl:value-of select="//result/customerid.fax/text()" />
                </ns0:TelecommsNumber>
              </ns0:ContactTelecommsNumber>
            </ns0:Mechanism>
          </xsl:if>

          <xsl:if test="$PostCode!='' or $Address!='' or $City!=''">
            <ns0:Mechanism>
              <ns0:ContactPostalAddress>

                <xsl:if test="//result/lookers_address1housename!=''">
                  <ns0:HouseName>
                    <xsl:value-of select="//result/lookers_address1housename/text()" />
                  </ns0:HouseName>
                </xsl:if>

                <xsl:if test="//result/lookers_address1housenumber!=''">
                  <ns0:HouseNumber>
                    <xsl:value-of select="//result/lookers_address1housenumber/text()" />
                  </ns0:HouseNumber>
                </xsl:if>

                <xsl:if test="$Address!=''">
                  <ns0:AddressLine1>
                    <xsl:value-of select="$Address" />
                  </ns0:AddressLine1>
                </xsl:if>

                <xsl:if test="//result/address1_line2!=''">
                  <ns0:AddressLine2>
                    <xsl:value-of select="//result/address1_line2/text()" />
                  </ns0:AddressLine2>
                </xsl:if>

                <xsl:if test="//result/address1_line3!=''">
                  <ns0:AddressLine3>
                    <xsl:value-of select="//result/address1_line3/text()" />
                  </ns0:AddressLine3>
                </xsl:if>

                <xsl:if test="$City!=''">
                  <ns0:City>
                    <xsl:value-of select="$City" />
                  </ns0:City>
                </xsl:if>

                <xsl:if test="$PostCode!=''">
                  <ns0:PostalCode>
                    <xsl:value-of select="$PostCode" />
                  </ns0:PostalCode>
                </xsl:if>

              </ns0:ContactPostalAddress>
              <ns0:Type>PostalAddress</ns0:Type>
            </ns0:Mechanism>
          </xsl:if>
        </ns0:ContactMechanisms>
        <xsl:for-each select="result">
          <xsl:for-each select="preferredcontactmethodcode">
            <xsl:if test="@name">
              <ns0:PreferredContactMethod>
                <xsl:value-of select="@name" />
              </ns0:PreferredContactMethod>
            </xsl:if>
          </xsl:for-each>
        </xsl:for-each>
      </ns0:Person>
      <xsl:if test="result/leadid.notetext">
        <ns0:Message>
          <xsl:value-of select="result/leadid.notetext/text()" />
        </ns0:Message>
      </xsl:if>
      <ns0:VehiclesOfInterest>
        <xsl:for-each select="result">
          <xsl:for-each select="lookers_makeid">
            <ns0:StockVehicle>
              <xsl:if test="../lookers_vehicleregistration">
                <ns0:VRM>
                  <xsl:value-of select="../lookers_vehicleregistration/text()" />
                </ns0:VRM>
              </xsl:if>
              <xsl:if test="@name">
                <ns0:Manufacturer>
                  <xsl:value-of select="@name" />
                </ns0:Manufacturer>
              </xsl:if>
              <xsl:if test="../lookers_modelid/@name">
                <ns0:Model>
                  <xsl:value-of select="../lookers_modelid/@name" />
                </ns0:Model>
              </xsl:if>
              <xsl:if test="../lookers_derivative/@name">
                <ns0:Derivative>
                  <xsl:value-of select="../lookers_derivative/@name" />
                </ns0:Derivative>
              </xsl:if>
              <xsl:if test="../derivative.lookers_fueltypeid/@name">
                <ns0:FuelType>
                  <xsl:value-of select="../derivative.lookers_fueltypeid/@name" />
                </ns0:FuelType>
              </xsl:if>
            </ns0:StockVehicle>
          </xsl:for-each>
        </xsl:for-each>
        <xsl:for-each select="result">
          <xsl:for-each select="lookers_newused">
            <ns0:VehicleLookup>
              <xsl:if test="@name">
                <ns0:NewOrUsed>
                  <xsl:value-of select="@name" />
                </ns0:NewOrUsed>
              </xsl:if>
            </ns0:VehicleLookup>
          </xsl:for-each>
        </xsl:for-each>
      </ns0:VehiclesOfInterest>
      <xsl:for-each select="result">
        <xsl:for-each select="PartExchangeVehicle.lookers_makeid">
          <ns0:PartExchange>
            <xsl:attribute name="xsi:type">
              <xsl:value-of select="'ns0:UsedVehicleType'" />
            </xsl:attribute>
            <xsl:if test="@name">
              <ns0:Manufacturer>
                <xsl:value-of select="@name" />
              </ns0:Manufacturer>
            </xsl:if>
            <xsl:if test="../PartExchangeVehicle.lookers_modelid/@name">
              <ns0:Model>
                <xsl:value-of select="../PartExchangeVehicle.lookers_modelid/@name" />
              </ns0:Model>
            </xsl:if>
            <xsl:if test="../PartExchangeVehicle.lookers_derivativeid/@name">
              <ns0:Derivative>
                <xsl:value-of select="../PartExchangeVehicle.lookers_derivativeid/@name" />
              </ns0:Derivative>
            </xsl:if>
            <xsl:for-each select="../PartExchangeVehicle.lookers_currentodometer">
              <ns0:Odometer>
                <ns0:Reading>
                  <xsl:value-of select="./text()" />
                </ns0:Reading>
              </ns0:Odometer>
            </xsl:for-each>
            <xsl:if test="../DerivativePartExV.lookers_fueltypeid/@name">
              <ns0:FuelType>
                <xsl:value-of select="../DerivativePartExV.lookers_fueltypeid/@name" />
              </ns0:FuelType>
            </xsl:if>
          </ns0:PartExchange>
        </xsl:for-each>
      </xsl:for-each>
      <xsl:for-each select="result">
        <ns0:ManufacturerLead>
          <xsl:if test="lookers_manufacturerleadid">
            <ns0:ManufacturerLeadID>
              <xsl:value-of select="lookers_manufacturerleadid/text()" />
            </ns0:ManufacturerLeadID>
          </xsl:if>
        </ns0:ManufacturerLead>
      </xsl:for-each>
      <xsl:for-each select="result">
        <xsl:for-each select="lookers_dealership">
          <ns0:Dealer>
            <xsl:if test="@name">
              <ns0:DealerName>
                <xsl:value-of select="@name" />
              </ns0:DealerName>
            </xsl:if>
          </ns0:Dealer>
        </xsl:for-each>
      </xsl:for-each>
    </ns0:Lead>
  </xsl:template>
</xsl:stylesheet>