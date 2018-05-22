# Introduction 
EasyWrapper was designed to execute OPA rulebases (validation, calculation, etc).
It is relatively lightweight and so is a good execution test for a number of experiments.

This code base can use Azure SQL PaaS as a database source for the various operations it can apply.
The syntax is slightly different in places and so this includes "SQL PaaS only versions of the scripts"

# Getting Started
Validation is the simplest rulebase. The ValidationExecutor.Execute is the main entry point.
It:
1) Creates a intrajob database (working set database).
2) Populates the intrajob (using a pre-created ILR database)
3) Executes the pre-validation scripts (to created OPA case data)
4) Uses the OPA wrapper library to execute the rule base


# Build and Test
No unit tests :(
Code is duplicated all over the place
You will need an azure database / credentials to connect

See the EasyWrapperPaaS/Assets/ILR/1718/99 ILR External Data Tables.sql
This sets up the external data tables and was actually the main experiment in this repo.
The "EasyWrapper" that it was based on is very similar to the Funding Information Service


# Contribute
