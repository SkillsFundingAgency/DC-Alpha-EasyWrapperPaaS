if not exists(select schema_id from sys.schemas where name='Valid')
	exec('create schema Valid')
GO
 
if object_id('[Valid].[CollectionDetails]','u') is not null
begin
	drop table [Valid].[CollectionDetails]
end
go
 
create table [Valid].[CollectionDetails]
(
	[Collection] varchar(3) not null,
	[Year] varchar(4) not null,
	[FilePreparationDate] date null
)
go

if object_id('[Valid].[Source]','u') is not null
begin
	drop table [Valid].[Source]
end
go
 
create table [Valid].[Source]
(
	[ProtectiveMarking] varchar(30) null,
	[UKPRN] int not null,
	[SoftwareSupplier] varchar(40) null,
	[SoftwarePackage] varchar(30) null,
	[Release] varchar(20) null,
	[SerialNo] varchar(2) null,
	[DateTime] datetime null,
	[ReferenceData] varchar(100) null,
	[ComponentSetVersion] varchar(20) null
)
go

if object_id('[Valid].[SourceFile]','u') is not null
begin
	drop table [Valid].[SourceFile]
end
go
 
create table [Valid].[SourceFile]
(	
	[SourceFileName] varchar(50) not null,
	[FilePreparationDate] date null,
	[SoftwareSupplier] varchar(40) null,
	[SoftwarePackage] varchar(30) null,
	[Release] varchar(20) null,
	[SerialNo] varchar(2) null,
	[DateTime] datetime null
)
create clustered index [IX_Valid_SourceFile] on [Valid].[SourceFile]
(
	[SourceFileName] asc
)
go

if object_id('[Valid].[LearningProvider]','u') is not null
begin
	drop table [Valid].[LearningProvider]
end
go
 
create table [Valid].[LearningProvider]
(		
	[UKPRN] int not null
	,primary key clustered
	(
		[UKPRN] asc
	)
)
go

if object_id('[Valid].[Learner]','u') is not null
begin
	drop table [Valid].[Learner]
end
go
 
create table [Valid].[Learner]
(
	[LearnRefNumber] varchar(12) not null,
	[PrevLearnRefNumber] varchar(12) null,
	[PrevUKPRN] int null,
	[PMUKPRN] int null,
	[ULN] bigint not null,
	[FamilyName] varchar(100) null,
	[GivenNames] varchar(100) null,
	[DateOfBirth] date null,
	[Ethnicity] int not null,
	[Sex] varchar(1) not null,
	[LLDDHealthProb] int not null,
	[NINumber] varchar(9) null,
	[PriorAttain] int null,
	[Accom] int null,
	[ALSCost] int null,
	[PlanLearnHours] int null,
	[PlanEEPHours] int null,
	[MathGrade] varchar(4) null,
	[EngGrade] varchar(4) null,
	[PostcodePrior] varchar(8) null,
	[Postcode] varchar(8) null,
	[AddLine1] varchar(50) null,
	[AddLine2] varchar(50) null,
	[AddLine3] varchar(50) null,
	[AddLine4] varchar(50) null,
	[TelNo] varchar(18) null,
	[Email] varchar(100) null
	,primary key clustered
	(
		[LearnRefNumber] asc
	)
)
go

if object_id('[Valid].[ContactPreference]','u') is not null
begin
	drop table [Valid].[ContactPreference]
end
go
 
create table [Valid].[ContactPreference]
(
	[LearnRefNumber] varchar(12) not null,
	[ContPrefType] varchar(3) not null,
	[ContPrefCode] int not null
)
create clustered index [IX_Valid_ContactPreference] on [Valid].[ContactPreference]
(
	[LearnRefNumber] asc,
	[ContPrefType] asc
)
go

if object_id('[Valid].[LLDDandHealthProblem]','u') is not null
begin
	drop table [Valid].[LLDDandHealthProblem]
end
go
 
create table [Valid].[LLDDandHealthProblem]
(
	[LearnRefNumber] varchar(12) not null,
	[LLDDCat] int not null,
	[PrimaryLLDD] int null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[LLDDCat] asc
	)
)
go

