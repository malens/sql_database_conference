USE [wilkosz_a]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[ConferenceID] [int] NOT NULL,
	[DiscountDate] [date] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[ConferenceID] ASC,
	[DiscountDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Conferences] FOREIGN KEY([ConferenceID])
REFERENCES [dbo].[Conferences] ([ConferenceID])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Conferences]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [CK_Discounts]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts_1] CHECK  (([dbo].[timeContinuumDiscounts]([ConferenceID])=(0)))
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [CK_Discounts_1]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [CK_Discounts_2] CHECK  (([dbo].[timeContinuumDiscountsConferences]([ConferenceID])=(0)))
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [CK_Discounts_2]
GO
