SELECT  "dbo"."stock_price"."quote_value", "dbo"."companies"."company_name", "dbo"."stock_price"."stock_symbol", "dbo"."stock_price"."quote_datetime"
 FROM 
 "dbo"."stock_price", "dbo"."companies"
 WHERE 
"dbo"."companies"."company_stock_symbol" = dbo.stock_price.stock_symbol