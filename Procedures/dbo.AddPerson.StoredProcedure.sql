USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddPerson]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Samuel Tomczyk
-- Create date: 2017-01-09
-- Description:	Procedures for adding new person
-- =============================================
CREATE PROCEDURE [dbo].[AddPerson] 
	-- Add the parameters for the stored procedure here
	@FirstName varchar(20) = 0,
	@LastName varchar(20) = 0,
	@Email varchar (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO Persons 
	values (@FirstName, @LastName, @Email)
END

GO
