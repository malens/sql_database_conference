USE [wilkosz_a]
GO
/****** Object:  Table [dbo].[CompanyClients]    Script Date: 2017-05-25 12:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyClients](
	[ClientID] [int] NOT NULL,
	[CompanyName] [varchar](30) NOT NULL,
	[Address] [varchar](30) NULL,
	[RepresentantID] [int] NOT NULL,
 CONSTRAINT [PK_Company Clients] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CompanyClients]  WITH CHECK ADD  CONSTRAINT [FK_Company Clients_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[CompanyClients] CHECK CONSTRAINT [FK_Company Clients_Clients]
GO
ALTER TABLE [dbo].[CompanyClients]  WITH CHECK ADD  CONSTRAINT [FK_Company Clients_Persons] FOREIGN KEY([RepresentantID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[CompanyClients] CHECK CONSTRAINT [FK_Company Clients_Persons]
GO
