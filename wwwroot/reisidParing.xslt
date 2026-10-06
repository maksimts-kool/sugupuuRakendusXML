<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <h2>Lennureisid</h2>

    <!-- ainult lennureisid, kõrgema hinnanguga reis eespool -->
    <xsl:for-each select="reisid/reis[transport = 'lennuk']">
      <xsl:sort select="hinnang" data-type="number" order="descending"/>

      <h1><xsl:value-of select="suund/riik"/></h1>
      <ul>
        <li style="background-color: yellow;">Riik: <xsl:value-of select="suund/riik"/></li>
        <li style="background-color: yellow;">
          Kestvus: <xsl:value-of select="suund/kestvus"/> päeva
          <!-- oma tingimus: üle 7 päeva on pikk reis -->
          <xsl:if test="suund/kestvus &gt; 7">
            <strong style="color: red;"> - Pikk reis</strong>
          </xsl:if>
        </li>
        <li>Transport: <xsl:value-of select="transport"/></li>
        <li>Majutus: <xsl:value-of select="majutus"/></li>
        <li>Reisihind: <xsl:value-of select="reisihind"/> €</li>
        <li>Ekskursioonid: <xsl:value-of select="ekskursioonid"/> €</li>
        <li>Muud kulud: <xsl:value-of select="muudKulud"/> €</li>
        <li>Hinnang: <xsl:value-of select="hinnang"/></li>
        <li>
          <strong>Kogumaksumus: <xsl:value-of select="reisihind + ekskursioonid + muudKulud"/> €</strong>
        </li>
      </ul>
    </xsl:for-each>

    <h2>Kõik reisid</h2>
    <table class="table">
      <thead>
        <tr>
          <th>Riik</th>
          <th>Kestvus</th>
          <th>Transport</th>
          <th>Majutus</th>
          <th>Reisihind</th>
          <th>Ekskursioonid</th>
          <th>Muud kulud</th>
          <th>Hinnang</th>
          <th>Kogumaksumus</th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="reisid/reis">
          <tr>
            <!-- üle rea erinev taustavärv -->
            <xsl:if test="position() mod 2 = 1">
              <xsl:attribute name="style">background-color: #cfe8ff;</xsl:attribute>
            </xsl:if>
            <td><xsl:value-of select="suund/riik"/></td>
            <td><xsl:value-of select="suund/kestvus"/> päeva</td>
            <td><xsl:value-of select="transport"/></td>
            <td><xsl:value-of select="majutus"/></td>
            <td><xsl:value-of select="reisihind"/> €</td>
            <td><xsl:value-of select="ekskursioonid"/> €</td>
            <td><xsl:value-of select="muudKulud"/> €</td>
            <td><xsl:value-of select="hinnang"/></td>
            <td><xsl:value-of select="reisihind + ekskursioonid + muudKulud"/> €</td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
</xsl:stylesheet>
