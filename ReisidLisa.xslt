<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<style>
					.highlight {
					background-color: yellow;
					}
					.high {
					width: 30%;
					}
					.even {
					background-color: #f2f2f2;
					}
					.odd {
					background-color: #ffffff;
					}
				</style>
			</head>
			<body>
				<div class="high">
					<xsl:for-each select="Reisid/Reis[number(translate(translate(@Hind, '€,', ''), ',', '.')) &lt; 3000]">
						<xsl:sort select="number(translate(translate(@Hind, '€,', ''), ',', '.'))" data-type="number" order="ascending"/>
						<h1>
							<xsl:value-of select="Sihtkoht/Linn"/> - <xsl:value-of select="Sihtkoht/Riik"/>
						</h1>
						<ul>
							<li>
								Aeg: <xsl:value-of select="@Aeg"/>
							</li>
							<li>
								Alguskuupäev: <xsl:value-of select="Kuupaevad/Alguskuupaev"/>
							</li>
							<li>
								Lõppkuupäev: <xsl:value-of select="Kuupaevad/Loppkuupaev"/>
							</li>
							<li>
								Lennujaam: <xsl:value-of select="Transport/Lennujaam"/>
							</li>
						</ul>
						<xsl:choose>
							<xsl:when test="number(translate(translate(@Hind, '€,', ''), ',', '.')) &gt;= 1500">
								VIP pakkumine
							</xsl:when>
							<xsl:otherwise>
								Soodne pakkumine
							</xsl:otherwise>
						</xsl:choose>
						<p>
							Kogumaksumus: <xsl:value-of select="@Hind"/>
						</p>
					</xsl:for-each>
				</div>

				<table border="1">
					<tr>
						<th>Reis ID</th>
						<th>Aeg</th>
						<th>Alguskuupäev</th>
						<th>Lõppkuupäev</th>
						<th>Sihtkoht</th>
						<th>Hind</th>
					</tr>
					<xsl:for-each select="Reisid/Reis">
						<xsl:sort select="number(translate(translate(@Hind, '€,', ''), ',', '.'))" data-type="number" order="ascending"/>
						<xsl:variable name="rowClass">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 0">even</xsl:when>
								<xsl:otherwise>odd</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<tr class="{$rowClass}">
							<td>
								<xsl:value-of select="@reisID"/>
							</td>
							<td>
								<xsl:value-of select="@Aeg"/>
							</td>
							<td>
								<xsl:value-of select="Kuupaevad/Alguskuupaev"/>
							</td>
							<td>
								<xsl:value-of select="Kuupaevad/Loppkuupaev"/>
							</td>
							<td>
								<xsl:value-of select="Sihtkoht/Linn"/> - <xsl:value-of select="Sihtkoht/Riik"/>
							</td>
							<td>
								<xsl:value-of select="@Hind"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
