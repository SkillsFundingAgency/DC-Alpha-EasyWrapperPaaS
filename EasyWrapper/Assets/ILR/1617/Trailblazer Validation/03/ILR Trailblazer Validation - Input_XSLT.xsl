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
					<xsl:variable name="var_FilePreparationDate" select="@FilePreparationDate"/>
					<xsl:variable name="var_UKPRN" select="@UKPRN"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_FilePreparationDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FilePreparationDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_FilePreparationDate)"/>
								</date-val>
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
				<xsl:attribute name="id">LearnerEmploymentStatus</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerEmploymentStatus">
					<xsl:variable name="var_DateEmpStatApp" select="@DateEmpStatApp"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_DateEmpStatApp)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DateEmpStatApp</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_DateEmpStatApp)"/>
								</date-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearnerEmploymentStatusMonitoring</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerEmploymentStatusMonitoring">
					<xsl:variable name="var_ESMCode" select="@ESMCode"/>
					<xsl:variable name="var_ESMType" select="@ESMType"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_ESMCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ESMCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ESMCode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ESMType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ESMType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ESMType)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDelivery</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDelivery">
					<xsl:variable name="var_AimSeqNumber" select="@AimSeqNumber"/>
					<xsl:variable name="var_AimType" select="@AimType"/>
					<xsl:variable name="var_CompStatus" select="@CompStatus"/>
					<xsl:variable name="var_FundModel" select="@FundModel"/>
					<xsl:variable name="var_LearnActEndDate" select="@LearnActEndDate"/>
					<xsl:variable name="var_LearnAimRef" select="@LearnAimRef"/>
					<xsl:variable name="var_LearnPlanEndDate" select="@LearnPlanEndDate"/>
					<xsl:variable name="var_LearnStartDate" select="@LearnStartDate"/>
					<xsl:variable name="var_OrigLearnStartDate" select="@OrigLearnStartDate"/>
					<xsl:variable name="var_ProgType" select="@ProgType"/>
					<xsl:variable name="var_StdCode" select="@StdCode"/>
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
						<xsl:if test="string(boolean($var_AimType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AimType</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_AimType)"/>
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
						<xsl:if test="string(boolean($var_FundModel)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FundModel</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FundModel)"/>
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
						<xsl:if test="string(boolean($var_LearnAimRef)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnAimRef</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnAimRef)"/>
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
						<xsl:if test="string(boolean($var_OrigLearnStartDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OrigLearnStartDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_OrigLearnStartDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ProgType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ProgType</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ProgType)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_StdCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">StdCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_StdCode)"/>
								</number-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">TrailblazerApprenticeshipFinancialRecord</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="TrailblazerApprenticeshipFinancialRecord">
					<xsl:variable name="var_TBFinAmount" select="@TBFinAmount"/>
					<xsl:variable name="var_TBFinCode" select="@TBFinCode"/>
					<xsl:variable name="var_TBFinDate" select="@TBFinDate"/>
					<xsl:variable name="var_TBFinType" select="@TBFinType"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_TBFinAmount)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TBFinAmount</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_TBFinAmount)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TBFinCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TBFinCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_TBFinCode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TBFinDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TBFinDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_TBFinDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TBFinType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TBFinType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_TBFinType)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
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
				<xsl:attribute name="id">LearningDeliveryLARS_StandardFunding</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryLARS_StandardFunding">
					<xsl:variable name="var_CoreGovContributionCap" select="@CoreGovContributionCap"/>
					<xsl:variable name="var_LARSFundEffectiveFrom" select="@LARSFundEffectiveFrom"/>
					<xsl:variable name="var_LARSFundEffectiveTo" select="@LARSFundEffectiveTo"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_CoreGovContributionCap)) != 'false'">
							<attribute>
								<xsl:attribute name="id">CoreGovContributionCap</xsl:attribute>
								<currency-val>
									<xsl:value-of select="string($var_CoreGovContributionCap)"/>
								</currency-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LARSFundEffectiveFrom)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LARSFundEffectiveFrom</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LARSFundEffectiveFrom)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LARSFundEffectiveTo)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LARSFundEffectiveTo</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LARSFundEffectiveTo)"/>
								</date-val>
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
