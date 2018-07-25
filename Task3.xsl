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

            <!-- ################################## -->
            <!-- Users -->
            <head>
                <h2>Users</h2>
            </head>
            <body>
                <xsl:for-each select="user">
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                    <p>
                        <strong>Sex:</strong>
                        <xsl:value-of select="sex"/>
                    </p>
                    <p>
                        <strong>Date of Birth:</strong>
                        <xsl:value-of select="dateOfBirth"/>
                    </p>
                    <p>
                        <strong>Friends</strong>
                    </p>
                    <xsl:for-each select="friends/userID">
                        <p> - <xsl:value-of select="//user[@id = current()]/name"/></p>
                    </xsl:for-each>
                    <p>
                        <strong>Profession:</strong>
                        <xsl:value-of select="profession"/>
                    </p>
                    <p>
                        <strong>Societies</strong>
                    </p>
                    <xsl:for-each select="societies/socID">
                        <p> - <xsl:value-of select="//society[@id = current()]/name"/></p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>

            <!-- ################################## -->
            <!-- Societies -->
            <head>
                <h2>Societies</h2>
            </head>
            <body>
                <xsl:for-each select="society">
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                    <p>
                        <strong>Description:</strong>
                        <xsl:value-of select="description"/>
                    </p>
                    <p>
                        <strong>Members:</strong>
                    </p>
                    <xsl:for-each select="members/userID">
                        <p> - <xsl:value-of select="//user[@id = current()]/name"/></p>
                    </xsl:for-each>
                </xsl:for-each>
            </body>

        </html>
    </xsl:template>





</xsl:stylesheet>
