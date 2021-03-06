USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[DeleteLateReservations]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteLateReservations]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from ReservationWorkshopDay where 
	ReservationWorkshopDay.ReservationID = (SELECT ReservationID
	FROM dbo.Reservations
	WHERE (PaymentDate IS NULL) AND (DATEDIFF(day, ReservationDate, GETDATE()) > 14))

	delete from ReservationConferenceDay where 
	ReservationConferenceDay.ReservationID = (SELECT ReservationID
	FROM dbo.Reservations
	WHERE (PaymentDate IS NULL) AND (DATEDIFF(day, ReservationDate, GETDATE()) > 14))

	delete from Reservations where 
	Reservations.ReservationID = (SELECT ReservationID
	FROM dbo.Reservations
	WHERE (PaymentDate IS NULL) AND (DATEDIFF(day, ReservationDate, GETDATE()) > 14))


END

GO
