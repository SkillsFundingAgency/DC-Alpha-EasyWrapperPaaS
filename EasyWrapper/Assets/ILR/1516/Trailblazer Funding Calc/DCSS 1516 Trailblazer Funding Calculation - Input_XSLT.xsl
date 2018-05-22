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
					<xsl:variable name="var_DateOfBirth" select="@DateOfBirth"/>
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
					<xsl:variable name="var_AimSeqNumber" select="@AimSeqNumber"/>
					<xsl:variable name="var_AimType" select="@AimType"/>
					<xsl:variable name="var_CompStatus" select="@CompStatus"/>
					<xsl:variable name="var_FrameworkCommonComponent" select="@FrameworkCommonComponent"/>
					<xsl:variable name="var_LearnActEndDate" select="@LearnActEndDate"/>
					<xsl:variable name="var_LearnAimRef" select="@LearnAimRef"/>
					<xsl:variable name="var_LearnPlanEndDate" select="@LearnPlanEndDate"/>
					<xsl:variable name="var_LearnStartDate" select="@LearnStartDate"/>
					<xsl:variable name="var_LrnDelFAM_EEF" select="@LrnDelFAM_EEF"/>
					<xsl:variable name="var_LrnDelFAM_LDM1" select="@LrnDelFAM_LDM1"/>
					<xsl:variable name="var_LrnDelFAM_LDM2" select="@LrnDelFAM_LDM2"/>
					<xsl:variable name="var_LrnDelFAM_LDM3" select="@LrnDelFAM_LDM3"/>
					<xsl:variable name="var_LrnDelFAM_LDM4" select="@LrnDelFAM_LDM4"/>
					<xsl:variable name="var_LrnDelFAM_RES" select="@LrnDelFAM_RES"/>
					<xsl:variable name="var_LrnDelFAM_SOF" select="@LrnDelFAM_SOF"/>
					<xsl:variable name="var_LrnDelFAM_SPP" select="@LrnDelFAM_SPP"/>
					<xsl:variable name="var_LrnDelFAM_TBS" select="@LrnDelFAM_TBS"/>
					<xsl:variable name="var_OrigLearnStartDate" select="@OrigLearnStartDate"/>
					<xsl:variable name="var_OtherFundAdj" select="@OtherFundAdj"/>
					<xsl:variable name="var_Outcome" select="@Outcome"/>
					<xsl:variable name="var_PriorLearnFundAdj" select="@PriorLearnFundAdj"/>
					<xsl:variable name="var_ProgType" select="@ProgType"/>
					<xsl:variable name="var_WithdrawReason" select="@WithdrawReason"/>
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
						<xsl:if test="string(boolean($var_FrameworkCommonComponent)) != 'false'">
							<attribute>
								<xsl:attribute name="id">FrameworkCommonComponent</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_FrameworkCommonComponent)"/>
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
						<xsl:if test="string(boolean($var_LrnDelFAM_EEF)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_EEF</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_EEF)"/>
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
						<xsl:if test="string(boolean($var_LrnDelFAM_SOF)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_SOF</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_SOF)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_SPP)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_SPP</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_SPP)"/>
								</number-val>
							</attribute>
						</xsl:if>
						<xsl:if test="string(boolean($var_LrnDelFAM_TBS)) != 'false'">
							<attribute>
								<xsl:attribute name="id">LrnDelFAM_TBS</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_LrnDelFAM_TBS)"/>
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
						<xsl:if test="string(boolean($var_WithdrawReason)) != 'false'">
							<attribute>
								<xsl:attribute name="id">WithdrawReason</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_WithdrawReason)"/>
								</number-val>
							</attribute>
						</xsl:if>

												<attribute>
													<xsl:attribute name="id">AchIncentive</xsl:attribute>
													<xsl:for-each select="AchIncentive/ChangePoint">
														<xsl:variable name="var_AchIncentive" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_AchIncentive = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_AchIncentive"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">CoreGovContCap</xsl:attribute>
													<xsl:for-each select="CoreGovContCap/ChangePoint">
														<xsl:variable name="var_CoreGovContCap" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_CoreGovContCap = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_CoreGovContCap"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">SmallBusIncentive</xsl:attribute>
													<xsl:for-each select="SmallBusIncentive/ChangePoint">
														<xsl:variable name="var_SmallBusIncentive" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_SmallBusIncentive = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_SmallBusIncentive"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>
												<attribute>
													<xsl:attribute name="id">YoungAppIncentive</xsl:attribute>
													<xsl:for-each select="YoungAppIncentive/ChangePoint">
														<xsl:variable name="var_YoungAppIncentive" select="string(@Value)"/>
														<change-point>
															<xsl:attribute name="date">
																<xsl:value-of select="string(@Date)"/>
															</xsl:attribute>
															<xsl:choose>
																<xsl:when test="string(($var_YoungAppIncentive = 'unknown-val')) != 'false'">
																	<unknown-val>
																		<xsl:value-of select="/.."/>
																	</unknown-val>
																</xsl:when>
																<xsl:otherwise>
																	<currency-val>
																		<xsl:value-of select="$var_YoungAppIncentive"/>
																	</currency-val>
																</xsl:otherwise>
															</xsl:choose>
														</change-point>
													</xsl:for-each>
												</attribute>

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
					<xsl:variable name="var_ESMType_SEM" select="@ESMType_SEM"/>
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
						<xsl:if test="string(boolean($var_ESMType_SEM)) != 'false'">
							<attribute>
								<xsl:attribute name="id">ESMType_SEM</xsl:attribute>
								<number-val>
									<xsl:value-of select="string($var_ESMType_SEM)"/>
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

		</session-data>
	</xsl:template>
</xsl:stylesheet>
