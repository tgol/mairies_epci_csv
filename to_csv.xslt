<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="no"></xsl:output>
<!-- template -->
<xsl:template match="/">
"<xsl:for-each select="Organisme/Nom"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/Adresse/Ligne"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/Adresse/CodePostal"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/Adresse/NomCommune"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/CoordonnéesNum/Téléphone"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/CoordonnéesNum/Télécopie"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/CoordonnéesNum/Email"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/CoordonnéesNum/Url"><xsl:value-of select="normalize-space(.)"></xsl:value-of><xsl:if test="position() != last()">&#xA0;</xsl:if></xsl:for-each>",
"<xsl:for-each select="Organisme/Ouverture/PlageJ">
<xsl:value-of select="normalize-space(@début)"></xsl:value-of>-<xsl:value-of select="normalize-space(@fin)"></xsl:value-of>&#xA0;
<xsl:for-each select="PlageH">
	<xsl:value-of select="normalize-space(@début)"></xsl:value-of>-<xsl:value-of select="normalize-space(@fin)"></xsl:value-of>
	<xsl:if test="position() != last()">&#xA0;</xsl:if>
</xsl:for-each>
<xsl:if test="position() != last()">&#xA0;|&#xA0;</xsl:if>
</xsl:for-each>"
</xsl:template>
</xsl:stylesheet>



