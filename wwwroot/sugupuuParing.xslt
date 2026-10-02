<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

  <xsl:param name="aasta"/>

  <xsl:template match="/">
    <ul class="sugupuu">
      <xsl:apply-templates select="inimene"/>
    </ul>
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
