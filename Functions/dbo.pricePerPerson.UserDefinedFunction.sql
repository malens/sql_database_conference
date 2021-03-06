USE [wilkosz_a]
GO
/****** Object:  UserDefinedFunction [dbo].[pricePerPerson]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>				
-- =============================================
CREATE FUNCTION [dbo].[pricePerPerson](@ConferenceID int, @isStudent bit)
RETURNS money
AS 
BEGIN 
	if (@isStudent=1)
	begin
		return (SELECT PricePerDay * StudentDiscount * (1-dbo.getDiscount(@ConferenceID, getdate())) from Conferences as c
		where c.ConferenceID = @ConferenceID)
	end
	else
	begin
		return (SELECT PricePerDay * (1-dbo.getDiscount(@ConferenceID, getdate())) from Conferences as c
		where c.ConferenceID = @ConferenceID)
	end
	return null
END

GO
