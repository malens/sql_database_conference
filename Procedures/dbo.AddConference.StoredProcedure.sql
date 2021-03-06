USE [wilkosz_a]
GO
/****** Object:  StoredProcedure [dbo].[AddConference]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jakub Wilkosz
-- Create date: 
-- Description:	adds a new conference to the table
-- =============================================
CREATE PROCEDURE [dbo].[AddConference] 
	-- Add the parameters for the stored procedure here
	@ConferenceName varchar(60), 
	@StudentDiscount real,
	@StartDay date,
	@EndDay date,
	@PricePerDay money, 
	@PersonsLimit int,
	@Description text 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if (@StartDay >= getdate())
	begin

	Insert INTO Conferences (Name, StudentDiscount, StartDay, EndDay, PricePerDay, PersonsLimit, Description)
	values (@ConferenceName, @StudentDiscount, @StartDay, @EndDay, @PricePerDay, @PersonsLimit, @Description)
	
	
	
		DECLARE @cnt INT = 0;
		DECLARE @len INT = datediff(DAY,  @StartDay, @EndDay)+1 ;
		DECLARE @id int = SCOPE_IDENTITY();
		WHILE (@cnt < @len)
		BEGIN
			print @cnt;
			print @len;
			insert into ConferenceDay (ConferenceID, DayNo)
			values (@id, @cnt +1)
			SET @cnt = @cnt + 1;
		END
	end
	else print 'error'
	
END

GO
