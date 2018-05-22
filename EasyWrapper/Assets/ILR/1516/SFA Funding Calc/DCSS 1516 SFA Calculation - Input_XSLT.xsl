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
					<xsl:variable name="var_DirectFundEmp" select="@DirectFundEmp"/>
					<xsl:variable name="var_LARSVersion" select="@LARSVersion"/>
					<xsl:variable name="var_LTRC" select="@LTRC"/>
					<xsl:variable name="var_OrgVersion" select="@OrgVersion"/>
					<xsl:variable name="var_PostcodeDisadvantageVersion" select="@PostcodeDisadvantageVersion"/>
					<xsl:variable name="var_SpecialistResources" select="@SpecialistResources"/>
					<xsl:variable name="var_UKPRN" select="@UKPRN"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_DirectFundEmp)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DirectFundEmp</xsl:attribute>
								<boolean-val>
									<xsl:value-of select="string($var_DirectFundEmp)"/>
								</boolean-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LARSVersion)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LARSVersion</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_LARSVersion)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LTRC)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LTRC</xsl:attribute>
								<boolean-val>
									<xsl:value-of select="string($var_LTRC)"/>
								</boolean-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_OrgVersion)) != 'false'">
							<attribute>
								<xsl:attribute name="id">OrgVersion</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_OrgVersion)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_PostcodeDisadvantageVersion)) != 'false'">
							<attribute>
								<xsl:attribute name="id">PostcodeDisadvantageVersion</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_PostcodeDisadvantageVersion)"/>
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
								<text-val>
									<xsl:value-of select="string($var_UKPRN)"/>
								</text-val>
							</attribute>
						</xsl:if>


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">Learner</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="Learner">
					<xsl:variable name="var_DateOfBirth" select="@DateOfBirth"/>
					<xsl:variable name="var_DisadvantageUplift" select="@DisadvantageUplift"/>
					<xsl:variable name="var_LearnRefNumber" select="@LearnRefNumber"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_DateOfBirth)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DateOfBirth</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_DateOfBirth)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_DisadvantageUplift)) != 'false'">
							<attribute>
								<xsl:attribute name="id">DisadvantageUplift</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_DisadvantageUplift)"/>
								</number-val>
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


			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDelivery</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDelivery">
					<xsl:variable name="var_AchDate" select="@AchDate"/>
					<xsl:variable name="var_AddHours" select="@AddHours"/>
					<xsl:variable name="var_AimSeqNumber" select="@AimSeqNumber"/>
					<xsl:variable name="var_AimType" select="@AimType"/>
					<xsl:variable name="var_AreaCostFactor" select="@AreaCostFactor"/>
					<xsl:variable name="var_CompStatus" select="@CompStatus"/>
					<xsl:variable name="var_EmpOutcome" select="@EmpOutcome"/>
					<xsl:variable name="var_EnglandFEHEStatus" select="@EnglandFEHEStatus"/>
					<xsl:variable name="var_EnglPrscID" select="@EnglPrscID"/>
					<xsl:variable name="var_FrameworkCommonComponent" select="@FrameworkCommonComponent"/>
					<xsl:variable name="var_FrameworkComponentType" select="@FrameworkComponentType"/>
					<xsl:variable name="var_FworkCode" select="@FworkCode"/>
					<xsl:variable name="var_LearnActEndDate" select="@LearnActEndDate"/>
					<xsl:variable name="var_LearnPlanEndDate" select="@LearnPlanEndDate"/>
					<xsl:variable name="var_LearnStartDate" select="@LearnStartDate"/>
					<xsl:variable name="var_LrnDelFAM_EEF" select="@LrnDelFAM_EEF"/>
					<xsl:variable name="var_LrnDelFAM_FFI" select="@LrnDelFAM_FFI"/>
					<xsl:variable name="var_LrnDelFAM_LDM1" select="@LrnDelFAM_LDM1"/>
					<xsl:variable name="var_LrnDelFAM_LDM2" select="@LrnDelFAM_LDM2"/>
					<xsl:variable name="var_LrnDelFAM_LDM3" select="@LrnDelFAM_LDM3"/>
					<xsl:variable name="var_LrnDelFAM_LDM4" select="@LrnDelFAM_LDM4"/>
					<xsl:variable name="var_LrnDelFAM_RES" select="@LrnDelFAM_RES"/>
					<xsl:variable name="var_LrnDelFAM_WPL" select="@LrnDelFAM_WPL"/>
					<xsl:variable name="var_OrigLearnStartDate" select="@OrigLearnStartDate"/>
					<xsl:variable name="var_OtherFundAdj" select="@OtherFundAdj"/>
					<xsl:variable name="var_Outcome" select="@Outcome"/>
					<xsl:variable name="var_PriorLearnFundAdj" select="@PriorLearnFundAdj"/>
					<xsl:variable name="var_ProgType" select="@ProgType"/>
					<xsl:variable name="var_PwayCode" select="@PwayCode"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_AchDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">AchDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_AchDate)"/>
								</date-val>
							</attribute>
						</xsl:if>
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
						<xsl:if test="string(boolean($var_EmpOutcome)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EmpOutcome</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_EmpOutcome)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EnglandFEHEStatus)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EnglandFEHEStatus</xsl:attribute>
								<text-val>
									<xsl:value-of select="string($var_EnglandFEHEStatus)"/>
								</text-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_EnglPrscID)) != 'false'">
							<attribute>
								<xsl:attribute name="id">EnglPrscID</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_EnglPrscID)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FrameworkCommonComponent)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FrameworkCommonComponent</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FrameworkCommonComponent)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_FrameworkComponentType)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FrameworkComponentType</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FrameworkComponentType)"/>
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
						<xsl:if test="string(boolean($var_LearnActEndDate)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnActEndDate</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnActEndDate)"/>
								</date-val>
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
						<xsl:if test="string(boolean($var_LrnDelFAM_EEF)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_EEF</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_EEF)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_FFI)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_FFI</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_FFI)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_LDM1)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_LDM1</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_LDM1)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_LDM2)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_LDM2</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_LDM2)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_LDM3)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_LDM3</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_LDM3)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_LDM4)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_LDM4</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_LDM4)"/>
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
						<xsl:if test="string(boolean($var_LrnDelFAM_WPL)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_WPL</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_WPL)"/>
								</number-val>
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

												<attribute>
													<xsl:attribute name="id">AdultLRUnweightedRate</xsl:attribute>
													<xsl:for-each select="AdultLRUnweightedRate/ChangePoint">
														<xsl:variable name="var_AdultLRUnweightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_AdultLRUnweightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_AdultLRUnweightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">AdultLRWeightedRate</xsl:attribute>
													<xsl:for-each select="AdultLRWeightedRate/ChangePoint">
														<xsl:variable name="var_AdultLRWeightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_AdultLRWeightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_AdultLRWeightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">AdultLRWeightingFactor</xsl:attribute>
													<xsl:for-each select="AdultLRWeightingFactor/ChangePoint">
														<xsl:variable name="var_AdultLRWeightingFactor" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_AdultLRWeightingFactor = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<text-val>
																		<xsl:value-of select="$var_AdultLRWeightingFactor"/>
																	</text-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">ERAppWeightedRate</xsl:attribute>
													<xsl:for-each select="ERAppWeightedRate/ChangePoint">
														<xsl:variable name="var_ERAppWeightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_ERAppWeightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_ERAppWeightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">ERAppWeightingFactor</xsl:attribute>
													<xsl:for-each select="ERAppWeightingFactor/ChangePoint">
														<xsl:variable name="var_ERAppWeightingFactor" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_ERAppWeightingFactor = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<text-val>
																		<xsl:value-of select="$var_ERAppWeightingFactor"/>
																	</text-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">EROtherUnweightedRate</xsl:attribute>
													<xsl:for-each select="EROtherUnweightedRate/ChangePoint">
														<xsl:variable name="var_EROtherUnweightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_EROtherUnweightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_EROtherUnweightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">EROtherWeightedRate</xsl:attribute>
													<xsl:for-each select="EROtherWeightedRate/ChangePoint">
														<xsl:variable name="var_EROtherWeightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_EROtherWeightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_EROtherWeightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">EROtherWeightingFactor</xsl:attribute>
													<xsl:for-each select="EROtherWeightingFactor/ChangePoint">
														<xsl:variable name="var_EROtherWeightingFactor" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_EROtherWeightingFactor = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<text-val>
																		<xsl:value-of select="$var_EROtherWeightingFactor"/>
																	</text-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">MatrixUnweightedRate</xsl:attribute>
													<xsl:for-each select="MatrixUnweightedRate/ChangePoint">
														<xsl:variable name="var_MatrixUnweightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_MatrixUnweightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_MatrixUnweightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
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
												<attribute>
													<xsl:attribute name="id">OLASSUnweightedRate</xsl:attribute>
													<xsl:for-each select="OLASSUnweightedRate/ChangePoint">
														<xsl:variable name="var_OLASSUnweightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_OLASSUnweightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_OLASSUnweightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">OLASSWeightedRate</xsl:attribute>
													<xsl:for-each select="OLASSWeightedRate/ChangePoint">
														<xsl:variable name="var_OLASSWeightedRate" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_OLASSWeightedRate = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_OLASSWeightedRate"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">OLASSWeightingFactor</xsl:attribute>
													<xsl:for-each select="OLASSWeightingFactor/ChangePoint">
														<xsl:variable name="var_OLASSWeightingFactor" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_OLASSWeightingFactor = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<text-val>
																		<xsl:value-of select="$var_OLASSWeightingFactor"/>
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
			<entity>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<xsl:attribute name="id">LearningDeliveryAnnualValue</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearningDeliveryAnnualValue">
					<xsl:variable name="var_LearnDelAnnValBasicSkillsTypeCode" select="@LearnDelAnnValBasicSkillsTypeCode"/>
					<xsl:variable name="var_LearnDelAnnValDateFrom" select="@LearnDelAnnValDateFrom"/>
					<xsl:variable name="var_LearnDelAnnValDateTo" select="@LearnDelAnnValDateTo"/>
					<instance>
						<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
						<xsl:if test="string(boolean($var_LearnDelAnnValBasicSkillsTypeCode)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelAnnValBasicSkillsTypeCode</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LearnDelAnnValBasicSkillsTypeCode)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelAnnValDateFrom)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelAnnValDateFrom</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnDelAnnValDateFrom)"/>
								</date-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LearnDelAnnValDateTo)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LearnDelAnnValDateTo</xsl:attribute>
								<date-val>
									<xsl:value-of select="string($var_LearnDelAnnValDateTo)"/>
								</date-val>
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
				<xsl:attribute name="id">LearnerEmploymentStatus</xsl:attribute>
				<xsl:attribute name="complete"><xsl:value-of select="string(((normalize-space('true') = 'true') or (normalize-space('true') = '1')))"/></xsl:attribute>
				<xsl:for-each select="LearnerEmploymentStatus">
					<xsl:variable name="var_DateEmpStatApp" select="@DateEmpStatApp"/>
					<xsl:variable name="var_EmpId" select="@EmpId"/>
					<xsl:variable name="var_LargeEmployer" select="@LargeEmployer"/>
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
						<xsl:if test="string(boolean($var_LargeEmployer)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LargeEmployer</xsl:attribute>
								<boolean-val>
									<xsl:value-of select="string($var_LargeEmployer)"/>
								</boolean-val>
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
