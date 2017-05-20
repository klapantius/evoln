<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.w3.org/1999/XSL/Format http://www.xmlblueprint.com/documents/fop.xsd"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm" margin="1cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body" font-size="11pt">
          <fo:table>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-body border-style="none">
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>
                    Siemens Healthcare GmbH
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>
                    <fo:inline>Ansprechpartner: </fo:inline>
                    <fo:inline text-align="right">
                      <xsl:value-of select="doc/head2/erstelltvom"/>
                    </fo:inline>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>
                    <xsl:value-of select="doc/vertrag/abteilung" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>
                    Email:
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>
                    <xsl:for-each select="doc/vertrag/contacts/contact">
                      <xsl:value-of select="name"/>
                      <xsl:if test="position() != last()">, </xsl:if>
                    </xsl:for-each>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>
                    Datum: <xsl:value-of select="doc/head2/erstelltam"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>Siemensstr. 3</fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>91301 Forchheim</fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <xsl:variable name="DocType" select="doc/iteration/doctype" />
          <fo:block space-before="1em">
            <fo:inline font-weight="bold">
              <xsl:choose>
                <xsl:when test="$DocType = '1'">
                  Auftragsbestätigung
                </xsl:when>
                <xsl:otherwise>
                  Lieferschein
                </xsl:otherwise>
              </xsl:choose>
            </fo:inline>
            <fo:inline>
              (IT<xsl:value-of select="doc/iteration/IT"/> von <xsl:value-of select="doc/iteration/itvon"/> bis <xsl:value-of select="doc/iteration/itbis"/>)
            </fo:inline>
          </fo:block>
          <fo:block space-before="1em" space-after="1em">
            <xsl:choose>
              <xsl:when test="$DocType = '1'">
                Im Rahmen Ihrer Bestellung <xsl:value-of select="doc/vertrag/vertragsnr"/> und den fachlichen Besprechungen übernehmen wir die folgenden Arbeiten:
              </xsl:when>
              <xsl:otherwise>
                Im  Rahmen Ihrer Bestellung <xsl:value-of select="doc/vertrag/vertragsnr"/> und den fachlichen Festlegungen (XXXXXXXXXXX) liefern wir Ihnen folgende Positionen:
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
          <fo:table>
            <fo:table-column border-style="solid" border-width="thin"/>
            <fo:table-column border-style="solid" border-width="thin"/>
            <fo:table-body border-style="solid" border-width="thin">
              <xsl:for-each select="doc/positionen/position">
                <fo:table-row border-style="solid" border-width="thin">
                  <fo:table-cell>
                    <fo:block>
                      <fo:block>
                        <xsl:value-of select="titel"/>
                      </fo:block>
                      <fo:block>
                        TFS-ID#:<xsl:value-of select="id"/>
                      </fo:block>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block>
                      <xsl:choose>
                        <xsl:when test="$DocType = '1'">
                          <xsl:value-of select="status1"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="status2"/>
                          <!--<xsl:value-of select="concat('status', $DocType)"/>-->
                        </xsl:otherwise>
                      </xsl:choose>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
