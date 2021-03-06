USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddPayment]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 2017-01-09
-- Description:	Procedures for adding new student
-- =============================================
create PROCEDURE [dbo].[AddPayment] 
	-- Add the parameters for the stored procedure here
	@PaymentDate date = null,
	@ReservationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @PaymentDate is null
	set @PaymentDate = getdate()

	update Reservations
	set PaymentDate = @Paymentdate
	where ReservationID = @ReservationID
END

GO
