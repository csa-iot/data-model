<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Connectivity Standards Alliance owns the copyright to the text and content displayed or
included in this document (including in PDF, XML files and other formats) in 
all forms of media, which copyright is protected by the copyright laws of the 
United States and by international treaties.  Full text of licensing terms 
applicable to this document can be found in the LICENSE.md file.
-->
<xsl:stylesheet version="1.0"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xi="http://www.w3.org/2001/XInclude"
	xmlns:zcl="http://zigbee.org/zcl/clusters"
	xmlns:type="http://zigbee.org/zcl/types">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:variable name="clusterSchema" select="document('cluster.xsd')" />
<xsl:variable name="typeSchema" select="document('type.xsd')" />

<xsl:template match="command">
	<h5><xsl:value-of select="@name" /></h5>
	<xsl:choose>
		<xsl:when test="count(fields/field) > 0">
			<table border="1">
				<tr>
					<th>Octets</th>	
					<xsl:for-each select="fields/field">
						<xsl:if test="@array = 'true' and @arrayLengthSize > 0"><td><xsl:value-of select="@arrayLengthSize" /></td></xsl:if>
						<td><xsl:if test="@presentIf">0/</xsl:if></td>
						<xsl:if test="@array = 'true'">
							<td>...</td>
							<td></td>
						</xsl:if>
					</xsl:for-each>
				</tr>
				<tr>
					<th>Data Type</th>
					<xsl:for-each select="fields/field">
					<xsl:if test="@array = 'true' and @arrayLengthSize > 0"><td>type</td></xsl:if>
					<td><xsl:value-of select="@type" /></td>
					<xsl:if test="@array = 'true'">
						<td>...</td>
						<td><xsl:value-of select="@type" /></td>
					</xsl:if>
					</xsl:for-each>
				</tr>
				<tr>
					<th>Field Name</th>
					<xsl:for-each select="fields/field">
					<xsl:if test="@array = 'true' and @arrayLengthSize > 0"><td>arrLen</td></xsl:if>
					<td><xsl:value-of select="@name" /><xsl:if test="@array = 'true'">(1)</xsl:if></td>
					<xsl:if test="@array = 'true'">
					<td>...</td>
					<td><xsl:value-of select="@name" />(n)</td></xsl:if>
					</xsl:for-each>
				</tr>
			</table>
			
			<xsl:for-each select="fields/field">
				<h6><xsl:value-of select="@name" /></h6>
				<!-- Name, type, array, arrayLengthSize, presentIf -->
				<xsl:if test="bittmap">Has Bitmap</xsl:if>
				<xsl:if test="restriction">Has Restriction</xsl:if>
				
				<!--  
				
				  <xs:complexType name="BitmapField">
	<xs:sequence>
		<xs:element name="restriction" type="zclType:restrictionType"
			minOccurs="0" maxOccurs="1" />
	</xs:sequence>
	<xs:attribute name="name" type="zclType:NamedElement"
		use="required" />
	<xs:attribute name="type" type="xs:string" use="required" />
	<xs:attribute name="mask" type="xs:hexBinary" use="required" /> 
	<xs:attribute name="shiftRight" type="xs:unsignedByte" use="optional" default="0" />
  </xs:complexType>
  
  <xs:complexType name="CommandField">
	<xs:choice>
		<xs:element name="bitmap" type="zclType:BitmapDefinition"
			minOccurs="0" maxOccurs="1" />
		<xs:element name="restriction" type="zclType:restrictionType"
			minOccurs="0" maxOccurs="1" />
	</xs:choice>
	<xs:attribute name="name" type="zclType:NamedElement"
		use="required" />
	<xs:attribute name="type" type="xs:string" use="required" />
	<xs:attribute name="array" type="xs:boolean"
		use="optional" default="false" />
	<xs:attribute name="arrayLengthSize" type="xs:unsignedByte" 
		use="optional" default="1" />
	<xs:attribute name="presentIf" type="zclType:DependencyExpression" 
		use="optional" default="true" />
  </xs:complexType>
  
  
				
				
				  -->
			</xsl:for-each>
		</xsl:when>
		<xsl:otherwise>This command does not have a payload.</xsl:otherwise>
	</xsl:choose>

	
</xsl:template>

