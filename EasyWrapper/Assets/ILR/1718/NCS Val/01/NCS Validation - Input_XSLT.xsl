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
					<xsl:variable name="var_CalendarMonth" select="@CalendarMonth"/>
					<xsl:variable name="var_CalendarYear" select="@CalendarYear"/>
					<xsl:variable name="var_FilePreparationDate" select="@FilePreparationDate"/>
					<xsl:variable name="var_NumberOfAccreditedLearningOutcomesInCustody" select="@NumberOfAccreditedLearningOutcomesInCustody"/>
					<xsl:variable name="var_NumberOfCareerManagementOutcomesInCustody" select="@NumberOfCareerManagementOutcomesInCustody"/>
					<xsl:variable name="var_NumberOf2ndCareerManagementOutcomesInCustody" select="@NumberOf2ndCareerManagementOutcomesInCustody"/>
					<xsl:variable name="var_NumberOfCareerProgressionOutcomesInCustody" select="@NumberOfCareerProgressionOutcomesInCustody"/>
					<xsl:variable name="var_NumberOfCustomerSatisfactionOutcomesInCustody" select="@NumberOfCustomerSatisfactionOutcomesInCustody"/>
					<xsl:variable name="var_NumberOfCustomersSeenInCustody" select="@NumberOfCustomersSeenInCustody"/>
					<xsl:variable name="var_NumberOfEmployersActual" select="@NumberOfEmployersActual"/>
					<xsl:variable name="var_NumberOfSchoolsActual" select="@NumberOfSchoolsActual"/>
					<xsl:variable name="var_NumberOfSustainableEmploymentOutcomesInCustody" select="@NumberOfSustainableEmploymentOutcomesInCustody"/>
					<xsl:variable name="var_TotalMonthlyInspirationSpendActual" select="@TotalMonthlyInspirationSpendActual"/>
					<xsl:variable name="var_TouchpointID" select="@TouchpointID"/>
					<xsl:variable name="var_UKPRN" select="@UKPRN"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_CalendarMonth)) != 'false'">
							<attribute>
								<xsl:attribute name="id">CalendarMonth</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_CalendarMonth)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_CalendarYear)) != 'false'">
							<attribute>
								<xsl:attribute name="id">CalendarYear</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_CalendarYear)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FilePreparationDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FilePreparationDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_FilePreparationDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfAccreditedLearningOutcomesInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfAccreditedLearningOutcomesInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfAccreditedLearningOutcomesInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfCareerManagementOutcomesInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfCareerManagementOutcomesInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfCareerManagementOutcomesInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOf2ndCareerManagementOutcomesInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOf2ndCareerManagmentOutcomesInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOf2ndCareerManagementOutcomesInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfCareerProgressionOutcomesInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfCareerProgressionOutcomesInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfCareerProgressionOutcomesInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfCustomerSatisfactionOutcomesInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfCustomerSatisfactionOutcomesInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfCustomerSatisfactionOutcomesInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfCustomersSeenInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfCustomersSeenInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfCustomersSeenInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfEmployersActual)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfEmployersActual</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfEmployersActual)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfSchoolsActual)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfSchoolsActual</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfSchoolsActual)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_NumberOfSustainableEmploymentOutcomesInCustody)) != 'false'">
							<attribute>
								<xsl:attribute name="id">NumberOfSustainableEmploymentOutcomesInCustody</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_NumberOfSustainableEmploymentOutcomesInCustody)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TotalMonthlyInspirationSpendActual)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TotalMonthlyInspirationSpendActual</xsl:attribute>
								<currency-val>
									<xsl:value-of select="string($var_TotalMonthlyInspirationSpendActual)"/>
								</currency-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TouchpointID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TouchpointID</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_TouchpointID)"/>
								</text-val>
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
				<xsl:attribute name="id">Customer</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="Customer">
					<xsl:variable name="var_CDSCustomerID" select="@CDSCustomerID"/>
					<xsl:variable name="var_CustomerType" select="@CustomerType"/>
					<xsl:variable name="var_DateOfBirth" select="@DateOfBirth"/>
					<xsl:variable name="var_DisabilityType" select="@DisabilityType"/>
					<xsl:variable name="var_Ethnicity" select="@Ethnicity"/>
					<xsl:variable name="var_EUCitizen" select="@EUCitizen"/>
					<xsl:variable name="var_FamilyName" select="@FamilyName"/>
					<xsl:variable name="var_Gender" select="@Gender"/>
					<xsl:variable name="var_GivenName" select="@GivenName"/>
					<xsl:variable name="var_LearningDifficulty" select="@LearningDifficulty"/>
					<xsl:variable name="var_LLAAccountNumber" select="@LLAAccountNumber"/>
					<xsl:variable name="var_NINumber" select="@NINumber"/>
					<xsl:variable name="var_ParticipateResearchEvaluation" select="@ParticipateResearchEvaluation"/>
					<xsl:variable name="var_TerminationOfServiceReason" select="@TerminationOfServiceReason"/>
					<xsl:variable name="var_TouchpointCustomerID" select="@TouchpointCustomerID"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_CDSCustomerID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">CDSCustomerID</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_CDSCustomerID)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_CustomerType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">CustomerType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_CustomerType)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_DateOfBirth)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DateOfBirth</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_DateOfBirth)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_DisabilityType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DisabilityType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_DisabilityType)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_Ethnicity)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Ethnicity</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_Ethnicity)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EUCitizen)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EUCitizen</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_EUCitizen)"/>
								</text-val>
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
						<xsl:if test="string(boolean($var_Gender)) != 'false'">
							<attribute>
								<xsl:attribute name="id">Gender</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_Gender)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_GivenName)) != 'false'">
							<attribute>
								<xsl:attribute name="id">GivenName</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_GivenName)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearningDifficulty)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearningDifficulty</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearningDifficulty)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LLAAccountNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LLAAccountNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LLAAccountNumber)"/>
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
						<xsl:if test="string(boolean($var_ParticipateResearchEvaluation)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ParticipateResearchEvaluation</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ParticipateResearchEvaluation)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TerminationOfServiceReason)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TerminationOfServiceReason</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_TerminationOfServiceReason)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_TouchpointCustomerID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">TouchpointCustomerID</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_TouchpointCustomerID)"/>
								</text-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">Contact</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="Contact">
					<xsl:variable name="var_AlternativePhoneNumber" select="@AlternativePhoneNumber"/>
					<xsl:variable name="var_ContactPreference" select="@ContactPreference"/>
					<xsl:variable name="var_Email" select="@Email"/>
					<xsl:variable name="var_PrimaryPhoneNumber" select="@PrimaryPhoneNumber"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_AlternativePhoneNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AlternativePhoneNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_AlternativePhoneNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ContactPreference)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ContactPreference</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ContactPreference)"/>
								</text-val>
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
						<xsl:if test="string(boolean($var_PrimaryPhoneNumber)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PrimaryPhoneNumber</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_PrimaryPhoneNumber)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">Address</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="Address">
					<xsl:variable name="var_AlternativePostCode" select="@AlternativePostCode"/>
					<xsl:variable name="var_AlternativePostCode_Lookup" select="@AlternativePostCode_Lookup"/>
					<xsl:variable name="var_HomePostCode" select="@HomePostCode"/>
					<xsl:variable name="var_HomePostCode_Lookup" select="@HomePostCode_Lookup"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_AlternativePostCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AlternativePostCode</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_AlternativePostCode)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_AlternativePostCode_Lookup)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AlternativePostCode_Lookup</xsl:attribute>
								<boolean-val>
									<xsl:value-of select="string($var_AlternativePostCode_Lookup)"/>
								</boolean-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_HomePostCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">HomePostCode</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_HomePostCode)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_HomePostCode_Lookup)) != 'false'">
							<attribute>
								<xsl:attribute name="id">HomePostCode_Lookup</xsl:attribute>
								<boolean-val>
									<xsl:value-of select="string($var_HomePostCode_Lookup)"/>
								</boolean-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">ActionPlan</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="ActionPlan">
					<xsl:variable name="var_ActionPlanID" select="@ActionPlanID"/>
					<xsl:variable name="var_BenefitType" select="@BenefitType"/>
					<xsl:variable name="var_MainDeliveryType" select="@MainDeliveryType"/>
					<xsl:variable name="var_PriorityGroupL1" select="@PriorityGroupL1"/>
					<xsl:variable name="var_ReferralType" select="@ReferralType"/>
					<xsl:variable name="var_SessionDate" select="@SessionDate"/>
					<xsl:variable name="var_SourceOfAwarenessL1" select="@SourceOfAwarenessL1"/>
					<xsl:variable name="var_SourceOfAwarenessL2" select="@SourceOfAwarenessL2"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_ActionPlanID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ActionPlanID</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ActionPlanID)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_BenefitType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">BenefitType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_BenefitType)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_MainDeliveryType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">MainDeliveryType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_MainDeliveryType)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PriorityGroupL1)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PriorityGroupL1</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_PriorityGroupL1)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_ReferralType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ReferralType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_ReferralType)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SessionDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SessionDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_SessionDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SourceOfAwarenessL1)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SourceOfAwarenessL1</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_SourceOfAwarenessL1)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_SourceOfAwarenessL2)) != 'false'">
							<attribute>
								<xsl:attribute name="id">SourceOfAwarenessL2</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_SourceOfAwarenessL2)"/>
								</text-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">Outcome</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="Outcome">
					<xsl:variable name="var_OutcomeAchieved" select="@OutcomeAchieved"/>
					<xsl:variable name="var_OutcomeClaimed" select="@OutcomeClaimed"/>
					<xsl:variable name="var_OutcomeEffectiveDate" select="@OutcomeEffectiveDate"/>
					<xsl:variable name="var_OutcomeID" select="@OutcomeID"/>
					<xsl:variable name="var_OutcomeType" select="@OutcomeType"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_OutcomeAchieved)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OutcomeAchieved</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_OutcomeAchieved)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OutcomeClaimed)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OutcomeClaimed</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_OutcomeClaimed)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OutcomeEffectiveDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OutcomeEffectiveDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_OutcomeEffectiveDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OutcomeID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OutcomeID</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_OutcomeID)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OutcomeType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OutcomeType</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_OutcomeType)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">PriorityGroupL2</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="PriorityGroupL2">
					<xsl:variable name="var_PriorityGroup" select="@PriorityGroup"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_PriorityGroup)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PriorityGroup</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_PriorityGroup)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">EducationProgression</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="EducationProgression">
					<xsl:variable name="var_EdProgEdAttainmentLevel" select="@EdProgEdAttainmentLevel"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_EdProgEdAttainmentLevel)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EdProgEdAttainmentLevel</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_EdProgEdAttainmentLevel)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">EmploymentProgression</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="EmploymentProgression">
					<xsl:variable name="var_EmProgEmStatus" select="@EmProgEmStatus"/>
					<xsl:variable name="var_EmProgLenOfUnemployment" select="@EmProgLenOfUnemployment"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_EmProgEmStatus)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EmProgEmStatus</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_EmProgEmStatus)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EmProgLenOfUnemployment)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EmProgLenOfUnemployment</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_EmProgLenOfUnemployment)"/>
								</text-val>
							</attribute>
						</xsl:if>


					</instance>
				</xsl:for-each>
			</entity>
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningProgression</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningProgression">
					<xsl:variable name="var_LearnProgLearnStatus" select="@LearnProgLearnStatus"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LearnProgLearnStatus)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnProgLearnStatus</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LearnProgLearnStatus)"/>
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
					</instance>
				</xsl:for-each>
			</entity>

		</session-data>
	</xsl:template>
</xsl:stylesheet>
