<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

  <xsl:param name="aasta"/>

  <xsl:template match="/">
    <ul class="sugupuu">
      <xsl:apply-templates select="inimene"/>
    </ul>
    <h2>Esitähed</h2>
    <ol>
      <xsl:for-each select="//inimene">
        <li>
          <xsl:value-of select="substring(nimi, 1, 1)"/>
        </li>
      </xsl:for-each>
    </ol>
    <h2>Nimed ja tähtede arv</h2>
    <ol>
      <xsl:for-each select="//inimene">
        <li>
          <xsl:value-of select="nimi"/>
          <xsl:text> - </xsl:text>
          <xsl:value-of select="string-length(translate(nimi, ' ', ''))"/>
          <xsl:text> tähte</xsl:text>
        </li>
      </xsl:for-each>
    </ol>
  </xsl:template>

  <xsl:template match="inimene">
    <li>
      <xsl:value-of select="nimi"/>
      <xsl:if test="@synd">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@synd"/>
        <xsl:text>, vanus </xsl:text>
        <xsl:value-of select="$aasta - @synd"/>
        <xsl:text>)</xsl:text>
      </xsl:if>
      <xsl:if test="lapsed/inimene">
        <ul>
          <xsl:apply-templates select="lapsed/inimene"/>
        </ul>
      </xsl:if>
    </li>
  </xsl:template>
</xsl:stylesheet>