if object_id('[Valid].[LearnerFAM]','u') is not null
begin
	drop table [Valid].[LearnerFAM]
end
go
 
create table [Valid].[LearnerFAM]
(
	[LearnRefNumber] varchar(12) not null,
	[LearnFAMType] varchar(3) null,
	[LearnFAMCode] int not null
)
create clustered index [IX_Valid_LearnerFAM] on [Valid].[LearnerFAM]
(
	[LearnRefNumber] asc
)
go

if object_id('[Valid].[ProviderSpecLearnerMonitoring]','u') is not null
begin
	drop table [Valid].[ProviderSpecLearnerMonitoring]
end
go
 
create table [Valid].[ProviderSpecLearnerMonitoring]
(
	[LearnRefNumber] varchar(12) not null,
	[ProvSpecLearnMonOccur] varchar(1) not null,
	[ProvSpecLearnMon] varchar(20) not null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[ProvSpecLearnMonOccur] asc
	)
)
go

if object_id('[Valid].[LearnerEmploymentStatus]','u') is not null
begin
	drop table [Valid].[LearnerEmploymentStatus]
end
go
 
create table [Valid].[LearnerEmploymentStatus]
(
	[LearnRefNumber] varchar(12) not null,
	[EmpStat] int null,
	[DateEmpStatApp] date not null,
	[EmpId] int null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[DateEmpStatApp] asc
	)
)
go

if object_id('[Valid].[EmploymentStatusMonitoring]','u') is not null
begin
	drop table [Valid].[EmploymentStatusMonitoring]
end
go
 
create table [Valid].[EmploymentStatusMonitoring]
(	
	[LearnRefNumber] varchar(12) not null,
	[DateEmpStatApp] date not null,
	[ESMType] varchar(3) not null,
	[ESMCode] int null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[DateEmpStatApp] asc,
		[ESMType] asc
	)
)
go

if object_id('[Valid].[LearnerHE]','u') is not null
begin
	drop table [Valid].[LearnerHE]
end
go
 
create table [Valid].[LearnerHE]
(
	[LearnRefNumber] varchar(12) not null,
	[UCASPERID] varchar(10) null,
	[TTACCOM] int null
	,primary key clustered
	(
		[LearnRefNumber] asc
	)
)
GO

if object_id('[Valid].[LearnerHEFinancialSupport]','u') is not null
begin
	drop table [Valid].[LearnerHEFinancialSupport]
end
go
 
create table [Valid].[LearnerHEFinancialSupport]
(
	[LearnRefNumber] varchar(12) not null,
	[FINTYPE] int not null,
	[FINAMOUNT] int not null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[FINTYPE] asc
	)
)
go

if object_id('[Valid].[LearningDelivery]','u') is not null
begin
	drop table [Valid].[LearningDelivery]
end
go
 
create table [Valid].[LearningDelivery]
(
	[LearnRefNumber] varchar(12) not null,
	[LearnAimRef] varchar(8) not null,
	[AimType] int not null,
	[AimSeqNumber] int not null,
	[LearnStartDate] date not null,
	[OrigLearnStartDate] date null,
	[LearnPlanEndDate] date not null,
	[FundModel] int not null,
	[ProgType] int null,
	[FworkCode] int null,
	[PwayCode] int null,
	[StdCode] int null,
	[PartnerUKPRN] int null,
	[DelLocPostCode] varchar(8) null,
	[AddHours] int null,
	[PriorLearnFundAdj] int null,
	[OtherFundAdj] int null,
	[ConRefNumber] varchar(20) null,
	[EPAOrgID] varchar(7) null,
	[EmpOutcome] int null,
	[CompStatus] int not null,
	[LearnActEndDate] date null,
	[WithdrawReason] int null,
	[Outcome] int null,
	[AchDate] date null,
	[OutGrade] varchar(6) null,
	[SWSupAimId] varchar(36) null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)
go

if object_id('[Valid].[LearningDeliveryFAM]','u') is not null
begin
	drop table [Valid].[LearningDeliveryFAM]
end
go
 
