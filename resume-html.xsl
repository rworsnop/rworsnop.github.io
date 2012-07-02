<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
 
<xsl:output method="xml" indent="yes" encoding="ISO-8859-1"/>


<xsl:template match="resume">
	<html>
		<head>
			<link rel="stylesheet" type="text/css" href="style.css" />

			<title>
				<xsl:text>R&#233;sum&#233; of </xsl:text>
				<xsl:value-of select="header/name/firstname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="header/name/lastname"/>
			</title>
		</head>
		<body>
			<div class="mainPage">
				<xsl:apply-templates select="header"/>
				<xsl:apply-templates select="skillarea"/>
				<xsl:apply-templates select="objective"/>
				<xsl:apply-templates select="history"/>
				<xsl:apply-templates select="academics"/>
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template match="resume/header">
	<h1>
		<xsl:value-of select="name/firstname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="name/lastname"/>
	</h1>
	<p>
		<xsl:value-of select="address/street"/>
		<br/>
		<xsl:value-of select="address/city"/>
		<br/>
		<xsl:value-of select="address/state"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="address/zip"/>
	</p>
	<p>
		<xsl:value-of select="contact/phone"/>
		<br/>
		<a> 
			<xsl:attribute name="href">mailto:<xsl:value-of select="contact/email"/></xsl:attribute>
			<xsl:value-of select="contact/email"/>
		</a>
	</p>
</xsl:template>	

<xsl:template match="objective">
	<h2>Objective</h2>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="history">
	<h2>Work History</h2>
	<xsl:for-each select="job">
		<div style="border:2px solid #e0e0fa; margin-bottom:6pt;">
			<h3 style="text-indent:10pt;border-bottom:1.5px solid #e0e0fa;margin-top:1px">
				<xsl:apply-templates select="employer"/>
			</h3>
			<div style="margin-left:20pt; margin-right:10pt;">
				<div style="font-weight:bold">
					<xsl:value-of select="location/city"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="location/state"/>
					<xsl:value-of select="location/county"/>
					<xsl:if test="location/country != 'USA'">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="location/country"/>
					</xsl:if>
					<br/>
					<xsl:apply-templates select="period"/>
					<br/>
					<xsl:value-of select="jobtitle"/>
					<br/>
				</div>
				<div style="margin-left:30pt; font-style:italic">
					<xsl:apply-templates select="description"/>
				</div>	
				<xsl:apply-templates select="projects"/>
				<xsl:apply-templates select="achievements"/>	
			</div>
		</div>
	</xsl:for-each>
</xsl:template>

<xsl:template match="achievements">
	<h4>Responsibilities and achievements</h4>
	<ul>
	<xsl:for-each select="achievement">
		<li>
			<xsl:apply-templates/>
		</li>
	</xsl:for-each>	
	</ul>
</xsl:template>

<xsl:template match="projects">
	<h4>Projects</h4>
	<ul>
	<xsl:for-each select="project">
		<li>
			<xsl:apply-templates/>
		</li>
	</xsl:for-each>	
	</ul>
</xsl:template>

<xsl:template match="academics">
	<h2>Education</h2>
	<xsl:apply-templates select="degrees"/>
</xsl:template>

<xsl:template match="degrees">
	<xsl:for-each select="degree">
		<h3>
			<xsl:apply-templates select="institution"/>
		</h3>
		<xsl:value-of select="level"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="major"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="date/year"/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="skillarea">
	<h2>
		<xsl:value-of select="title"/>
	</h2>
	<xsl:for-each select="skillset/skill">
		<xsl:value-of select="."/> 
		<xsl:if test="position()!=last()">, </xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="period">
	<xsl:apply-templates select="from"/>
	<xsl:text> - </xsl:text>
	<xsl:apply-templates select="to"/>
</xsl:template>

<xsl:template match="date">
	<xsl:value-of select="month"/>
	<xsl:text>, </xsl:text>
	<xsl:value-of select="year"/>
</xsl:template>

<xsl:template match="present">
	<xsl:text>Present</xsl:text>
</xsl:template>

<xsl:template match="link">
	<a>
		<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
		<xsl:value-of select="."/>
	</a>
</xsl:template>

<xsl:template match="para">
	<p>
	  <xsl:apply-templates/>
	</p>
</xsl:template>

</xsl:stylesheet>
