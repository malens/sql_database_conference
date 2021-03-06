USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddCompanyClient]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 2017-01-09
-- Description:	Procedures for adding new CompanyClient
-- =============================================
CREATE PROCEDURE [dbo].[AddCompanyClient] 
	-- Add the parameters for the stored procedure here
	@Phone varchar(15),
	@Email varchar(20),
	@CompanyName varchar(30),
	@Address varchar(30),
	@FirstName varchar(20),
	@LastName varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO Clients (Phone)
	values (@Phone)
	declare @id int = SCOPE_IDENTITY()
	Exec [dbo].[AddPerson] @FIrstName, @LastName, @Email
	declare @id2 int = SCOPE_IDENTITY()
	Insert into CompanyClients (ClientID, CompanyName, Address, RepresentantID)
	values (@id, @CompanyName, @Address, @id2)
	
END

GO
