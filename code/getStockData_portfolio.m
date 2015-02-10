function [flag,portfolioStockData] = getStockData_portfolio(...
							portfolio,symbol)
	% This function will search the
	% given portfolio for the
	% desired stock.  If it is found,
	% the stock info is returned
	% and the flag is "1".
	% If not, then "0" is returned
	% as the flag and the stockInfo
	% variables are returned as
	% either zero or empty.
	% The data that is returned
	% for the stock (if it is found
	% in the portfolio) is:
	%	1.	Name of stock
	%	2.	Symbol of stock
	%	3.	Last trade year, month,
	%		and day for the stock
	%	4.	Number of shares of that
	%		stock currently in the
	%		portfolio
	%	5.	List of all transactions
	%		for that stock to date
	% The data will be in the form of
	% a "portfolioStockData" struct.

	% Create an empty portfolioStockData
	% struct.
	portfolioStockData = createEmptyPortfolioStockData();
	% Search the portfolio for the
	% desired stock.
	for i = (1:length(portfolio.stockSymbols))
		if(strcmp(portfolio.stockSymbols(i),symbol))
			% If stock is found, save
			% all the necessary data to the
			% struct to be returned.
			portfolioStockData.symbol = portfolio.stockSymbols(i);
			portfolioStockData.numShares = portfolio.stockShares(i);
			% Search through the transactions list
			% for all transactions involving the
			% desired stock.  Copy them into the
			% list to be returned.
			k = 1;
			for j = (1:size(portfolio.transactions,1))
				if(strcmp(portfolio.transactions{j,8},symbol))
					portfolioStockData.transactions(k,:) =...
						portfolio.transactions(j,:);
					k = k + 1;
				end
			end
			% Return success.  All data is
			% ready to be returned.
			flag = 1;
			return;
		end
	end
	% If desired stock is not found,
	% return 0.
	portfolioStockData = createEmptyPorftolioStockData();
	flag = 0;
	return;
end