<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<session-data>
			<xsl:attribute name="xsi:noNamespaceSchemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">C:/PROGRA~2/Oracle/POLICY~1/bin/sessiondata.xsd</xsl:attribute>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">global</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="global">
					<xsl:variable name="var_LARSVersion" select="@LARSVersion"/>
					<xsl:variable name="var_PostcodeAreaCostVersion" select="@PostcodeAreaCostVersion"/>
					<xsl:variable name="var_SpecialistResources" select="@SpecialistResources"/>
					<xsl:variable name="var_UKPRN" select="@UKPRN"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LARSVersion)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LARSVersion</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LARSVersion)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PostcodeAreaCostVersion)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PostcodeAreaCostVersion</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_PostcodeAreaCostVersion)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SpecialistResources)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SpecialistResources</xsl:attribute>
								<boolean-val>
									<xsl:value-of select="string($var_SpecialistResources)"/>
								</boolean-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_UKPRN)) != 'false'">
							<attribute>
								<xsl:attribute name="id">UKPRN</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_UKPRN)"/>
								</number-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">Learner</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="Learner">
					<xsl:variable name="var_LearnRefNumber" select="@LearnRefNumber"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LearnRefNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnRefNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnRefNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDelivery</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDelivery">
					<xsl:variable name="var_AimSeqNumber" select="@AimSeqNumber"/>
					<xsl:variable name="var_AreaCostFactor" select="@AreaCostFactor"/>
					<xsl:variable name="var_CompStatus" select="@CompStatus"/>
					<xsl:variable name="var_LearnActEndDate" select="@LearnActEndDate"/>
					<xsl:variable name="var_LearnAimRefType" select="@LearnAimRefType"/>
					<xsl:variable name="var_LearnPlanEndDate" select="@LearnPlanEndDate"/>
					<xsl:variable name="var_LearnStartDate" select="@LearnStartDate"/>
					<xsl:variable name="var_LrnDelFAM_ADL" select="@LrnDelFAM_ADL"/>
					<xsl:variable name="var_LrnDelFAM_RES" select="@LrnDelFAM_RES"/>
					<xsl:variable name="var_NotionalNVQLevelv2" select="@NotionalNVQLevelv2"/>
					<xsl:variable name="var_OrigLearnStartDate" select="@OrigLearnStartDate"/>
					<xsl:variable name="var_OtherFundAdj" select="@OtherFundAdj"/>
					<xsl:variable name="var_Outcome" select="@Outcome"/>
					<xsl:variable name="var_PriorLearnFundAdj" select="@PriorLearnFundAdj"/>
					<xsl:variable name="var_RegulatedCreditValue" select="@RegulatedCreditValue"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_AimSeqNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AimSeqNumber</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_AimSeqNumber)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_AreaCostFactor)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AreaCostFactor</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_AreaCostFactor)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_CompStatus)) != 'false'">
							<attribute>
								<xsl:attribute name="id">CompStatus</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_CompStatus)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnActEndDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnActEndDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnActEndDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnAimRefType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnAimRefType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnAimRefType)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnPlanEndDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnPlanEndDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnPlanEndDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnStartDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnStartDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnStartDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_ADL)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_ADL</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_ADL)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_RES)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_RES</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_RES)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NotionalNVQLevelv2)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NotionalNVQLevelv2</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NotionalNVQLevelv2)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OrigLearnStartDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OrigLearnStartDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_OrigLearnStartDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OtherFundAdj)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OtherFundAdj</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_OtherFundAdj)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_Outcome)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Outcome</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_Outcome)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PriorLearnFundAdj)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PriorLearnFundAdj</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PriorLearnFundAdj)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_RegulatedCreditValue)) != 'false'">
							<attribute>
								<xsl:attribute name="id">RegulatedCreditValue</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_RegulatedCreditValue)"/>
								</number-val>
							</attribute>
						</xsl:if>

												<attribute>
													<xsl:attribute name="id">MatrixWeightedRate</xsl:attribute>
													<xsl:for-each select="MatrixWeightedRate/ChangePoint">
														<xsl:variable name="var_MatrixWeightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_MatrixWeightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_MatrixWeightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">MatrixWeightingFactor</xsl:attribute>
													<xsl:for-each select="MatrixWeightingFactor/ChangePoint">
														<xsl:variable name="var_MatrixWeightingFactor" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_MatrixWeightingFactor = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<text-val>
																		<xsl:value-of select="$var_MatrixWeightingFactor"/>
																	</text-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>

			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDeliveryFAM</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryFAM">
					<xsl:variable name="var_LearnDelFAMCode" select="@LearnDelFAMCode"/>
					<xsl:variable name="var_LearnDelFAMDateFrom" select="@LearnDelFAMDateFrom"/>
					<xsl:variable name="var_LearnDelFAMDateTo" select="@LearnDelFAMDateTo"/>
					<xsl:variable name="var_LearnDelFAMType" select="@LearnDelFAMType"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LearnDelFAMCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelFAMCode</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnDelFAMCode)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelFAMDateFrom)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelFAMDateFrom</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnDelFAMDateFrom)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelFAMDateTo)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelFAMDateTo</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnDelFAMDateTo)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelFAMType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelFAMType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnDelFAMType)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDeliveryLARSCategory</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryLARSCategory">
					<xsl:variable name="var_LearnDelCatDateFrom" select="@LearnDelCatDateFrom"/>
					<xsl:variable name="var_LearnDelCatDateTo" select="@LearnDelCatDateTo"/>
					<xsl:variable name="var_LearnDelCatRef" select="@LearnDelCatRef"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LearnDelCatDateFrom)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelCatDateFrom</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnDelCatDateFrom)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelCatDateTo)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelCatDateTo</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnDelCatDateTo)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelCatRef)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelCatRef</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LearnDelCatRef)"/>
								</number-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
					</instance>
				</xsl:for-each>
			</entity>
					</instance>
				</xsl:for-each>
			</entity>
					</instance>
				</xsl:for-each>
			</entity>

		</session-data>
	</xsl:template>
</xsl:stylesheet>
