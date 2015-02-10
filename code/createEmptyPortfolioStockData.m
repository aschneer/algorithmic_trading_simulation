function [emptyPortfolioStockData] = createEmptyPortfolioStockData()

	% Definition of structure "portfolioStockData".
	
	% The time here is of the last day
	% of trading of the particular
	% stock.
	
	% Matrix of the value of the portfolio
	% at the time of closing each day
	% recorded in the list.
	
	% There will be a matrix containing
	% a table of transaction information
	% (stock, numShares, date, time,
	% buy/sell, price, etc).  Each row
	% will be a transaction.  This matrix
	% will be easily exported to a CSV
	% file later.
	
	% The "transactions" matrix has a table
	% of all the data for each transaction.
	% The columns, from left to right, are:
		% 01	transaction ('BUY' or 'SELL')
		% 02	year
		% 03	month
		% 04	day
		% 05	hour
		% 06	minute
		% 07	second
		% 08	stock symbol
		% 09	price
		% 10	number of shares
		% 11	total
	
	emptyPortfolioStockData = struct(...
		'symbol',				'',...
		'numShares',			0,...
		'transactions',			{{}});

	return;

end

