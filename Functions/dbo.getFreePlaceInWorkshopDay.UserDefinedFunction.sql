USE [wilkosz_a]
GO
/****** Object:  UserDefinedFunction [dbo].[getFreePlaceInWorkshopDay]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>				
-- =============================================
create FUNCTION [dbo].[getFreePlaceInWorkshopDay](@ConferenceID int, @DayNo int, @WorkshopID int)
RETURNS int
AS 
BEGIN 
	
	return ((select PersonsLimit from WorkshopDay where WorkshopID = @WorkshopID and DayNo = @DayNo and ConferenceID = @ConferenceID) - 
	(select sum(rwd.ReservedNo) from ReservationWorkshopDay as rwd 
	where rwd.ConferenceID = @ConferenceID and rwd.DayNo = @DayNo and rwd.WorkshopID = @WorkshopID))


END

GO
