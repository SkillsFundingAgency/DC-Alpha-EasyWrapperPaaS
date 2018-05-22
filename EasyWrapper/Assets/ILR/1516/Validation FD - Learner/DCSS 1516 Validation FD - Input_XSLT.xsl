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
					<xsl:variable name="var_UKPRN" select="@UKPRN"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
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
					<xsl:variable name="var_Accom" select="@Accom"/>
					<xsl:variable name="var_ALSCost" select="@ALSCost"/>
					<xsl:variable name="var_EngGrade" select="@EngGrade"/>
					<xsl:variable name="var_Ethnicity" select="@Ethnicity"/>
					<xsl:variable name="var_FamilyName" select="@FamilyName"/>
					<xsl:variable name="var_GivenNames" select="@GivenNames"/>
					<xsl:variable name="var_LearnRefNumber" select="@LearnRefNumber"/>
					<xsl:variable name="var_LLDDHealthProb" select="@LLDDHealthProb"/>
					<xsl:variable name="var_MathGrade" select="@MathGrade"/>
					<xsl:variable name="var_NINumber" select="@NINumber"/>
					<xsl:variable name="var_PlanEEPHours" select="@PlanEEPHours"/>
					<xsl:variable name="var_PlanLearnHours" select="@PlanLearnHours"/>
					<xsl:variable name="var_PrevLearnRefNumber" select="@PrevLearnRefNumber"/>
					<xsl:variable name="var_PrevUKPRN" select="@PrevUKPRN"/>
					<xsl:variable name="var_PriorAttain" select="@PriorAttain"/>
					<xsl:variable name="var_Sex" select="@Sex"/>
					<xsl:variable name="var_ULN" select="@ULN"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_Accom)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Accom</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_Accom)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ALSCost)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ALSCost</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ALSCost)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EngGrade)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EngGrade</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_EngGrade)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_Ethnicity)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Ethnicity</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_Ethnicity)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FamilyName)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FamilyName</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_FamilyName)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_GivenNames)) != 'false'">
							<attribute>
								<xsl:attribute name="id">GivenNames</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_GivenNames)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnRefNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnRefNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnRefNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LLDDHealthProb)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LLDDHealthProb</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LLDDHealthProb)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_MathGrade)) != 'false'">
							<attribute>
								<xsl:attribute name="id">MathGrade</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_MathGrade)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NINumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NINumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NINumber)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PlanEEPHours)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PlanEEPHours</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PlanEEPHours)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PlanLearnHours)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PlanLearnHours</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PlanLearnHours)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PrevLearnRefNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PrevLearnRefNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_PrevLearnRefNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PrevUKPRN)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PrevUKPRN</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PrevUKPRN)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PriorAttain)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PriorAttain</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PriorAttain)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_Sex)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Sex</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_Sex)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ULN)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ULN</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ULN)"/>
								</number-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDelivery</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDelivery">
					<xsl:variable name="var_AddHours" select="@AddHours"/>
					<xsl:variable name="var_AimSeqNumber" select="@AimSeqNumber"/>
					<xsl:variable name="var_AimType" select="@AimType"/>
					<xsl:variable name="var_CompStatus" select="@CompStatus"/>
					<xsl:variable name="var_ConRefNumber" select="@ConRefNumber"/>
					<xsl:variable name="var_DelLocPostcode" select="@DelLocPostcode"/>
					<xsl:variable name="var_EmpOutcome" select="@EmpOutcome"/>
					<xsl:variable name="var_FundModel" select="@FundModel"/>
					<xsl:variable name="var_FworkCode" select="@FworkCode"/>
					<xsl:variable name="var_LearnAimRef" select="@LearnAimRef"/>
					<xsl:variable name="var_LearnPlanEndDate" select="@LearnPlanEndDate"/>
					<xsl:variable name="var_LearnStartDate" select="@LearnStartDate"/>
					<xsl:variable name="var_OtherFundAdj" select="@OtherFundAdj"/>
					<xsl:variable name="var_Outcome" select="@Outcome"/>
					<xsl:variable name="var_OutGrade" select="@OutGrade"/>
					<xsl:variable name="var_PartnerUKPRN" select="@PartnerUKPRN"/>
					<xsl:variable name="var_PriorLearnFundAdj" select="@PriorLearnFundAdj"/>
					<xsl:variable name="var_ProgType" select="@ProgType"/>
					<xsl:variable name="var_PwayCode" select="@PwayCode"/>
					<xsl:variable name="var_SWSupAimId" select="@SWSupAimId"/>
					<xsl:variable name="var_WithdrawReason" select="@WithdrawReason"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_AddHours)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AddHours</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_AddHours)"/>
								</number-val>
							</attribute>
						</xsl:if>
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
						<xsl:if test="string(boolean($var_ConRefNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ConRefNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ConRefNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_DelLocPostcode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DelLocPostcode</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_DelLocPostcode)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EmpOutcome)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EmpOutcome</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_EmpOutcome)"/>
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
						<xsl:if test="string(boolean($var_FworkCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FworkCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FworkCode)"/>
								</number-val>
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
						<xsl:if test="string(boolean($var_OutGrade)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OutGrade</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_OutGrade)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PartnerUKPRN)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PartnerUKPRN</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PartnerUKPRN)"/>
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
						<xsl:if test="string(boolean($var_ProgType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ProgType</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ProgType)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PwayCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PwayCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PwayCode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SWSupAimId)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SWSupAimId</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_SWSupAimId)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_WithdrawReason)) != 'false'">
							<attribute>
								<xsl:attribute name="id">WithdrawReason</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_WithdrawReason)"/>
								</number-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDeliveryFAM</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryFAM">
					<xsl:variable name="var_LearnDelFAMCode" select="@LearnDelFAMCode"/>
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
				<xsl:attribute name="id">LearningDeliveryHE</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryHE">
					<xsl:variable name="var_DOMICILE" select="@DOMICILE"/>
					<xsl:variable name="var_ELQ" select="@ELQ"/>
					<xsl:variable name="var_FUNDCOMP" select="@FUNDCOMP"/>
					<xsl:variable name="var_FUNDLEV" select="@FUNDLEV"/>
					<xsl:variable name="var_GROSSFEE" select="@GROSSFEE"/>
					<xsl:variable name="var_HEPostCode" select="@HEPostCode"/>
					<xsl:variable name="var_MODESTUD" select="@MODESTUD"/>
					<xsl:variable name="var_MSTUFEE" select="@MSTUFEE"/>
					<xsl:variable name="var_NETFEE" select="@NETFEE"/>
					<xsl:variable name="var_NUMHUS" select="@NUMHUS"/>
					<xsl:variable name="var_PCFLDCS" select="@PCFLDCS"/>
					<xsl:variable name="var_PCOLAB" select="@PCOLAB"/>
					<xsl:variable name="var_PCSLDCS" select="@PCSLDCS"/>
					<xsl:variable name="var_PCTLDCS" select="@PCTLDCS"/>
					<xsl:variable name="var_QUALENT3" select="@QUALENT3"/>
					<xsl:variable name="var_SEC" select="@SEC"/>
					<xsl:variable name="var_SOC2000" select="@SOC2000"/>
					<xsl:variable name="var_SPECFEE" select="@SPECFEE"/>
					<xsl:variable name="var_SSN" select="@SSN"/>
					<xsl:variable name="var_STULOAD" select="@STULOAD"/>
					<xsl:variable name="var_TYPEYR" select="@TYPEYR"/>
					<xsl:variable name="var_UCASAPPID" select="@UCASAPPID"/>
					<xsl:variable name="var_YEARSTU" select="@YEARSTU"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_DOMICILE)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DOMICILE</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_DOMICILE)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ELQ)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ELQ</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ELQ)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FUNDCOMP)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FUNDCOMP</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FUNDCOMP)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FUNDLEV)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FUNDLEV</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FUNDLEV)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_GROSSFEE)) != 'false'">
							<attribute>
								<xsl:attribute name="id">GROSSFEE</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_GROSSFEE)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_HEPostCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">HEPostCode</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_HEPostCode)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_MODESTUD)) != 'false'">
							<attribute>
								<xsl:attribute name="id">MODESTUD</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_MODESTUD)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_MSTUFEE)) != 'false'">
							<attribute>
								<xsl:attribute name="id">MSTUFEE</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_MSTUFEE)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NETFEE)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NETFEE</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_NETFEE)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NUMHUS)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NUMHUS</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NUMHUS)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PCFLDCS)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PCFLDCS</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PCFLDCS)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PCOLAB)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PCOLAB</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PCOLAB)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PCSLDCS)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PCSLDCS</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PCSLDCS)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PCTLDCS)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PCTLDCS</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PCTLDCS)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_QUALENT3)) != 'false'">
							<attribute>
								<xsl:attribute name="id">QUALENT3</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_QUALENT3)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SEC)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SEC</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_SEC)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SOC2000)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SOC2000</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_SOC2000)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SPECFEE)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SPECFEE</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_SPECFEE)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SSN)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SSN</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_SSN)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_STULOAD)) != 'false'">
							<attribute>
								<xsl:attribute name="id">STULOAD</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_STULOAD)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TYPEYR)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TYPEYR</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_TYPEYR)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_UCASAPPID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">UCASAPPID</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_UCASAPPID)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_YEARSTU)) != 'false'">
							<attribute>
								<xsl:attribute name="id">YEARSTU</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_YEARSTU)"/>
								</number-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">ProviderSpecDeliveryMonitoring</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="ProviderSpecDeliveryMonitoring">
					<xsl:variable name="var_ProvSpecDelMon" select="@ProvSpecDelMon"/>
					<xsl:variable name="var_ProvSpecDelMonOccur" select="@ProvSpecDelMonOccur"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_ProvSpecDelMon)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ProvSpecDelMon</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ProvSpecDelMon)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ProvSpecDelMonOccur)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ProvSpecDelMonOccur</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ProvSpecDelMonOccur)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDeliveryWorkPlacement</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryWorkPlacement">
					<xsl:variable name="var_WorkPlaceEmpId" select="@WorkPlaceEmpId"/>
					<xsl:variable name="var_WorkPlaceMode" select="@WorkPlaceMode"/>
					<xsl:variable name="var_WorkPlaceStartDate" select="@WorkPlaceStartDate"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_WorkPlaceEmpId)) != 'false'">
							<attribute>
								<xsl:attribute name="id">WorkPlaceEmpId</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_WorkPlaceEmpId)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_WorkPlaceMode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">WorkPlaceMode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_WorkPlaceMode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_WorkPlaceStartDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">WorkPlaceStartDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_WorkPlaceStartDate)"/>
								</date-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
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
					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearnerFAM</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerFAM">
					<xsl:variable name="var_LearnFAMCode" select="@LearnFAMCode"/>
					<xsl:variable name="var_LearnFAMType" select="@LearnFAMType"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LearnFAMCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnFAMCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LearnFAMCode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnFAMType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnFAMType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnFAMType)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearnerEmploymentStatus</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerEmploymentStatus">
					<xsl:variable name="var_DateEmpStatApp" select="@DateEmpStatApp"/>
					<xsl:variable name="var_EmpId" select="@EmpId"/>
					<xsl:variable name="var_EmpStat" select="@EmpStat"/>
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
						<xsl:if test="string(boolean($var_EmpId)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EmpId</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_EmpId)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EmpStat)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EmpStat</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_EmpStat)"/>
								</number-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">EmploymentStatusMonitoring</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="EmploymentStatusMonitoring">
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
				<xsl:attribute name="id">LearnerContact</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerContact">
					<xsl:variable name="var_ContType" select="@ContType"/>
					<xsl:variable name="var_Email" select="@Email"/>
					<xsl:variable name="var_LocType" select="@LocType"/>
					<xsl:variable name="var_Postcode" select="@Postcode"/>
					<xsl:variable name="var_TelNumber" select="@TelNumber"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_ContType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ContType</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ContType)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_Email)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Email</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_Email)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LocType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LocType</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LocType)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_Postcode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Postcode</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_Postcode)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TelNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TelNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_TelNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">PostAdd</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="PostAdd">
					<xsl:variable name="var_AddLine1" select="@AddLine1"/>
					<xsl:variable name="var_AddLine2" select="@AddLine2"/>
					<xsl:variable name="var_AddLine3" select="@AddLine3"/>
					<xsl:variable name="var_AddLine4" select="@AddLine4"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_AddLine1)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AddLine1</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_AddLine1)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_AddLine2)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AddLine2</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_AddLine2)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_AddLine3)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AddLine3</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_AddLine3)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_AddLine4)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AddLine4</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_AddLine4)"/>
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
				<xsl:attribute name="id">ContactPreference</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="ContactPreference">
					<xsl:variable name="var_ContPrefCode" select="@ContPrefCode"/>
					<xsl:variable name="var_ContPrefType" select="@ContPrefType"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_ContPrefCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ContPrefCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ContPrefCode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ContPrefType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ContPrefType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ContPrefType)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LLDDandHealthProblem</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LLDDandHealthProblem">
					<xsl:variable name="var_LLDDCat" select="@LLDDCat"/>
					<xsl:variable name="var_PrimaryLLDD" select="@PrimaryLLDD"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LLDDCat)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LLDDCat</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LLDDCat)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PrimaryLLDD)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PrimaryLLDD</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_PrimaryLLDD)"/>
								</number-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearnerHE</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerHE">
					<xsl:variable name="var_TTACCOM" select="@TTACCOM"/>
					<xsl:variable name="var_UCASPERID" select="@UCASPERID"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_TTACCOM)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TTACCOM</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_TTACCOM)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_UCASPERID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">UCASPERID</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_UCASPERID)"/>
								</number-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearnerHEFinancialSupport</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerHEFinancialSupport">
					<xsl:variable name="var_FINAMOUNT" select="@FINAMOUNT"/>
					<xsl:variable name="var_FINTYPE" select="@FINTYPE"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_FINAMOUNT)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FINAMOUNT</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FINAMOUNT)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FINTYPE)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FINTYPE</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FINTYPE)"/>
								</number-val>
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
				<xsl:attribute name="id">ProviderSpecLearnerMonitoring</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="ProviderSpecLearnerMonitoring">
					<xsl:variable name="var_ProvSpecLearnMon" select="@ProvSpecLearnMon"/>
					<xsl:variable name="var_ProvSpecLearnMonOccur" select="@ProvSpecLearnMonOccur"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_ProvSpecLearnMon)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ProvSpecLearnMon</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ProvSpecLearnMon)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ProvSpecLearnMonOccur)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ProvSpecLearnMonOccur</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ProvSpecLearnMonOccur)"/>
								</text-val>
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

		</session-data>
	</xsl:template>
</xsl:stylesheet>
