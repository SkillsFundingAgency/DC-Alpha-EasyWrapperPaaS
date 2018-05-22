--multi copy script

truncate table Valid.LearningProvider
insert into Valid.LearningProvider
(	
	UKPRN
)
select
	UKPRN
from
	[$(FromILRDatabase)].[Valid].LearningProvider
where
	UKPRN = $(UKPRN)
go

truncate table Valid.CollectionDetails
insert into Valid.CollectionDetails
(
	[UKPRN]
	,[Year]
	,[FilePreparationDate]
	,[Collection]
)
select
	[UKPRN]
	,[Year]
	,[FilePreparationDate]
	,[Collection]
from
	[$(FromILRDatabase)].[Valid].CollectionDetails
where
	UKPRN = $(UKPRN)
go

truncate table Valid.[Source]
insert into [Valid].[Source]
(
	ProtectiveMarking
	,UKPRN
	,SoftwareSupplier
	,SoftwarePackage
	,Release
	,SerialNo
	,[DateTime]
	,[ReferenceData]
	,[ComponentSetVersion]
)
select
	ProtectiveMarking
	,UKPRN
	,SoftwareSupplier
	,SoftwarePackage
	,Release
	,SerialNo
	,[DateTime]
	,[ReferenceData]
	,[ComponentSetVersion]
from
	[$(FromILRDatabase)].[Valid].[Source]
where
	UKPRN = $(UKPRN)
go

truncate table Valid.SourceFile
insert into Valid.SourceFile
(
	[UKPRN]
	,SourceFileName
	,FilePreparationDate
	,SoftwareSupplier
	,SoftwarePackage
	,Release
	,[DateTime]
	,[SerialNo]
)
select
	[UKPRN]
	,SourceFileName
	,FilePreparationDate
	,SoftwareSupplier
	,SoftwarePackage
	,Release
	,[DateTime]
	,[SerialNo]
from
	[$(FromILRDatabase)].[Valid].SourceFile
where
	UKPRN = $(UKPRN)
go

truncate table Valid.AppFinRecord
insert into Valid.AppFinRecord
(
	[UKPRN]
	,LearnRefNumber
	,AimSeqNumber
	,AFinType
	,AFinCode
	,AFinDate
	,AFinAmount
)
select
	afr.[UKPRN]
	,afr.LearnRefNumber
	,afr.AimSeqNumber
	,afr.AFinType
	,afr.AFinCode
	,afr.AFinDate
	,afr.AFinAmount
from
	[$(FromILRDatabase)].[Valid].AppFinRecord as afr
where
	afr.UKPRN = $(UKPRN)
go

truncate table Valid.ContactPreference
insert into Valid.ContactPreference
(
	[UKPRN]
	,LearnRefNumber
	,ContPrefType
	,ContPrefCode
)
select
	cp.[UKPRN]
	,cp.LearnRefNumber
	,cp.ContPrefType
	,cp.ContPrefCode
from
	[$(FromILRDatabase)].[Valid].ContactPreference as cp
where
	cp.UKPRN = $(UKPRN)	
go

truncate table Valid.DPOutcome
insert into Valid.DPOutcome
(
	[UKPRN]
	,LearnRefNumber
	,OutType
	,OutCode
	,OutStartDate
	,OutEndDate
	,OutCollDate
)
select
	dp.[UKPRN]
	,dp.LearnRefNumber
	,dp.OutType
	,dp.OutCode
	,dp.OutStartDate
	,dp.OutEndDate
	,dp.OutCollDate
from
	[$(FromILRDatabase)].[Valid].DPOutcome as dp
where
	dp.UKPRN = $(UKPRN)
go

truncate table Valid.EmploymentStatusMonitoring
insert into Valid.EmploymentStatusMonitoring
(
	[UKPRN]
	,LearnRefNumber
	,DateEmpStatApp
	,ESMType
	,ESMCode
)
select
	esm.[UKPRN]
	,esm.LearnRefNumber
	,esm.DateEmpStatApp
	,esm.ESMType
	,esm.ESMCode
from
	[$(FromILRDatabase)].[Valid].EmploymentStatusMonitoring as esm
where
	esm.UKPRN = $(UKPRN)
go

truncate table Valid.Learner
insert into Valid.Learner
(
	[UKPRN], 
	LearnRefNumber, 
	PrevLearnRefNumber, 
	PrevUKPRN, 
	PMUKPRN, 
	ULN, 
	FamilyName, 
	GivenNames, 
	DateOfBirth, 
	Ethnicity, 
	Sex, 
	LLDDHealthProb, 
	NINumber, 
	PriorAttain, 
	Accom, 
	ALSCost, 
	PlanLearnHours, 
	PlanEEPHours, 
	MathGrade,
	EngGrade, 
	PostcodePrior, 
	Postcode, 
	AddLine1, 
	AddLine2, 
	AddLine3, 
	AddLine4, 
	TelNo, 
	Email
)
select
	[UKPRN], 
	LearnRefNumber, 
	PrevLearnRefNumber, 
	PrevUKPRN, 
	PMUKPRN, 
	ULN, 
	FamilyName, 
	GivenNames, 
	DateOfBirth, 
	Ethnicity, 
	Sex, 
	LLDDHealthProb, 
	NINumber, 
	PriorAttain, 
	Accom, 
	ALSCost, 
	PlanLearnHours, 
	PlanEEPHours, 
	MathGrade,
	EngGrade, 
	PostcodePrior, 
	Postcode, 
	AddLine1, 
	AddLine2, 
	AddLine3, 
	AddLine4, 
	TelNo, 
	Email
