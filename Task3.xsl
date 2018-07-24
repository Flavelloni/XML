<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html"/>
    <xsl:template match="/">
        <xsl:apply-templates select="secretSocialML"/>
    </xsl:template>


    <xsl:template match="secretSocialML">
        <html>
            <head>
                <h1>Secret Society Platform</h1>
            </head>

            <!-- Users -->
            <head>
                <h2>Users</h2>
            </head>
            <body>
                <xsl:for-each select="user">
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                    <xsl:for-each select="node()[not(self::name)]">
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>

            <!-- Societies -->
            <head>
                <h2>Societies</h2>
            </head>
            <body>
                <xsl:for-each select="society">
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                    <xsl:for-each select="node()[not(self::name)]">
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>

        </html>
    </xsl:template>


</xsl:stylesheet>