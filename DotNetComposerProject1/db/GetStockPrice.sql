SELECT  'Latest stock price for ' + {DBInputGetCompany} + ' is dollars ' + CAST(dbo.stock_price.quote_value AS VARCHAR(6)) 
 FROM 
 dbo.stock_price, dbo.companies
 WHERE 
dbo.companies.company_name = {DBInputGetCompany} AND dbo.companies.company_stock_symbol = dbo.stock_price.stock_symbol
