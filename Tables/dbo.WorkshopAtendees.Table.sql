USE [wilkosz_a]
GO
/****** Object:  Table [dbo].[WorkshopAtendees]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkshopAtendees](
	[WorkshopID] [int] NOT NULL,
	[DayNo] [int] NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_WorkshopAtendees_1] PRIMARY KEY CLUSTERED 
(
	[WorkshopID] ASC,
	[DayNo] ASC,
	[ConferenceID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[WorkshopAtendees]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopAtendees_DayAtendees] FOREIGN KEY([ConferenceID], [DayNo], [PersonID])
REFERENCES [dbo].[DayAtendees] ([ConferenceID], [DayNo], [PersonID])
GO
ALTER TABLE [dbo].[WorkshopAtendees] CHECK CONSTRAINT [FK_WorkshopAtendees_DayAtendees]
GO
ALTER TABLE [dbo].[WorkshopAtendees]  WITH CHECK ADD  CONSTRAINT [FK_WorkshopAtendees_WorkshopDay] FOREIGN KEY([WorkshopID], [ConferenceID], [DayNo])
REFERENCES [dbo].[WorkshopDay] ([WorkshopID], [ConferenceID], [DayNo])
GO
ALTER TABLE [dbo].[WorkshopAtendees] CHECK CONSTRAINT [FK_WorkshopAtendees_WorkshopDay]
GO
ALTER TABLE [dbo].[WorkshopAtendees]  WITH CHECK ADD  CONSTRAINT [chkOverlap] CHECK  (([dbo].[Overlaps]()=(0)))
GO
ALTER TABLE [dbo].[WorkshopAtendees] CHECK CONSTRAINT [chkOverlap]
GO
ALTER TABLE [dbo].[WorkshopAtendees]  WITH CHECK ADD  CONSTRAINT [CK_WorkshopAtendees] CHECK  (([dbo].[getReservedPlacesLeftWorkshop]([DayNo],[ConferenceID],[WorkshopID])>=(0)))
GO
ALTER TABLE [dbo].[WorkshopAtendees] CHECK CONSTRAINT [CK_WorkshopAtendees]
GO
