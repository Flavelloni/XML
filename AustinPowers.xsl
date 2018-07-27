<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    
    <!--  
    <xsl:template match="tutorial">
        <xsl:for-each select="section">
            <h1>
                <xsl:text> Section </xsl:text>
                <xsl:value-of select="position()"/>
                <xsl:text>. </xsl:text>
            </h1>
            <ul>
                <xsl:for-each select="panel">
                    <li>
                        <xsl:value-of select="position()"/>
                        <xsl:text>: </xsl:text>
                        <xsl:value-of select="title"/>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:for-each>
    </xsl:template>
    -->
    
    <xsl:template match="tutorial">
        <xsl:apply-templates select="section"/>
    </xsl:template>
    
    <xsl:template match="section">
        <h1>
            <xsl:text> Section </xsl:text>
            <xsl:value-of select="position()"/>
            <xsl:text>. </xsl:text>
        </h1>
        <ul>
            <xsl:apply-templates select="panel"/>
        </ul>
    </xsl:template>
    
    <xsl:template match="panel">
        <li>
            <xsl:value-of select="position()"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="title"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>