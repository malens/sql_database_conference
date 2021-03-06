USE [wilkosz_a]
GO
/****** Object:  UserDefinedFunction [dbo].[getReservedPlacesLeftWorkshop]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>				
-- =============================================
CREATE FUNCTION [dbo].[getReservedPlacesLeftWorkshop](@DayNo int, @ConferenceID int, @WorkshopID int)
RETURNS int
AS 
BEGIN 
	return((select sum(ReservedNo) from ReservationWorkshopDay as rwd
	where rwd.WorkshopID = @WorkshopID 
	and rwd.ConferenceID = @ConferenceID and rwd.DayNo = @DayNo) 
	-
	(
	select count(*) from WorkshopAtendees as wa
	where wa.ConferenceID = @ConferenceID and wa.WorkshopID = @WorkshopID and wa.DayNo = @DayNo
	))

END

GO
