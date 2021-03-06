USE [wilkosz_a]
GO
/****** Object:  UserDefinedFunction [dbo].[getReservedUnpopulatedNumberWorkshop]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>				
-- =============================================
CREATE FUNCTION [dbo].[getReservedUnpopulatedNumberWorkshop](@DayNo int, @ConferenceID int, @WorkshopID int)
RETURNS int
AS 
BEGIN 

	return (select rwd.ReservedNo - count(wa.PersonID) from WorkshopAtendees as wa
	join DayAtendees as da on wa.PersonID = da.PersonID
	join ReservationWorkshopDay as rwd on rwd.ConferenceID = wa.ConferenceID and rwd.DayNo = wa.DayNo and rwd.WorkshopID = wa.WorkshopID
	where rwd.ReservationID = da.ReservationID and wa.DayNo = @DayNo and wa.ConferenceID = @ConferenceID and wa.WorkshopID = @WorkshopID
	group by wa.ConferenceID, wa.DayNo, wa.WorkshopID, rwd.ReservedNo)

END

GO