from
	[$(FromILRDatabase)].[Valid].Learner
where
	UKPRN = $(UKPRN)
go

truncate table Valid.LearnerDestinationandProgression
insert into Valid.LearnerDestinationandProgression
(
	[UKPRN],
	LearnRefNumber,
	ULN
)
select
	[UKPRN],
	LearnRefNumber,
	ULN
from
	[$(FromILRDatabase)].[Valid].LearnerDestinationandProgression
where
	UKPRN = $(UKPRN)
go

truncate table Valid.LearnerEmploymentStatus
insert into Valid.LearnerEmploymentStatus
(
	[UKPRN]
	,LearnRefNumber
	,EmpStat
	,DateEmpStatApp
	,EmpId
)
select
	les.[UKPRN]
	,les.LearnRefNumber
	,les.EmpStat
	,les.DateEmpStatApp
	,les.EmpId
from
	[$(FromILRDatabase)].[Valid].LearnerEmploymentStatus as les
where
	les.UKPRN = $(UKPRN)
go

truncate table Valid.LearnerFAM
insert into Valid.LearnerFAM
(
	[UKPRN]
	,LearnRefNumber
	,LearnFAMType
	,LearnFAMCode
)
select
	lf.[UKPRN]
	,lf.LearnRefNumber
	,lf.LearnFAMType
	,lf.LearnFAMCode
from
	[$(FromILRDatabase)].[Valid].LearnerFAM as lf
where
	lf.UKPRN = $(UKPRN)
go

truncate table Valid.LearnerHE
insert into Valid.LearnerHE
(
	[UKPRN]
	,LearnRefNumber
	,UCASPERID
	,TTACCOM
)
select
	lh.[UKPRN]
	,lh.LearnRefNumber
	,lh.UCASPERID
	,lh.TTACCOM
from
	[$(FromILRDatabase)].[Valid].LearnerHE as lh
where
	lh.UKPRN = $(UKPRN)
go

truncate table Valid.LearnerHEFinancialSupport
insert into Valid.LearnerHEFinancialSupport
(
	[UKPRN]
	,LearnRefNumber
	,FINTYPE
	,FINAMOUNT
)
select
	lhfs.[UKPRN]
	,lhfs.LearnRefNumber
	,lhfs.FINTYPE
	,lhfs.FINAMOUNT
from
	[$(FromILRDatabase)].[Valid].LearnerHEFinancialSupport as lhfs
where
	lhfs.UKPRN = $(UKPRN)
go

truncate table Valid.LearningDelivery
insert into Valid.LearningDelivery
(
	[UKPRN], 
	LearnRefNumber, 
	LearnAimRef, 
	AimType, 
	AimSeqNumber, 
	LearnStartDate, 
	OrigLearnStartDate, 
	LearnPlanEndDate, 
	FundModel,
	ProgType, 
	FworkCode, 
	PwayCode, 
	StdCode, 
	PartnerUKPRN, 
	DelLocPostCode, 
	AddHours, 
	PriorLearnFundAdj, 
	OtherFundAdj, 
	ConRefNumber, 
	EPAOrgID, 
	EmpOutcome, 
	CompStatus, 
	LearnActEndDate, 
	WithdrawReason, 
	Outcome, 
	AchDate, 
	OutGrade, 
	SWSupAimId
)
select
	ld.[UKPRN] 
	,ld.LearnRefNumber 
	,ld.LearnAimRef 
	,ld.AimType 
	,ld.AimSeqNumber 
	,ld.LearnStartDate 
	,ld.OrigLearnStartDate 
	,ld.LearnPlanEndDate 
	,ld.FundModel
	,ld.ProgType 
	,ld.FworkCode 
	,ld.PwayCode 
	,ld.StdCode 
	,ld.PartnerUKPRN 
	,ld.DelLocPostCode 
	,ld.AddHours 
	,ld.PriorLearnFundAdj 
	,ld.OtherFundAdj 
	,ld.ConRefNumber 
	,ld.EPAOrgID 
	,ld.EmpOutcome 
	,ld.CompStatus 
	,ld.LearnActEndDate 
	,ld.WithdrawReason 
	,ld.Outcome 
	,ld.AchDate 
	,ld.OutGrade 
	,ld.SWSupAimId
from
	[$(FromILRDatabase)].[Valid].LearningDelivery as ld
where
	ld.UKPRN = $(UKPRN)
go

