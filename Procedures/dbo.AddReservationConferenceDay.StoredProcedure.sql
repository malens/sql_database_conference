USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddReservationConferenceDay]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 
-- Description:	adds a new conference to the table
-- =============================================
CREATE PROCEDURE [dbo].[AddReservationConferenceDay] 
	-- Add the parameters for the stored procedure here
	@ConferenceID int,
	@DayNo int,
	@ReservedNo int,
	@ReservationID int,
	@StudentReservedNo int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	Insert into ReservationConferenceDay (ReservationID, ConferenceID, DayNo, ReservedNo, StudentReservedNo)
	values (@ReservationID, @ConferenceID, @DayNo, @ReservedNo, @StudentReservedNo)
	
	return @ReservationID
END

GO
