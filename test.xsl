<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    <xsl:template match="/">
        <xsl:apply-templates select="friends"/>
    </xsl:template>
    
    <xsl:template match="friends">
        <html>
            <head><h1>My Homies</h1></head>
            <body>
                <xsl:for-each select="friend">
                    <p>
                        - der hier: <xsl:value-of select="."/>
                    </p>
                </xsl:for-each>
                <p>
                    - Anzahl: <xsl:value-of select="count(friend)"/>
                </p>
                <p>
                    - Anzahl im Quadrat: <xsl:call-template name="square">
                        <xsl:with-param name="x">
                            <xsl:value-of select="count(friend)"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </p>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="square">
        <xsl:param name="x"/>
        
        <xsl:value-of select="$x*$x"/>
    </xsl:template>
    
</xsl:stylesheet>