truncate table Valid.LearningDeliveryFAM
insert into Valid.LearningDeliveryFAM
(
	[UKPRN]
	,LearnRefNumber
	,AimSeqNumber
	,LearnDelFAMType
	,LearnDelFAMCode
	,LearnDelFAMDateFrom
	,LearnDelFAMDateTo
)
select
	ldf.[UKPRN]
	,ldf.LearnRefNumber
	,ldf.AimSeqNumber
	,ldf.LearnDelFAMType
	,ldf.LearnDelFAMCode
	,ldf.LearnDelFAMDateFrom
	,ldf.LearnDelFAMDateTo
from
	[$(FromILRDatabase)].[Valid].LearningDeliveryFAM as ldf
where
	ldf.UKPRN = $(UKPRN)
go

truncate table Valid.LearningDeliveryHE
insert into Valid.LearningDeliveryHE
(
	[UKPRN], 
	LearnRefNumber, 
	AimSeqNumber,
	NUMHUS, 
	SSN, 
	QUALENT3, 
	SOC2000, 
	SEC, 
	UCASAPPID, 
	TYPEYR, 
	MODESTUD, 
	FUNDLEV, 
	FUNDCOMP, 
	STULOAD, 
	YEARSTU, 
	MSTUFEE, 
	PCOLAB, 
	PCFLDCS, 
	PCSLDCS, 
	PCTLDCS, 
	SPECFEE, 
	NETFEE, 
	GROSSFEE, 
	DOMICILE, 
	ELQ, 
	HEPostCode
)
select
	ldh.[UKPRN]
	,ldh.LearnRefNumber
	,ldh.AimSeqNumber,
	ldh.NUMHUS, 
	ldh.SSN, 
	ldh.QUALENT3, 
	ldh.SOC2000, 
	ldh.SEC, 
	ldh.UCASAPPID, 
	ldh.TYPEYR, 
	ldh.MODESTUD, 
	ldh.FUNDLEV, 
	ldh.FUNDCOMP, 
	ldh.STULOAD, 
	ldh.YEARSTU, 
	ldh.MSTUFEE, 
	ldh.PCOLAB, 
	ldh.PCFLDCS, 
	ldh.PCSLDCS, 
	ldh.PCTLDCS, 
	ldh.SPECFEE, 
	ldh.NETFEE, 
	ldh.GROSSFEE, 
	ldh.DOMICILE, 
	ldh.ELQ, 
	ldh.HEPostCode
from
	[$(FromILRDatabase)].[Valid].LearningDeliveryHE as ldh
where
	ldh.UKPRN = $(UKPRN)
go

truncate table Valid.LearningDeliveryWorkPlacement
insert into Valid.LearningDeliveryWorkPlacement
(
	[UKPRN]
	,LearnRefNumber
	,AimSeqNumber
	,WorkPlaceStartDate
	,WorkPlaceEndDate
	,WorkPlaceHours
	,WorkPlaceMode
	,WorkPlaceEmpId
)
select
	ldwp.[UKPRN]
	,ldwp.LearnRefNumber
	,ldwp.AimSeqNumber
	,ldwp.WorkPlaceStartDate
	,ldwp.WorkPlaceEndDate
	,ldwp.WorkPlaceHours
	,ldwp.WorkPlaceMode
	,ldwp.WorkPlaceEmpId
from
	[$(FromILRDatabase)].[Valid].LearningDeliveryWorkPlacement as ldwp
where
	ldwp.UKPRN = $(UKPRN)
go

truncate table Valid.LLDDandHealthProblem
insert into Valid.LLDDandHealthProblem
(
	[UKPRN]
	,LearnRefNumber
	,LLDDCat
	,PrimaryLLDD
)
select
	lhp.[UKPRN]
	,lhp.LearnRefNumber
	,lhp.LLDDCat
	,lhp.PrimaryLLDD
from
	[$(FromILRDatabase)].[Valid].LLDDandHealthProblem as lhp
where
	lhp.UKPRN = $(UKPRN)
go

truncate table Valid.ProviderSpecDeliveryMonitoring
insert into Valid.ProviderSpecDeliveryMonitoring
(
	[UKPRN]
	,LearnRefNumber
	,AimSeqNumber
	,ProvSpecDelMonOccur
	,ProvSpecDelMon
)
select
	psdm.[UKPRN]
	,psdm.LearnRefNumber
	,psdm.AimseqNumber
	,psdm.ProvSpecDelMonOccur
	,psdm.ProvSpecDelMon
from
	[$(FromILRDatabase)].[Valid].ProviderSpecDeliveryMonitoring as psdm
where
	psdm.UKPRN = $(UKPRN)
go

truncate table Valid.ProviderSpecLearnerMonitoring
insert into Valid.ProviderSpecLearnerMonitoring
(
	[UKPRN]
	,LearnRefNumber
	,ProvSpecLearnMonOccur
	,ProvSpecLearnMon
)
select
	UKPRN
	,pslm.LearnRefNumber
	,pslm.ProvSpecLearnMonOccur
	,pslm.ProvSpecLearnMon
from	
	[$(FromILRDatabase)].[Valid].ProviderSpecLearnerMonitoring as pslm
where
	UKPRN = $(UKPRN)
go