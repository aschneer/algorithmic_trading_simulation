function [emptyPortfolio] = createEmptyPortfolio(name)

    % Definition of structure "portfolio".
    
    % The time here is of the last day
    % of trading of any stock
    % in the portfolio.  Each one is
    % a single value, not a matrix.
    
    % Matrix of the value of the portfolio
    % at the time of closing each day
    % recorded in the list.
    
    % This will be a matrix containing
    % a table of transaction information
    % (stock, numShares, date, time,
    % buy/sell, price, etc).  Each row
    % will be a transaction.  This matrix
    % will be easily exported to a CSV
    % file later.
    
    % The "stocks" matrix has the symbols
    % of all the stocks in the portfolio.
    
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
    
    emptyPortfolio = struct(...
    	'name',					'',...
    	'lastTradeDay_year',	0,...
    	'lastTradeDay_month',	0,...
    	'lastTradeDay_day',		0,...
    	'stockSymbols',			{{}},...
    	'stockShares',			[],...
    	'totalInvestment',		0,...
    	'totalRevenue',			0,...
    	'totalValue',			0,...
    	'transactions',			{{}});

    emptyPortfolio.name = name;

	return;

end

