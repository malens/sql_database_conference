USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddDiscount]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 2017/01/10
-- Description:	
-- =============================================
create PROCEDURE [dbo].[AddDiscount] 
	-- Add the parameters for the stored procedure here
	@ConferenceID int, 
	@DiscountDate date,
	@DiscountRate real
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Discounts
	values (@ConferenceID, @DiscountDate, @DiscountRate)
	
END

GO
