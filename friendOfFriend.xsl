<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="user/friends">
        <friends>
            <xsl:apply-templates select="userID"/>
        </friends>
    </xsl:template>
    
    <xsl:template match="user/friends/userID">
        <friend>
            <xsl:copy-of select="current()"/>
            <distance>1</distance>
        </friend>
    </xsl:template>
    
</xsl:stylesheet>
