<?xml version="1.0" encoding="UTF-8"?>
<!--Designed and generated by Altova StyleVision Enterprise Edition 2008 rel. 2 - see http://www.altova.com/stylevision for more information.-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:award="http://subcontractFdpReports.bean.xml.utils.coeus.mit.edu/award" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:subcontract="http://subcontractFdpReports.bean.xml.utils.coeus.mit.edu/subcontract" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:output version="1.0" method="xml" encoding="UTF-8" indent="no"/>
	<xsl:param name="SV_OutputFormat" select="'PDF'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:variable name="fo:layout-master-set">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="default-page" page-height="11in" page-width="8.5in" margin-left="0.2in" margin-right="0.2in">
				<fo:region-body margin-top="0.5in" margin-bottom="0.79in"/>
				<fo:region-before extent="0.5in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:variable>
	<xsl:template match="/">
		<fo:root>
			<xsl:copy-of select="$fo:layout-master-set"/>
			<fo:page-sequence master-reference="default-page" initial-page-number="1" format="1">
				<xsl:call-template name="headerall"/>
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:block/>
						<xsl:for-each select="$XML">
							<fo:inline-container>
								<fo:block>
									<xsl:text>&#x2029;</xsl:text>
								</fo:block>
							</fo:inline-container>
							<fo:table font-family="Arial" font-size="9pt" table-layout="fixed" width="90%" border-spacing="2pt">
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-body start-indent="0pt">
									<fo:table-row font-family="Arial">
										<fo:table-cell font-family="Arial" number-columns-spanned="9" padding="2pt" height="32" text-align="right" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:block text-align="center" margin="0pt">
													<fo:block>
														<fo:inline-container>
															<fo:block>
																<xsl:text>&#x2029;</xsl:text>
															</fo:block>
														</fo:inline-container>
														<fo:block font-size="small" font-weight="bold" margin="0pt">
															<fo:block>
																<fo:inline>
																	<xsl:text>Attachment 3B - Research Subaward Agreement</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:block>
													</fo:block>
												</fo:block>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="9" padding="2pt" text-align="right" display-align="center">
											<fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:block text-align="center" margin="0pt">
													<fo:block>
														<fo:inline-container>
															<fo:block>
																<xsl:text>&#x2029;</xsl:text>
															</fo:block>
														</fo:inline-container>
														<fo:block font-size="small" font-weight="bold" margin="0pt">
															<fo:block>
																<fo:inline>
																	<xsl:text>Page 2 - Place of Performance &amp; Highest Compensated Officers</xsl:text>
																</fo:inline>
															</fo:block>
														</fo:block>
													</fo:block>
												</fo:block>
												<fo:inline>
													<xsl:text>Subaward Number: </xsl:text>
												</fo:inline>
												<xsl:for-each select="subcontract:SubContractData">
													<xsl:for-each select="subcontract:SubcontractDetail">
														<xsl:for-each select="subcontract:PONumber">
															<xsl:variable name="value-of-template">
																<xsl:apply-templates/>
															</xsl:variable>
															<xsl:choose>
																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																	<fo:block>
																		<xsl:copy-of select="$value-of-template"/>
																	</fo:block>
																</xsl:when>
																<xsl:otherwise>
																	<fo:inline>
																		<xsl:copy-of select="$value-of-template"/>
																	</fo:inline>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell number-columns-spanned="9" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline>
													<xsl:text>Institution/Organization (&quot;Subrecipient&quot;) </xsl:text>
												</fo:inline>
												<fo:block/>
												<fo:inline>
													<xsl:text>Name:&#160; </xsl:text>
												</fo:inline>
												<xsl:for-each select="subcontract:SubContractData">
													<xsl:for-each select="subcontract:SubcontractDetail">
														<xsl:for-each select="subcontract:SubcontractorName">
															<xsl:variable name="value-of-template">
																<xsl:apply-templates/>
															</xsl:variable>
															<xsl:choose>
																<xsl:when test="contains(string($value-of-template),'&#x2029;')">
																	<fo:block>
																		<xsl:copy-of select="$value-of-template"/>
																	</fo:block>
																</xsl:when>
																<xsl:otherwise>
																	<fo:inline>
																		<xsl:copy-of select="$value-of-template"/>
																	</fo:inline>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
												<fo:block/>
												<fo:block text-align="center">
													<fo:leader leader-pattern="rule" rule-thickness="1" leader-length="100%" color="black"/>
												</fo:block>
												<fo:inline>
													<xsl:text>Place of Performance</xsl:text>
												</fo:inline>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table font-family="Arial" font-size="9pt" table-layout="fixed" width="100%" border-spacing="2pt">
													<fo:table-column column-width="8%"/>
													<fo:table-column column-width="30%"/>
													<fo:table-column column-width="5%"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="12%"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-column column-width="proportional-column-width(1)"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell number-columns-spanned="13" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Name:&#160;&#160;&#160;&#160; </xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell number-columns-spanned="13" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Address: </xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:inline>
																		<xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; </xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>City:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>State:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell number-columns-spanned="3" padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell number-columns-spanned="7" padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Zip Code +4:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Telephone: </xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Fax:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell number-columns-spanned="3" padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell number-columns-spanned="6" padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Email: </xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell number-columns-spanned="3" padding="2pt" text-align="left" display-align="center">
																<fo:block/>
															</fo:table-cell>
															<fo:table-cell number-columns-spanned="7" padding="2pt" text-align="left" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>Congressional District:</xsl:text>
																	</fo:inline>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
												<fo:block text-align="center">
													<fo:leader leader-pattern="rule" rule-thickness="1" leader-length="100%" color="black"/>
												</fo:block>
												<fo:inline-container>
													<fo:block>
														<xsl:text>&#x2029;</xsl:text>
													</fo:block>
												</fo:inline-container>
												<fo:table font-family="Arial" font-size="9pt" table-layout="fixed" width="100%" border-spacing="1.5">
													<fo:table-column column-width="100%"/>
													<fo:table-body start-indent="0pt">
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<fo:inline>
																		<xsl:text>The names and total compensation of the five most highly compensated officers of the entity(ies) must be listed if--</xsl:text>
																	</fo:inline>
																	<fo:block>
																		<fo:leader leader-pattern="space"/>
																	</fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:block margin="0pt">
																		<fo:block/>
																	</fo:block>
																	<fo:inline>
																		<xsl:text> (i) the entity in the preceding fiscal year received-</xsl:text>
																	</fo:inline>
																	<fo:block>
																		<fo:leader leader-pattern="space"/>
																	</fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:block margin="0pt">
																		<fo:block/>
																	</fo:block>
																	<fo:inline>
																		<xsl:text>&#160;&#160;&#160;&#160; (I) 80 percent or more of its annual gross revenues in Federal awards (federal contracts (and subcontracts), loans, grants (and subgrants) and cooperative agreements); AND</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:block>
																		<fo:leader leader-pattern="space"/>
																	</fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:block margin="0pt">
																		<fo:block/>
																	</fo:block>
																	<fo:inline>
																		<xsl:text>&#160;&#160;&#160;&#160; (II) $25,000,000 or more in annual gross revenues from Federal awards; and </xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:block>
																		<fo:leader leader-pattern="space"/>
																	</fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:block margin="0pt">
																		<fo:block/>
																	</fo:block>
																	<fo:inline>
																		<xsl:text>(ii) the public does not have access to information about the compensation of the senior executives of the entity through periodic reports filed under section 13(a) or 15(d) of the Securities Exchange Act of 1934 (15 U.S.C. 78m(a), 78o(d)) or section 6104 of the Internal Revenue Code of 1986.</xsl:text>
																	</fo:inline>
																	<fo:block/>
																	<fo:block>
																		<fo:leader leader-pattern="space"/>
																	</fo:block>
																	<fo:inline-container>
																		<fo:block>
																			<xsl:text>&#x2029;</xsl:text>
																		</fo:block>
																	</fo:inline-container>
																	<fo:block margin="0pt">
																		<fo:block/>
																	</fo:block>
																	<fo:inline>
																		<xsl:text>Is subaward entity exempt from reporting executive compensation? </xsl:text>
																	</fo:inline>
																	<xsl:choose>
																		<xsl:when test="subcontract:SubContractData/subcontract:SubcontractTemplateInfo/subcontract:ExemptFromRprtgExecComp = &quot;Y&quot;">
																			<fo:inline>
																				<xsl:text>Yes</xsl:text>
																			</fo:inline>
																		</xsl:when>
																		<xsl:when test="subcontract:SubContractData/subcontract:SubcontractTemplateInfo/subcontract:ExemptFromRprtgExecComp = &quot;N&quot;">
																			<fo:inline>
																				<xsl:text>No</xsl:text>
																			</fo:inline>
																		</xsl:when>
																	</xsl:choose>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
														<fo:table-row>
															<fo:table-cell padding="2pt" display-align="center">
																<fo:block>
																	<xsl:if test="subcontract:SubContractData/subcontract:SubcontractTemplateInfo/subcontract:ExemptFromRprtgExecComp = &quot;N&quot;">
																		<fo:block/>
																		<fo:inline>
																			<xsl:text>Complete the information below.</xsl:text>
																		</fo:inline>
																		<fo:inline-container>
																			<fo:block>
																				<xsl:text>&#x2029;</xsl:text>
																			</fo:block>
																		</fo:inline-container>
																		<fo:table font-family="Arial" font-size="9pt" table-layout="fixed" width="100%" border-spacing="2pt">
																			<fo:table-column column-width="proportional-column-width(1)"/>
																			<fo:table-column column-width="proportional-column-width(1)"/>
																			<fo:table-body start-indent="0pt">
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 1 Name</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 1 Compensation</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 2 Name</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 2 Compensation</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 3 Name</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 3 Compensation</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 4 Name</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 4 Compensation</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 5 Name</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																				<fo:table-row>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block>
																							<fo:inline>
																								<xsl:text>Officer 5 Compensation</xsl:text>
																							</fo:inline>
																						</fo:block>
																					</fo:table-cell>
																					<fo:table-cell padding="2pt" display-align="center">
																						<fo:block/>
																					</fo:table-cell>
																				</fo:table-row>
																			</fo:table-body>
																		</fo:table>
																	</xsl:if>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</xsl:for-each>
					</fo:block>
					<fo:block id="SV_RefID_PageTotal"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template name="headerall">
		<fo:static-content flow-name="xsl-region-before">
			<fo:block/>
		</fo:static-content>
	</xsl:template>
	<xsl:template name="double-backslash">
		<xsl:param name="text"/>
		<xsl:param name="text-length"/>
		<xsl:variable name="text-after-bs" select="substring-after($text, '\')"/>
		<xsl:variable name="text-after-bs-length" select="string-length($text-after-bs)"/>
		<xsl:choose>
			<xsl:when test="$text-after-bs-length = 0">
				<xsl:choose>
					<xsl:when test="substring($text, $text-length) = '\'">
						<xsl:value-of select="concat(substring($text,1,$text-length - 1), '\\')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$text"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(substring($text,1,$text-length - $text-after-bs-length - 1), '\\')"/>
				<xsl:call-template name="double-backslash">
					<xsl:with-param name="text" select="$text-after-bs"/>
					<xsl:with-param name="text-length" select="$text-after-bs-length"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
