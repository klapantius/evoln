<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="https://svn.apache.org/repos/asf/xmlgraphics/fop/trunk/fop/src/foschema/fop.xsd"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root
          xmlns:fo="http://www.w3.org/1999/XSL/Format"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://www.w3.org/1999/XSL/Format
          http://www.xmlblueprint.com/documents/fop.xsd">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm" margin="1cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">
          <fo:table>
            <fo:table-body border-style="none">
              <fo:table-row>
                <fo:table-cell>
                  <xsl:value-of select="leistungsnachweis/vertrag/abteilung"/>
                </fo:table-cell>
                <fo:table-cell>
                  <xsl:value-of select="leistungsnachweis/head2/erstelltvom"/>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell>An <xsl:for-each select="leistungsnachweis/vertrag/contacts/contact">
                  <xsl:value-of select="name"/>
                  <xsl:if test="position != last()">, </xsl:if>
                </xsl:for-each></fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
