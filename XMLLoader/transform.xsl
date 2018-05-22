<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:theia="http://www.theia.org.uk/ILR/2012-13/1"
                version="1.0">
  <xsl:output method="xml"
              omit-xml-declaration="yes"/>
  <xsl:template match="theia:Learner | theia:LearnerContact | theia:LearnerEmploymentStatus | theia:LearningDelivery">
    <xsl:copy>
      <xsl:attribute name="uid">
        <xsl:value-of select="generate-id(.)"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