<xsl:template match="server | client | global">
	<h4>Attributes</h4>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Type</th>
				<th>Range</th>
				<th>Acc</th>
				<th>Default</th>
				<th>M/O</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="./attributes/attribute">
				<xsl:variable name="readable">
					<xsl:choose>
						<xsl:when test="@readable"><xsl:value-of select="@readable = true()" /></xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$clusterSchema//xs:complexType[@name='Attribute']/xs:attribute[@name='readable']/@default = true()" />
						</xsl:otherwise>
					</xsl:choose>				
				</xsl:variable>
				<xsl:variable name="writable">
					<xsl:choose>
						<xsl:when test="@writable"><xsl:value-of select="@writable" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="$clusterSchema//xs:complexType[@name='Attribute']/xs:attribute[@name='writable']/@default" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="writeOptional">
					<xsl:choose>
						<xsl:when test="@writeOptional"><xsl:value-of select="@writeOptional" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="$clusterSchema//xs:complexType[@name='Attribute']/xs:attribute[@name='writeOptional']/@default" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="reportRequired">
					<xsl:choose>
						<xsl:when test="@reportRequired"><xsl:value-of select="@reportRequired" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="$clusterSchema//xs:complexType[@name='Attribute']/xs:attribute[@name='reportRequired']/@default" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="sceneRequired">
					<xsl:choose>
						<xsl:when test="@sceneRequired"><xsl:value-of select="@sceneRequired" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="$clusterSchema//xs:complexType[@name='Attribute']/xs:attribute[@name='sceneRequired']/@default" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="required">
					<xsl:choose>
						<xsl:when test="@required"><xsl:value-of select="@required" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="$clusterSchema//xs:complexType[@name='Attribute']/xs:attribute[@name='required']/@default" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
			<tr>
				<td>0x<xsl:value-of select="@id" /></td>
				<td><xsl:value-of select="@name" /></td>
				<td><xsl:value-of select="@type" /></td>
				<td></td>
				<td>
					<xsl:choose>
						<xsl:when test="($readable = 'true') and not($writable = 'true')">R</xsl:when>
						<xsl:when test="($readable = 'true') and ($writable = 'true') and ($writeOptional = 'true')">R*W</xsl:when>
						<xsl:when test="($readable = 'true') and ($writable = 'true') and ($writeOptional != 'true')">RW</xsl:when>
						<xsl:otherwise></xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$reportRequired = 'true'">P</xsl:if>
					<xsl:if test="$sceneRequired = 'true'">S</xsl:if>
				</td>
				<td><xsl:value-of select="@default" /></td>
				<td>
					<xsl:choose>
						<xsl:when test="($required = 'true')">M</xsl:when>
						<xsl:otherwise>O</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			</xsl:for-each>
		</tbody>
	</table>
	<h4>Commands Received</h4>
	<table border="1">
		<thead>
			<tr>
				<th>Command Identifier</th>
				<th>Name</th>
				<th>M/O</th>
			</tr>
		</thead>
		<tbody>
			<xsl:for-each select="./commands/command">
				<xsl:variable name="required">
					<xsl:choose>
						<xsl:when test="@required"><xsl:value-of select="@required" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="$clusterSchema//xs:complexType[@name='Command']/xs:attribute[@name='required']/@default" /></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
			<tr>
				<td>0x<xsl:value-of select="@id" /></td>
				<td><xsl:value-of select="@name" /></td>
				<td>
					<xsl:choose>
						<xsl:when test="$required = 'true'">M</xsl:when>
						<xsl:otherwise>O</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			</xsl:for-each>
		</tbody>
	</table>
	
	<xsl:for-each select="./commands/command">
		<xsl:apply-templates select="." />
	</xsl:for-each>
</xsl:template>

<xsl:template match="/">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html>
<head>
<meta charset="UTF-8" />
<title>Title of the document</title>
</head>
<body>

<h1>Types</h1>
<table border="1">
<thead>
	<tr>
		<td>id</td>
		<td>short</td>
		<td>name</td>
	</tr>
</thead>
<tbody>
<xsl:for-each select="zcl:library/type:type">
<tr>
	<td><a name="type-{@short}" /><xsl:value-of select="@id" /></td>
	<td><xsl:value-of select="@short" /></td>
	<td><xsl:value-of select="@name" /></td>
</tr>
</xsl:for-each>
</tbody>
</table>

<h1>Clusters</h1>
<xsl:for-each select="zcl:library/xi:include">
	<xsl:for-each select="document(@href)//zcl:global">
		<h2>General</h2>
		<xsl:apply-templates select="." />
	</xsl:for-each>
	<xsl:for-each select="document(@href)//zcl:cluster">
		<h2><xsl:value-of select="@id" /> - <xsl:value-of select="@name" /></h2>
		<h3>Server</h3>
		<xsl:apply-templates select="server" />
		<h3>Client</h3>
		<xsl:apply-templates select="client" />
	</xsl:for-each>
	<hr />
</xsl:for-each>
</body>
</html>
</xsl:template>

</xsl:stylesheet>