USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddStudentToPerson]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 2017-01-09
-- Description:	Procedures for adding new student
-- =============================================
CREATE PROCEDURE [dbo].[AddStudentToPerson] 
	-- Add the parameters for the stored procedure here
	@PersonID int, 
	@StudentID varchar(20),
	@University varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	insert into Students
	values (@StudentID, @PersonID, @University)
END

GO
