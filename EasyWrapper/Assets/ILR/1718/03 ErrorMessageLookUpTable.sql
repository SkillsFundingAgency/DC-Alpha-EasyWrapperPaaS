if not exists (select * from sys.schemas where name = 'ErrorReference')
begin
	exec ('create schema [ErrorReference]');
end
go

IF OBJECT_ID('ErrorReference.ErrorMessageLookUp') IS NOT NULL
BEGIN
    DROP TABLE [ErrorReference].[ErrorMessageLookUp]
END;

GO

CREATE TABLE [ErrorReference].[ErrorMessageLookUp]
(
       [RuleName] VARCHAR(50) PRIMARY KEY,
       [Severity] VARCHAR(2) NULL,
       [ErrorMessage] VARCHAR(MAX) NULL   
) ON [PRIMARY]
go