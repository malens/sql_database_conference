USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddReservation]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 
-- Description:	adds a new conference to the table
-- =============================================
create PROCEDURE [dbo].[AddReservation] 
	-- Add the parameters for the stored procedure here
	@ClientID int,
	@ReservationDate date = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if (@ReservationDate is null)
	set @ReservationDate = getdate()

	Insert into Reservations (ClientID, ReservationDate)
	values (@ClientID, @ReservationDate)
	
END

GO
