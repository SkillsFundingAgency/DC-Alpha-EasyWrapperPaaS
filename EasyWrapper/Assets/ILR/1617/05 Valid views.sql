if object_id('ValidLearners', 'v') is not null
begin 
	exec ('drop view ValidLearners');
end
go

create view ValidLearners as
	select Learner_Id from Input.Learner
go