create table [Valid].[LearningDeliveryFAM]
(
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[LearnDelFAMType] varchar(3) not null,
	[LearnDelFAMCode] varchar(5) not null,
	[LearnDelFAMDateFrom] date null,
	[LearnDelFAMDateTo] date null
)
create clustered index [IX_Valid_LearningDeliveryFAM] on [Valid].[LearningDeliveryFAM]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[LearnDelFAMType] asc,
	[LearnDelFAMDateFrom] asc
)
go

if object_id('[Valid].[LearningDeliveryWorkPlacement]','u') is not null
begin
	drop table [Valid].[LearningDeliveryWorkPlacement]
end
go
 
create table [Valid].[LearningDeliveryWorkPlacement]
(
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[WorkPlaceStartDate] date not null,
	[WorkPlaceEndDate] date null,
	[WorkPlaceHours] int null,
	[WorkPlaceMode] int not null,
	[WorkPlaceEmpId] int null
)
create clustered index [IX_Valid_LearningDeliveryWorkPlacement] on [Valid].[LearningDeliveryWorkPlacement]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[WorkPlaceStartDate] asc,
	[WorkPlaceMode] asc,
	[WorkPlaceEmpId] asc
)
go

if object_id('[Valid].[AppFinRecord]','u') is not null
begin
	drop table [Valid].[AppFinRecord]
end
go
 
create table [Valid].[AppFinRecord]
(
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[AFinType] varchar(3) not null,
	[AFinCode] int not null,
	[AFinDate] date not null,
	[AFinAmount] int not null
)
create clustered index [IX_Valid_AppFinRecord] on [Valid].[AppFinRecord]
(
	[LearnRefNumber] asc,
	[AimSeqNumber] asc,
	[AFinType] asc
)
go

if object_id('[Valid].[ProviderSpecDeliveryMonitoring]','u') is not null
begin
	drop table [Valid].[ProviderSpecDeliveryMonitoring]
end
go
 
create table [Valid].[ProviderSpecDeliveryMonitoring]
(
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[ProvSpecDelMonOccur] varchar(1) not null,
	[ProvSpecDelMon] varchar(20) not null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc,
		[ProvSpecDelMonOccur] asc
	)
)
go

if object_id('[Valid].[LearningDeliveryHE]','u') is not null
begin
	drop table [Valid].[LearningDeliveryHE]
end
go
 
create table [Valid].[LearningDeliveryHE]
(
	[LearnRefNumber] varchar(12) not null,
	[AimSeqNumber] int not null,
	[NUMHUS] varchar(20) null,
	[SSN] varchar(13) null,
	[QUALENT3] varchar(3) null,
	[SOC2000] int null,
	[SEC] int null,
	[UCASAPPID] varchar(9) null,
	[TYPEYR] int not null,
	[MODESTUD] int not null,
	[FUNDLEV] int not null,
	[FUNDCOMP] int not null,
	[STULOAD] decimal(4,1) null,
	[YEARSTU] int not null,
	[MSTUFEE] int not null,
	[PCOLAB] decimal(4,1) null,
	[PCFLDCS] decimal(4,1) null,
	[PCSLDCS] decimal(4,1) null,
	[PCTLDCS] decimal(4,1) null,
	[SPECFEE] int not null,
	[NETFEE] int null,
	[GROSSFEE] int null,
	[DOMICILE] varchar(2) null,
	[ELQ] int null,
	[HEPostCode] varchar(8) null
	,primary key clustered
	(
		[LearnRefNumber] asc,
		[AimSeqNumber] asc
	)
)
go

if object_id('[Valid].[LearnerDestinationandProgression]','u') is not null
begin
	drop table [Valid].[LearnerDestinationandProgression]
end
go
 
create table [Valid].[LearnerDestinationandProgression]
(
	[LearnRefNumber] varchar(12) not null,
	[ULN] bigint not null
	,primary key clustered
	(
		[LearnRefNumber] asc
	)
)
go

if object_id('[Valid].[DPOutcome]','u') is not null
begin
	drop table [Valid].[DPOutcome]
end
go
 
