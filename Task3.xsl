<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="html"/>
    
    <!-- ################################## -->
    <!-- Main -->
    <xsl:template match="/">
        <html>
            <head>
                <h1>Secret Society Platform</h1>
            </head>

            <body>
                <h2>Users</h2>
                <xsl:apply-templates select="*/user"/>

                <h2>Societies</h2>
                <xsl:apply-templates select="*/society"/>
            </body>
        </html>
    </xsl:template>


    <!-- ################################## -->
    <!-- Users -->
    <xsl:template match="user">
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
        <xsl:apply-templates select="friends/userID"/>
        <p>
            <strong>Profession:</strong>
            <xsl:value-of select="profession"/>
        </p>
        <p>
            <strong>Societies</strong>
        </p>
        <xsl:apply-templates select="societies/socID"/>
    </xsl:template>

    <xsl:template match="userID">
        <p> - <xsl:value-of select="//user[@id = current()]/name"/></p>
    </xsl:template>

    <xsl:template match="societies/socID">
        <p> - <xsl:value-of select="//society[@id = current()]/name"/></p>
    </xsl:template>

    <!-- ################################## -->
    <!-- Societies -->
    <xsl:template match="society">
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
        <xsl:apply-templates select="members/userID"/>
    </xsl:template>


</xsl:stylesheet>
