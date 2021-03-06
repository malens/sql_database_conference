USE [wilkosz_a]
GO
/****** Object:  Table [dbo].[ReservationWorkshopDay]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationWorkshopDay](
	[ReservationID] [int] NOT NULL,
	[WorkshopID] [int] NOT NULL,
	[ConferenceID] [int] NOT NULL,
	[DayNo] [int] NOT NULL,
	[ReservedNo] [int] NOT NULL,
 CONSTRAINT [PK_ReservationWorkshopDay] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC,
	[WorkshopID] ASC,
	[ConferenceID] ASC,
	[DayNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ReservationWorkshopDay]  WITH CHECK ADD  CONSTRAINT [FK_ReservationWorkshopDay_ReservationConferenceDay] FOREIGN KEY([ReservationID], [ConferenceID], [DayNo])
REFERENCES [dbo].[ReservationConferenceDay] ([ReservationID], [ConferenceID], [DayNo])
GO
ALTER TABLE [dbo].[ReservationWorkshopDay] CHECK CONSTRAINT [FK_ReservationWorkshopDay_ReservationConferenceDay]
GO
ALTER TABLE [dbo].[ReservationWorkshopDay]  WITH CHECK ADD  CONSTRAINT [FK_ReservationWorkshopDay_WorkshopDay] FOREIGN KEY([WorkshopID], [ConferenceID], [DayNo])
REFERENCES [dbo].[WorkshopDay] ([WorkshopID], [ConferenceID], [DayNo])
GO
ALTER TABLE [dbo].[ReservationWorkshopDay] CHECK CONSTRAINT [FK_ReservationWorkshopDay_WorkshopDay]
GO
ALTER TABLE [dbo].[ReservationWorkshopDay]  WITH CHECK ADD  CONSTRAINT [CK_ReservationWorkshopDay] CHECK  (([dbo].[getFreePlaceInWorkshopDay]([ConferenceID],[DayNo],[WorkshopID])>=(0)))
GO
ALTER TABLE [dbo].[ReservationWorkshopDay] CHECK CONSTRAINT [CK_ReservationWorkshopDay]
GO
