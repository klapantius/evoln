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
        <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm" margin="2cm" margin-top="1cm" margin-bottom="3cm">
          <fo:region-body margin-top="2cm"/>
          <fo:region-before/>
          <fo:region-after/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="center">
            <fo:external-graphic src="evologo.png" scaling="uniform" content-height="2cm"/>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after" font-size="6px" color="gray">
          <fo:table>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-column/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>evosoft GmbH</fo:block>
                  <fo:block>Hugo-Junkers-Str. 11</fo:block>
                  <fo:block>90411 Nürnberg</fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>Tel: +49 911 53991 - 0</fo:block>
                  <fo:block>Fax: +49 911 53991 - 999</fo:block>
                  <fo:block>info@evosoft.com         </fo:block>
                  <fo:block>www.evosoft.com          </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>Geschäftsführer: </fo:block>
                  <fo:block>Ekkehard Reuß    </fo:block>
                  <fo:block>Gernot Kral      </fo:block>
                  <fo:block>Dr. Rainer Besold</fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>Sitz der Gesellschaft: Nürnberg</fo:block>
                  <fo:block>Handelsregister: HRB 13657     </fo:block>
                  <fo:block>Amtsgericht Nürnberg           </fo:block>
                  <fo:block>USt-IDNr. DE168106284          </fo:block>
                  <fo:block>St.Nr. 241/115/32725           </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block>Bankverbindung:            </fo:block>
                  <fo:block>Bayerische HypoVereinsbank AG Erlangen</fo:block>
                  <fo:block>BLZ  763 200 72 / Konto 3 260 682     </fo:block>
                  <fo:block>IBAN DE16 7632 0072 0003 2606 82      </fo:block>
                  <fo:block>SWIFT (BIC) HYVEDEMM417               </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body" font-size="11pt">
          <xsl:variable name="DocType" select="doc/iteration/doctype" />
          <fo:block>
            Siemens Healthcare GmbH
          </fo:block>
          <fo:block>
            <xsl:value-of select="doc/vertrag/abteilung" />
          </fo:block>
          <fo:block>
            <xsl:for-each select="doc/vertrag/contacts/contact">
              <xsl:value-of select="name"/>
              <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
          </fo:block>
          <fo:block>Siemensstr. 3</fo:block>
          <fo:block>91301 Forchheim</fo:block>
          <fo:table space-before="1em">
            <fo:table-column />
            <fo:table-column />
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block>
                    <fo:inline>Ansprechpartner: </fo:inline>
                    <fo:inline text-align="right">
                      <xsl:value-of select="doc/head2/erstelltvom"/>
                    </fo:inline>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block text-align="right">
                    <xsl:choose>
                      <xsl:when test="$DocType = '1'">
                        Datum: <xsl:value-of select="doc/head2/auftragsdatum"/>
                      </xsl:when>
                      <xsl:otherwise>
                        Datum: <xsl:value-of select="doc/head2/leistungsdatum"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <fo:block>
            Email:
          </fo:block>
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
          <fo:block space-before="1em">
            <xsl:choose>
              <xsl:when test="$DocType = '1'">
                Im Rahmen Ihrer Bestellung <xsl:value-of select="doc/vertrag/vertragsnr"/> und den fachlichen Besprechungen übernehmen wir die folgenden Arbeiten:
              </xsl:when>
              <xsl:otherwise>
                Im  Rahmen Ihrer Bestellung <xsl:value-of select="doc/vertrag/vertragsnr"/> und den fachlichen Festlegungen (XXXXXXXXXXX) liefern wir Ihnen folgende Positionen:
              </xsl:otherwise>
            </xsl:choose>
          </fo:block>
          <fo:table space-before="1em">
            <fo:table-column border-style="solid" border-width="thin"/>
            <fo:table-column border-style="solid" border-width="thin" column-width="30%"/>
            <fo:table-header background-color="lightgrey">
              <fo:table-cell>
                <fo:block>Aufgabe</fo:block>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block text-align="center">Status</fo:block>
              </fo:table-cell>
            </fo:table-header>
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
                    <fo:block  text-align="center">
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
          <fo:block space-before="1em">Bestätigt durch:</fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>