create table [Valid].[DPOutcome]
(
	[LearnRefNumber] varchar(12) not null,
	[OutType] varchar(3) not null,
	[OutCode] int not null,
	[OutStartDate] date not null,
	[OutEndDate] date null,
	[OutCollDate] date not null
)
create clustered index [IX_Valid_DPOutcome] on [Valid].[DPOutcome]
(
	[LearnRefNumber] asc,
	[OutType] asc,
	[OutCode] asc,
	[OutStartDate] asc
)
go





if object_id('[Valid].[LearnerDenorm]','V') is not null
begin
	drop VIEW [Valid].[LearnerDenorm]
end
go
create view Valid.LearnerDenorm
as
	select
		l.[LearnRefNumber],
		l.[PrevLearnRefNumber],
		l.[PrevUKPRN],
		l.[PMUKPRN],
		l.[ULN],
		l.[FamilyName],
		l.[GivenNames],
		l.[DateOfBirth],
		l.[Ethnicity],
		l.[Sex],
		l.[LLDDHealthProb],
		l.[NINumber],
		l.[PriorAttain],
		l.[Accom],
		l.[ALSCost],
		l.[PlanLearnHours],
		l.[PlanEEPHours],
		l.[MathGrade],
		l.[EngGrade],
		l.[PostcodePrior],
		l.[Postcode],
		l.[AddLine1],
		l.[AddLine2],
		l.[AddLine3],
		l.[AddLine4],
		l.[TelNo],
		l.[Email]
		,LSR.LSR1
		,LSR.LSR2
		,LSR.LSR3
		,LSR.LSR4
		,NLM.NLM1
		,NLM.NLM2
		,PPE.PPE1
		,PPE.PPE2
		,EDF.EDF1
		,EDF.EDF2
		,ehc.LearnFAMCode as [EHC]
		,ecf.LearnFAMCode as [ECF]
		,hns.LearnFAMCode as [HNS]
		,lda.LearnFAMCode as [LDA]
		,mcf.LearnFAMCode as [MCF]
		,ProvSpecMon_A.ProvSpecLearnMon AS ProvSpecLearnMon_A	
		,ProvSpecMon_B.ProvSpecLearnMon AS ProvSpecLearnMon_B
	from
		Valid.Learner as l
		left join
		(
			select
				LearnRefNumber,
				max([LSR1]) as [LSR1],
				max([LSR2]) as [LSR2],
				max([LSR3]) as [LSR3],
				max([LSR4]) as [LSR4]
			from
				(
					select
						LearnRefNumber,
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 1 then LearnFAMCode else null end  as [LSR1],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 2 then LearnFAMCode else null end  as [LSR2],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 3 then LearnFAMCode else null end  as [LSR3],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 4 then LearnFAMCode else null end  as [LSR4]
					from
						Valid.[LearnerFAM]
					where
						[LearnFAMType]='LSR'
				) as [LSRs]
			group by
				LearnRefNumber
		) as [LSR]
		on [LSR].LearnRefNumber = l.LearnRefNumber
		left join
		(
			select
				LearnRefNumber,
				max([NLM1]) as [NLM1],
				max([NLM2]) as [NLM2]
			from
				(
					select
						LearnRefNumber,
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 1 then LearnFAMCode else null end  as [NLM1],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 2 then LearnFAMCode else null end  as [NLM2]
					from
						Valid.[LearnerFAM]
					where
						[LearnFAMType]='NLM'
				) as [NLMs]
			group by
				LearnRefNumber
		) as [NLM]
			on [NLM].LearnRefNumber = l.LearnRefNumber
		left join
		(
			select
				LearnRefNumber,
				max([PPE1]) as [PPE1],
				max([PPE2]) as [PPE2]
			from
				(
					select
						LearnRefNumber,
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 1 then LearnFAMCode else null end  as [PPE1],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 2 then LearnFAMCode else null end  as [PPE2]
					from
						Valid.[LearnerFAM]
					where
						[LearnFAMType]='PPE'
				) as [PPEs]
			group by
				LearnRefNumber
		) as [PPE]
			on [PPE].LearnRefNumber = l.LearnRefNumber
		left join
		(
			select
				[LearnRefNumber],
				max([EDF1]) as [EDF1],
				max([EDF2]) as [EDF2]
			from
				(
					select
						[LearnRefNumber],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 1 then LearnFAMCode else null end  as [EDF1],
						case row_number() over (partition by [LearnRefNumber] order by [LearnRefNumber]) when 2 then LearnFAMCode else null end  as [EDF2]
					from
						[Valid].[LearnerFAM]
					where
						[LearnFAMType]='EDF'
				) as [EDFs]
			group by
				[LearnRefNumber]
		) as [EDF]
			on [EDF].[LearnRefNumber]=l.LearnRefNumber
		left join
			Valid.LearnerFAM as ehc
				on ehc.LearnRefNumber = l.LearnRefNumber
				and ehc.LearnFAMType = 'EHC' 
		left join
			Valid.LearnerFAM as ecf
				on ecf.LearnRefNumber = l.LearnRefNumber
				and ecf.LearnFAMType = 'ECF'
		left join
			Valid.LearnerFAM as hns
				on hns.LearnRefNumber = l.LearnRefNumber
				and hns.LearnFAMType = 'HNS'
		left join
			Valid.LearnerFAM as lda
				on lda.LearnRefNumber = l.LearnRefNumber
				and lda.LearnFAMType = 'LDA'
		left join
			Valid.LearnerFAM as mcf
				on mcf.LearnRefNumber = l.LearnRefNumber
				and mcf.LearnFAMType = 'MCF'

		left join Valid.[ProviderSpecLearnerMonitoring] as [ProvSpecMon_A]
			on [ProvSpecMon_A].[LearnRefNumber] = l.LearnRefNumber
			and [ProvSpecMon_A].[ProvSpecLearnMonOccur]='A'
		left join Valid.[ProviderSpecLearnerMonitoring] as [ProvSpecMon_B]
			on [ProvSpecMon_B].LearnRefNumber = l.[LearnRefNumber]
			and [ProvSpecMon_B].[ProvSpecLearnMonOccur]='B'
