USE [wilkosz_a]
GO
/****** Object:  UserDefinedFunction [dbo].[timeContinuumDiscounts]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>				
-- =============================================
create FUNCTION [dbo].[timeContinuumDiscounts](@ConferenceID int)
RETURNS int
AS BEGIN RETURN (
    select count(*) from Discounts as d1
	inner join Discounts as d2 on d1.DiscountDate < d2.DiscountDate and d1.ConferenceID = d2.ConferenceID
	where d1.Discount<d2.Discount and d1.ConferenceID = @ConferenceID
) END

GO
