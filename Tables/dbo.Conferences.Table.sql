USE [wilkosz_a]
GO
/****** Object:  Table [dbo].[Conferences]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conferences](
	[ConferenceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[StudentDiscount] [real] NULL,
	[StartDay] [date] NOT NULL,
	[EndDay] [date] NOT NULL,
	[PricePerDay] [money] NOT NULL,
	[PersonsLimit] [int] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Conferences] PRIMARY KEY CLUSTERED 
(
	[ConferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Conferences]  WITH CHECK ADD  CONSTRAINT [PersonsLimit] CHECK  (([PersonsLimit]>(0)))
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [PersonsLimit]
GO
ALTER TABLE [dbo].[Conferences]  WITH CHECK ADD  CONSTRAINT [Price] CHECK  (([PricePerDay]>=(0)))
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [Price]
GO
ALTER TABLE [dbo].[Conferences]  WITH CHECK ADD  CONSTRAINT [StudentDiscount] CHECK  (([StudentDiscount]>=(0) AND [StudentDiscount]<=(1)))
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [StudentDiscount]
GO
ALTER TABLE [dbo].[Conferences]  WITH CHECK ADD  CONSTRAINT [TimeContinuity] CHECK  (([StartDay]<=[EndDay]))
GO
ALTER TABLE [dbo].[Conferences] CHECK CONSTRAINT [TimeContinuity]
GO
