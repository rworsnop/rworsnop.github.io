<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet 
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
<xsl:template match="resume">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="simple"
									page-height="11in" 
									page-width="8.5in"
									margin-top="1in" 
									margin-bottom="1in" 
									margin-left="1in" 
									margin-right="1in">
				<fo:region-body margin-top="5mm" margin-bottom="10mm"/>
				<fo:region-before extent="5mm"/>
				<fo:region-after extent="10mm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>	
		
		<fo:page-sequence master-reference="simple">
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align-last="justify" font-size="7pt" color="#A0A0A0" border-top="solid gray 0.5pt" padding-top="5pt">
					<xsl:value-of select="header/name/firstname"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="header/name/lastname"/>					
					<fo:leader/>
					Page <fo:page-number/> of <fo:page-number-citation ref-id="last-page"/> 
				</fo:block>

			</fo:static-content>
			<fo:flow flow-name="xsl-region-body" font="10pt Times">
				<xsl:apply-templates select="header"/>
				<xsl:apply-templates select="skillarea"/>
				<xsl:apply-templates select="objective"/>
				<xsl:apply-templates select="history"/>
				<xsl:apply-templates select="academics"/>	
				<fo:block id="last-page"/>
			</fo:flow>
		</fo:page-sequence>
		


	</fo:root>
</xsl:template>  

<xsl:template match="resume/header">
	<fo:block margin-bottom="10pt" font="24pt Helvetica" font-weight="bold">
		<xsl:value-of select="name/firstname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="name/lastname"/>
	</fo:block>
	<fo:block>
		<xsl:value-of select="address/street"/><fo:block/>
		<xsl:value-of select="address/city"/><fo:block/>
		<xsl:value-of select="address/state"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="address/zip"/><fo:block/>
	</fo:block>
	<fo:block margin-top="10pt" margin-bottom="15pt">	
		<xsl:value-of select="contact/phone"/><fo:block/>
		<fo:basic-link>
			<xsl:attribute name="external-destination">mailto:<xsl:value-of select="contact/email"/></xsl:attribute>
			<xsl:value-of select="contact/email"/><fo:block/>
		</fo:basic-link>
	</fo:block>
</xsl:template>	
  
<xsl:template match="objective">
	<fo:block font="18pt Helvetica" margin-bottom="10pt" font-weight="bold" 
		border-bottom-style="solid" border-bottom-color="grey" 
		border-bottom-width="thin">Objective</fo:block>
	<xsl:apply-templates/>
</xsl:template>  

<xsl:template match="history">
	<fo:block font="18pt Helvetica" margin-bottom="10pt" font-weight="bold" border-bottom-style="solid" 
		border-bottom-color="grey" border-bottom-width="thin">Work History</fo:block>
	<xsl:for-each select="job">
		<fo:block border-style="solid" border-width="0.5mm" border-color="#e0e0fa" margin-bottom="5pt">
			<fo:block margin-top="5pt" font="14pt Helvetica" margin-bottom="10pt" 
				border-bottom-style="solid" border-bottom-width="0.3mm" border-bottom-color="#e0e0fa" font-weight="bold">
				<fo:block margin-left="5pt">
					<xsl:apply-templates select="employer"/>
				</fo:block>	
			</fo:block>
			<fo:block margin-left="15pt">
				<fo:block font-weight="bold">
					<xsl:value-of select="location/city"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="location/state"/>
					<xsl:value-of select="location/county"/>
					<xsl:if test="location/country != 'USA'">
					<xsl:text>, </xsl:text>
					<xsl:value-of select="location/country"/>
					</xsl:if>
					<fo:block/>
					<xsl:apply-templates select="period"/>
					<fo:block/>
					<xsl:value-of select="jobtitle"/>
					<fo:block/>
				</fo:block>
				<fo:block margin-left="30pt" margin-bottom="10pt" font-style="italic">
					<xsl:apply-templates select="description"/>
				</fo:block>	
				<xsl:apply-templates select="projects"/>
				<xsl:apply-templates select="achievements"/>	
			</fo:block>
		</fo:block>
	</xsl:for-each>
</xsl:template>

<xsl:template match="achievements">
	<fo:block font="12pt Helvetica" margin-bottom="10pt" font-weight="bold">Responsibilities and achievements</fo:block>
	<fo:list-block margin-bottom="15pt">
		<xsl:for-each select="achievement">
			<fo:list-item start-indent="25pt">
				<fo:list-item-label>
					<fo:block>&#x2022;</fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block margin-left="10pt">
						<xsl:apply-templates/>
					</fo:block>
				</fo:list-item-body>	
			</fo:list-item>		
		</xsl:for-each>	
	</fo:list-block>
</xsl:template>

<xsl:template match="projects">
	<fo:block font="12pt Helvetica" margin-bottom="10pt" font-weight="bold">Projects</fo:block>
	<fo:list-block margin-bottom="15pt">
		<xsl:for-each select="project">
			<fo:list-item start-indent="25pt">
				<fo:list-item-label>
					<fo:block>&#x2022;</fo:block>
				</fo:list-item-label>
				<fo:list-item-body>
					<fo:block margin-left="10pt" margin-right="10pt">
						<xsl:apply-templates/>
					</fo:block>
				</fo:list-item-body>	
			</fo:list-item>		
		</xsl:for-each>	
	</fo:list-block>
</xsl:template>

<xsl:template match="academics">
	<fo:block font="18pt Helvetica" margin-bottom="10pt" font-weight="bold" border-bottom-style="solid" 
		border-bottom-color="grey" border-bottom-width="thin">Education</fo:block>
	<xsl:apply-templates select="degrees"/>
</xsl:template>

<xsl:template match="degrees">
	<xsl:for-each select="degree">
		<fo:block font="14pt Helvetica" margin-bottom="10pt" font-weight="bold">
			<xsl:apply-templates select="institution"/>
		</fo:block >
		<fo:block>
			<xsl:value-of select="level"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="major"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="date/year"/>
		</fo:block>
	</xsl:for-each>
</xsl:template>

<xsl:template match="skillarea">
	<fo:block font="18pt Helvetica" margin-bottom="10pt" font-weight="bold" 
		border-bottom-style="solid" border-bottom-color="grey" border-bottom-width="thin">
		<xsl:value-of select="title"/>
	</fo:block>
	<fo:block margin-bottom="15pt">
		<xsl:for-each select="skillset/skill">
			<xsl:value-of select="."/> 
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</fo:block>
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
	<fo:basic-link>
		<xsl:attribute name="external-destination"><xsl:value-of select="@href"/></xsl:attribute>
		<xsl:value-of select="."/>
	</fo:basic-link>
</xsl:template>

<xsl:template match="para">
	<fo:block margin-bottom="15pt">
	  <xsl:apply-templates/>
	</fo:block>
</xsl:template>
  
</xsl:stylesheet> 