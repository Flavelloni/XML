<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <!-- ########################### -->
    <!-- copy -->
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>


    <!-- ########################### -->
    <!-- extend original file -->
    
    <xsl:template match="user/friends/userID">
        <!-- friends -->
        <friend>
            <xsl:copy-of select="current()"/>
            <distance>1</distance>
        </friend>
        
        <!-- friends of friends -->
        <xsl:call-template name="friendsOfFriend">
            <xsl:with-param name="friendID" select="text()"/>
            <xsl:with-param name="selfID" select="../../@id"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="friendsOfFriend">
        <xsl:param name="friendID"/>
        <xsl:param name="selfID"/>
        
        <xsl:comment>friends of friend</xsl:comment>
        <xsl:for-each select="//user[@id=$friendID]/friends/userID[not(text()=$selfID)]">
            <friend>
               <userID><xsl:value-of select="text()"/></userID>
               <distance>2</distance>
            </friend>
        </xsl:for-each>
        <xsl:comment></xsl:comment>
        
    </xsl:template>
    

</xsl:stylesheet>
