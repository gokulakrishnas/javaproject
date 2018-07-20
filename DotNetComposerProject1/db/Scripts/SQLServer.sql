/****** Object:  Table [dbo].[companies]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[company_name] [nvarchar](50) NOT NULL,
	[company_stock_symbol] [nchar](10) NOT NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[stock_price]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_price](
	[stock_symbol] [nchar](10) NULL,
	[quote_datetime] [datetime] NULL,
	[quote_value] [decimal](18, 2) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[stock_purchase_order]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_purchase_order](
	[stock_symbol] [nchar](10) NOT NULL,
	[quantity] [decimal](18, 0) NOT NULL,
	[order_datetime] [datetime] NOT NULL,
	[quote_value] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO

/*** populate companies table ***/
INSERT INTO [dbo].[companies]([company_name],[company_stock_symbol]) VALUES ('CORP1','CRP1')
GO
INSERT INTO [dbo].[companies]([company_name],[company_stock_symbol]) VALUES ('CORP2','CRP2')
GO
INSERT INTO [dbo].[companies]([company_name],[company_stock_symbol]) VALUES ('CORP3','CRP3')
GO
INSERT INTO [dbo].[companies]([company_name],[company_stock_symbol]) VALUES ('CORP4','CRP4')
GO
INSERT INTO [dbo].[companies]([company_name],[company_stock_symbol]) VALUES ('CORP5','CRP5')
GO

/*** populate stock_price table ***/
INSERT INTO [dbo].[stock_price] ([stock_symbol] ,[quote_datetime], [quote_value]) VALUES ('CRP1', '1/1/2009 12:00:00 AM',19.44)
GO
INSERT INTO [dbo].[stock_price] ([stock_symbol] ,[quote_datetime], [quote_value]) VALUES ('CRP2', '1/1/2009 12:00:00 AM',17.33)
GO
INSERT INTO [dbo].[stock_price] ([stock_symbol] ,[quote_datetime], [quote_value]) VALUES ('CRP3', '1/1/2009 12:00:00 AM',307.65)
GO
INSERT INTO [dbo].[stock_price] ([stock_symbol] ,[quote_datetime], [quote_value]) VALUES ('CRP4', '1/1/2009 12:00:00 AM',12.20)
GO
INSERT INTO [dbo].[stock_price] ([stock_symbol] ,[quote_datetime], [quote_value]) VALUES ('CRP5', '1/1/2009 12:00:00 AM',3.82)
GO


/****** Object:  StoredProcedure [dbo].[place_order] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*** stored procedure to place a purchase order ***/
CREATE PROCEDURE [dbo].[place_order]
	@stock_symbol nchar(10),
	@quantity decimal(18,0),
	@quote_value decimal(18, 2)
AS

INSERT INTO [dbo].[stock_purchase_order] ([stock_symbol] ,[quantity], [order_datetime], [quote_value]) VALUES (@stock_symbol, @quantity, GetDate(), @quote_value);

