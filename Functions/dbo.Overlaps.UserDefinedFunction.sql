USE [wilkosz_a]
GO
/****** Object:  UserDefinedFunction [dbo].[Overlaps]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>				
-- =============================================
CREATE FUNCTION [dbo].[Overlaps]()
RETURNS int
AS BEGIN RETURN (
    SELECT count(*)
    FROM WorkshopDay wd1
    JOIN WorkshopDay wd2
    ON wd1.WorkshopID < wd2.WorkshopID and wd1.ConferenceID = wd2.ConferenceID and wd1.DayNo = wd2.DayNo
    AND wd1.BeginTime < wd2.EndTime
    AND wd1.EndTime > wd2.BeginTime
	join WorkshopAtendees wa on wa.WorkshopID = wd1.WorkshopID and wa.DayNo = wd1.DayNo and wa.ConferenceID = wd1.ConferenceID
	join WorkshopAtendees wa1 on wa1.WorkshopID = wd2.WorkshopID and wa1.DayNo = wd2.DayNo and wa1.ConferenceID = wd2.ConferenceID
    AND wa1.PersonID = wa.PersonID
) END

GO