go

if object_id('[Valid].[LearnerEmploymentStatusDenorm]','V') is not null
begin
	drop VIEW [Valid].LearnerEmploymentStatusDenorm
end
go
create view Valid.LearnerEmploymentStatusDenorm
as
SELECT 
	les.[LearnRefNumber]
	,les.[EmpStat]
	,les.EmpId
	,les.[DateEmpStatApp]
	,[EmpStatMon_BSI].ESMCode AS ESMCode_BSI
	,[EmpStatMon_EII].ESMCode AS ESMCode_EII
	,[EmpStatMon_LOE].ESMCode AS ESMCode_LOE
	,[EmpStatMon_LOU].ESMCode AS ESMCode_LOU
	,[EmpStatMon_PEI].ESMCode AS ESMCode_PEI
	,[EmpStatMon_SEI].ESMCode AS ESMCode_SEI
	,[EmpStatMon_SEM].ESMCode AS ESMCode_SEM
FROM 
	Valid.[LearnerEmploymentStatus] as les
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_BSI]
		on [EmpStatMon_BSI].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_BSI].DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_BSI].[ESMType]='BSI'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_EII]
		on [EmpStatMon_EII].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_EII].DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_EII].[ESMType]='EII'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_LOE]
		on [EmpStatMon_LOE].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_LOE].DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_LOE].[ESMType]='LOE'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_LOU]
		on [EmpStatMon_LOU].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_LOU].[ESMType]='LOU'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_PEI]
		on [EmpStatMon_PEI].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_PEI].DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_PEI].[ESMType]='PEI'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_SEI]
		on [EmpStatMon_SEI].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_SEI].DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_SEI].[ESMType]='SEI'
	left join Valid.[EmploymentStatusMonitoring] as [EmpStatMon_SEM]
		on [EmpStatMon_SEM].LearnRefNumber=les.LearnRefNumber
		and [EmpStatMon_SEM].DateEmpStatApp = les.DateEmpStatApp
		and [EmpStatMon_SEM].[ESMType]='SEM'
GO


if object_id('[Valid].[LearningDeliveryDenorm]','V') is not null
begin
	drop VIEW [Valid].[LearningDeliveryDenorm]
