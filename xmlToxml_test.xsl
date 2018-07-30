<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--
    Modify the Austin Powers TOC and generate a new XML file.
    -->
    <xsl:output method="xml"/>
    <!-- This new default template does a manual deep copy
    of the node contents -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <!-- Panel elements should be renamed -->
    <xsl:template match="panel">
        <subsection>
            <!-- Because we apply templates to attribute nodes,
            attributes of panel *will* be copied to subsection. -->
            <xsl:apply-templates select="node() | @*"/>
        </subsection>
    </xsl:template>
    <!-- Subsection titles have a different format - the
    text should be in an attribute not a text node -->
    <xsl:template match="panel/title">
        <xsl:copy>
            <!-- Create the attribute -->
            <xsl:attribute name="name">
                <xsl:value-of select="text()"/>
            </xsl:attribute>
            <!-- Apply templates to everything except the text content and name attributes -->
            <xsl:apply-templates
                select="@*[name() != 'name'] | * | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
