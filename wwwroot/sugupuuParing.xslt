<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

  <xsl:param name="aasta"/>
  <xsl:param name="otsing" select="'li'" />
  <xsl:param name="pikkus" select="'6'" />

  <xsl:template match="/">
    <ul class="sugupuu">
      <xsl:for-each select="//inimene[@surm]">
        <li><xsl:value-of select="concat(nimi, ' (', @synd, '-', @surm, ', vanus oli ', @surm - @synd, ')')"/></li>
      </xsl:for-each>
      <xsl:for-each select="//inimene[not(@surm)]">
        <li><xsl:value-of select="concat(nimi, ' (', @synd, ', vanus ', $aasta - @synd, ')')"/></li>
      </xsl:for-each>
    </ul>
    <h2>Näita kõik nimed mis algavad tähega "C"</h2>
    <ul class="sugupuu">
      <xsl:for-each select="//inimene[starts-with(nimi, 'C')]">
        <li><xsl:value-of select="nimi"/></li>
      </xsl:for-each>
    </ul>
    <h2>Parametrite kasutamine</h2>
    <h3>Otsitakse kõiki nimesid, mis sisaldavad tähemärki <strong><xsl:value-of select="$otsing"/></strong></h3>
    <ul class="sugupuu">
      <xsl:for-each select="//inimene[contains(nimi, $otsing)]">
        <li><xsl:value-of select="nimi"/></li>
      </xsl:for-each>
    </ul>
    <h3>Otsitakse kõiki nimesid, mis on pikemad kui <strong><xsl:value-of select="$pikkus"/></strong> tähemärki</h3>
    <ul class="sugupuu">
      <xsl:for-each select="//inimene[string-length(nimi) &gt; $pikkus]">
        <li><xsl:value-of select="concat(nimi, ' (', string-length(nimi), ' tähemärki)')"/></li>
      </xsl:for-each>
    </ul>
    <h3>Kasutame if lause: Iga inimese näitame mitmendal oma vanema sünnipäeval ta sündis</h3>
    <ul class="sugupuu">
      <xsl:for-each select="//inimene">
        <li>
          <xsl:value-of select="nimi"/>
          <xsl:if test="../..">
            <xsl:text> - vanema vanus oli </xsl:text>
            <xsl:value-of select="@synd - ../../@synd"/>
          </xsl:if>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>