end
go
CREATE VIEW Valid.LearningDeliveryDenorm
AS
SELECT
	ld.[LearnRefNumber]
	,ld.[LearnAimRef]
	,ld.[AimType]
	,ld.[AimSeqNumber]
	,ld.[LearnStartDate]
	,ld.[OrigLearnStartDate]
	,ld.[LearnPlanEndDate]
	,ld.[FundModel]
	,ld.[ProgType]
	,ld.[FworkCode]
	,ld.[PwayCode]
	,ld.[StdCode]
	,ld.[PartnerUKPRN]
	,ld.[DelLocPostCode]
	,ld.[AddHours]
	,ld.[PriorLearnFundAdj]
	,ld.[OtherFundAdj]
	,ld.[ConRefNumber]
	,ld.[EPAOrgID]
	,ld.[EmpOutcome]
	,ld.[CompStatus]
	,ld.[LearnActEndDate]
	,ld.[WithdrawReason]
	,ld.[Outcome]
	,ld.[AchDate]
	,ld.[OutGrade]
	,ld.[SWSupAimId]
	,HEM.HEM1
	,HEM.HEM2
	,HEM.HEM3
	,HHS.HHS1
	,HHS.HHS2
	,[LDFAM_SOF].LearnDelFAMCode AS [LDFAM_SOF]
	,[LDFAM_EEF].LearnDelFAMCode AS [LDFAM_EEF]
	,[LDFAM_RES].LearnDelFAMCode AS [LDFAM_RES]
	,[LDFAM_ADL].LearnDelFAMCode AS [LDFAM_ADL]
	,[LDFAM_FFI].LearnDelFAMCode AS [LDFAM_FFI]
	,[LDFAM_SPP].LearnDelFAMCode AS [LDFAM_SPP]
	,[ProvSpecMon_A].ProvSpecDelMon AS ProvSpecDelMon_A
	,[ProvSpecMon_B].ProvSpecDelMon	AS ProvSpecDelMon_B
	,[ProvSpecMon_C].ProvSpecDelMon	AS ProvSpecDelMon_C
	,[ProvSpecMon_D].ProvSpecDelMon	AS ProvSpecDelMon_D
	,LDM.LDM1
	,LDM.LDM2
	,LDM.LDM3
	,LDM.LDM4

