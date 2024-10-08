<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" version="1.0" indent="yes"/>
    <xsl:template match="/">
        <fo:root>

            <fo:layout-master-set>
                <fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 25mm 5mm 25mm" master-name="template">
                    <fo:region-body margin="20mm 0mm 20mm 0mm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!--=========================== Title ===============================-->

            <fo:page-sequence master-reference="template">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block position ="absolute" text-align ="center" font-weight="bold" margin-bottom="50mm"
                              font-family="Calibri" font-size="48pt" padding-before="50mm" color="black">
                        Hotel catalog
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>

            <!--=========================== Hotels ===============================-->

            <xsl:for-each select="//hotel">
                <xsl:variable name="hotelChain_reference_id" select="@hotelChainID"/>
                <xsl:variable name="region_reference_id" select="@regionID"/>
                <fo:page-sequence master-reference="template">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">

                            <fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
                                      font-family="Calibri" font-size="20pt" color="black">
                                <xsl:value-of select="name"/>
                            </fo:block>

                            <xsl:for-each select="photos/photo">
                              <fo:block position="absolute" text-align="center" padding-before="7mm" margin-left="2.5cm">
                                  <fo:external-graphic src="{unparsed-entity-uri(@src)}"/>
                              </fo:block>
                            </xsl:for-each>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Description:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="description"/>
                                </fo:inline>
                            </fo:block>

                        </fo:block-container>
                    </fo:flow>
                </fo:page-sequence>

                <fo:page-sequence master-reference="template">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="20mm" margin-left="2cm">
                                Region:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select= "//region[@regionID = $region_reference_id]/name "/>
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Address:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="address"/>
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Hotel Chain:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select= "//hotelChain[@hotelChainID = $hotelChain_reference_id]/name "/>
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Hotel type:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="@type"/>
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Stars:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="@stars"/>
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Features:
                                <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                                    <xsl:value-of select="features"/>
                                </fo:inline>
                            </fo:block>

                            <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                                      padding-before="5mm" margin-left="2cm">
                                Rooms:
                            </fo:block>

                            <fo:table>
                            <fo:table-header>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block position="relative" font-family="Calibri" font-weight="500" font-size="13pt" color="black"
                                                  padding-before="5mm" margin-left="2cm">
                                            Type
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block position="relative" font-family="Calibri" font-weight="500" font-size="13pt" color="black"
                                                  padding-before="5mm" margin-left="2cm">
                                            Capacity
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block position="relative" font-family="Calibri" font-weight="500" font-size="13pt" color="black"
                                                  padding-before="5mm" margin-left="2cm">
                                            Price
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>

                                <xsl:for-each select="rooms/room">
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block position="relative" padding-before="5mm" margin-left="2cm" font-weight="normal" font-size="12pt">
                                                <xsl:value-of select="@type" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block position="relative" padding-before="5mm" margin-left="2cm" font-weight="normal" font-size="12pt">
                                                <xsl:value-of select="capacity" />
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block position="relative" padding-before="5mm" margin-left="2cm" font-weight="normal" font-size="12pt">
                                                <xsl:value-of select="price" />
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                                </xsl:for-each>

                            </fo:table>

                        </fo:block-container>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>

            <!--=========================== Hotel Chains ===============================-->
            <fo:page-sequence master-reference="template">
            <fo:flow flow-name="xsl-region-body">
            <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">

                <fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
                          font-family="Calibri" font-size="20pt" color="black">
                    Hotel Chains
                </fo:block>

            <xsl:for-each select="//hotelChain">
                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="10mm" margin-left="2cm">

                    Name:
                    <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="name"/>
                    </fo:inline>
                </fo:block>

                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="5mm" margin-left="2cm">
                    Description:
                    <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="description"/>
                    </fo:inline>
                </fo:block>

                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="5mm" margin-left="2cm">
                    Number of hotels:
                    <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="numberOfHotels"/>
                    </fo:inline>
                </fo:block>

            </xsl:for-each>
            </fo:block-container>
            </fo:flow>
            </fo:page-sequence>

            <!--=========================== Regions ===============================-->
            <xsl:for-each select="//region">
            <fo:page-sequence master-reference="template">
            <fo:flow flow-name="xsl-region-body">
            <fo:block-container position="absolute" top="-2.5cm" left="-2.5cm">

                <xsl:if test="position() = 1">
                <fo:block position="absolute" text-align="center" padding-before="2cm" margin-left="2.5cm"
                           font-family="Calibri" font-size="20pt" color="black">
                    Regions
                </fo:block>
                </xsl:if>


                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="20mm" margin-left="2cm">
                    Name:
                    <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="name"/>
                    </fo:inline>
                </fo:block>

                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="5mm" margin-left="2cm">
                    Description:
                    <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="description"/>
                    </fo:inline>
                </fo:block>

                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="5mm" margin-left="2cm">
                    Sights:
                    <fo:inline position="relative" padding-left="2mm" font-weight="normal" font-size="14pt">
                        <xsl:value-of select="sights"/>
                    </fo:inline>
                </fo:block>

                <fo:block position="relative" font-family="Calibri" font-weight="bold" font-size="14pt" color="black"
                          padding-before="5mm" margin-left="2cm">
                    Transport:
                </fo:block>

                <fo:table>
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block position="relative" font-family="Calibri" font-weight="500" font-size="13pt" color="black"
                                          padding-before="5mm" margin-left="2cm">
                                    Type
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block position="relative" font-family="Calibri" font-weight="500" font-size="13pt" color="black"
                                          padding-before="5mm" margin-left="2cm">
                                    Name
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block position="relative" font-family="Calibri" font-weight="500" font-size="13pt" color="black"
                                          padding-before="5mm" margin-left="2cm">
                                    Hyperlink
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>

                    <xsl:for-each select="transports/transport">
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block position="relative" padding-before="5mm" margin-left="2cm" font-weight="normal" font-size="12pt">
                                        <xsl:value-of select="@type" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block position="relative" padding-before="5mm" margin-left="2cm" font-weight="normal" font-size="12pt">
                                        <xsl:value-of select="name" />
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block position="relative" padding-before="5mm" margin-left="2cm" font-weight="normal" font-size="12pt">
                                        <xsl:value-of select="link" />
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </xsl:for-each>
                </fo:table>

            </fo:block-container>
            </fo:flow>
            </fo:page-sequence>
            </xsl:for-each>

        </fo:root>

    </xsl:template>

</xsl:stylesheet>