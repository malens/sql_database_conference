USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddReservationWorkshopDay]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 
-- Description:	adds a new conference to the table
-- =============================================
CREATE PROCEDURE [dbo].[AddReservationWorkshopDay] 
	-- Add the parameters for the stored procedure here
	@ConferenceID int,
	@ReservationID int,
	@DayNo int,
	@ReservedNo int,
	@WorkshopID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into ReservationWorkshopDay (ReservationID, WorkshopID, ConferenceID, DayNo, ReservedNo)
	values (@ReservationID,@WorkshopID, @ConferenceID, @DayNo, @ReservedNo)
	
END

GO