FROM
	Valid.LearningDelivery as ld
	left join
	(
		select
			[LearnRefNumber],
			[AimSeqNumber],
			max([HEM1]) as [HEM1],
			max([HEM2]) as [HEM2],
			max([HEM3]) as [HEM3]
		from
			(
				select
					[LearnRefNumber],
					[AimSeqNumber],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 1 then LearnDelFAMCode else null end  as [HEM1],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 2 then LearnDelFAMCode else null end  as [HEM2],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 3 then LearnDelFAMCode else null end  as [HEM3]
				from
					Valid.[LearningDeliveryFAM]
				where
					[LearnDelFAMType]='HEM'
			) as [HEMs]
		group by
			[LearnRefNumber]
			,[AimSeqNumber]
	) as [HEM]
	on [HEM].[LearnRefNumber]=ld.[LearnRefNumber]
	and [HEM].[AimSeqNumber]=ld.[AimSeqNumber]
	left join
	(
		select
			LearnRefNumber, 
			AimSeqNumber,
			max([HHS1]) as [HHS1],
			max([HHS2]) as [HHS2]
		from
			(
				select
					LearnRefNumber,
					AimSeqNumber,
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 1 then LearnDelFAMCode else null end  as [HHS1],
					case row_number() over (partition by LearnRefNumber, AimSeqNumber order by LearnRefNumber, AimSeqNumber) when 2 then LearnDelFAMCode else null end  as [HHS2]
				from
					Valid.[LearningDeliveryFAM]
				where
					[LearnDelFAMType]='HHS'
			) as [HHSs]
		group by
			[LearnRefNumber]
			,[AimSeqNumber]
	) as [HHS]
	on [HHS].[LearnRefNumber]=ld.[LearnRefNumber]
	and [HHS].AimSeqNumber=ld.AimSeqNumber

	LEFT JOIN
		[Valid].[LearningDeliveryFAM] AS [LDFAM_SOF] 
			ON ld.[LearnRefNumber] = [LDFAM_SOF].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_SOF].[AimSeqNumber]
			AND [LDFAM_SOF].[LearnDelFAMType] = 'SOF'
	LEFT JOIN
		[Valid].[LearningDeliveryFAM] AS [LDFAM_EEF] 
			ON ld.[LearnRefNumber] = [LDFAM_EEF].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_EEF].[AimSeqNumber]
			AND [LDFAM_EEF].[LearnDelFAMType] = 'EEF'
	LEFT JOIN
		[Valid].[LearningDeliveryFAM] AS [LDFAM_RES] 
			ON ld.[LearnRefNumber] = [LDFAM_RES].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_RES].[AimSeqNumber]
			AND [LDFAM_RES].[LearnDelFAMType] = 'RES'
	LEFT JOIN            
		[Valid].[LearningDeliveryFAM] AS [LDFAM_ADL] 
			ON  ld.[LearnRefNumber] = [LDFAM_ADL].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_ADL].[AimSeqNumber]
			AND [LDFAM_ADL].[LearnDelFAMType] = 'ADL'
	LEFT JOIN
        [Valid].[LearningDeliveryFAM] AS [LDFAM_FFI] 
			ON  ld.[LearnRefNumber] = [LDFAM_FFI].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_FFI].[AimSeqNumber]
			AND [LDFAM_FFI].[LearnDelFAMType] = 'FFI'
	LEFT JOIN 
		[Valid].[LearningDeliveryFAM] AS [LDFAM_SPP] 
			ON ld.[LearnRefNumber] = [LDFAM_SPP].[LearnRefNumber]
			AND ld.[AimSeqNumber] = [LDFAM_SPP].[AimSeqNumber]
			AND [LDFAM_SPP].[LearnDelFAMType] = 'SPP'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_A]
		on [ProvSpecMon_A].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_A].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_A].[ProvSpecDelMonOccur]='A'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_B]
		on [ProvSpecMon_B].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_B].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_B].[ProvSpecDelMonOccur]='B'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_C]
		on [ProvSpecMon_C].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_C].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_C].[ProvSpecDelMonOccur]='C'

	left join Valid.[ProviderSpecDeliveryMonitoring] as [ProvSpecMon_D]
		on [ProvSpecMon_D].[LearnRefNumber]=ld.[LearnRefNumber]
		and [ProvSpecMon_D].[AimSeqNumber]=ld.[AimSeqNumber]
		and [ProvSpecMon_D].[ProvSpecDelMonOccur]='D' 
	left join
	(
		select
			[LearnRefNumber],
			[AimSeqNumber],
			max([LDM1]) as [LDM1],
			max([LDM2]) as [LDM2],
			max([LDM3]) as [LDM3],
			max([LDM4]) as [LDM4]
		from
		(
			select
				[LearnRefNumber],
				[AimSeqNumber],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber order by [LearnRefNumber]) when 1 then LearnDelFAMCode else null end  as [LDM1],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber order by [LearnRefNumber]) when 2 then LearnDelFAMCode else null end  as [LDM2],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber order by [LearnRefNumber]) when 3 then LearnDelFAMCode else null end  as [LDM3],
				case row_number() over (partition by [LearnRefNumber], AimSeqNumber order by [LearnRefNumber]) when 4 then LearnDelFAMCode else null end  as [LDM4]
			from
				[Valid].[LearningDeliveryFAM]
			where
				[LearnDelFAMType]='LDM'
		) as [LDMs]
		group by
			[LearnRefNumber],
			[AimSeqNumber]
	) as [LDM]
	on [LDM].[LearnRefNumber]=ld.[LearnRefNumber]
	and LDM.AimSeqNumber = ld.AimSeqNumber
go


if object_id ('Valid.TrailblazerApprenticeshipFinancialRecord', 'v') is not null
begin
	drop view Valid.TrailblazerApprenticeshipFinancialRecord
end
go

create view Valid.TrailblazerApprenticeshipFinancialRecord
as
	select
		LearnRefNumber
		,AimSeqNumber
		,AFinType as TBFinType
		,AFinCode as TBFinCode
		,AFinAmount as TBFinAmount
		,AFinDate as TBFinDate
	from
		Valid.AppFinRecord
go