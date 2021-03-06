USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[deleteall]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteall]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from Discounts
	delete from CompanyClients
	delete from PersonalClients
	
	delete from WorkshopAtendees
	delete from DayAtendees
	
	delete from Reservations
	delete from clients
	delete from students
	
	delete from persons
	
	
	delete from ReservationWorkshopDay
	delete from ReservationConferenceDay
	delete from WorkshopDay
	delete from ConferenceDay
	delete from Workshops
	delete from Conferences

	exec reseed
    
END


GO
