function [totalInvestment,...
			totalRevenue,...
			totalValue,...
			portfolioMod]...
			= calcInvestment(...
				portfolio,...
				exchange)

	% This function will search
	% through the transaction
	% history of the specified
	% portfolio and add up all the
	% buy and sell values to determine
	% the total amount of money that
	% has been invested and the total
	% that has been returned from sales.
	% This will also calculate the total
	% value of the portfolio at the present
	% time.

	totalInvestment = 0;
	totalRevenue = 0;
	totalValue = 0;

	% Calculate total investment and
	% total revenue.
    for i = (1:size(portfolio.transactions,1))
        if(strcmp(portfolio.transactions(i,1),'BUY'))
        	totalInvestment = totalInvestment...
				+ portfolio.transactions{i,11};
        elseif(strcmp(portfolio.transactions(i,1),'SELL'))
        	totalRevenue = totalRevenue...
				+ portfolio.transactions{i,11};
        else
        	% Error.
        end
    end

	% Calculate the total value of the
	% portfolio.

	% Loop through all the stock symbols in
	% the portfolio.
    for i = (1:length(portfolio.stockSymbols))
		% Search exchange for corresponding symbol.
		[flag,currentStock] = getStockData_exchange(...
			exchange,portfolio.stockSymbols(i));
		if(flag == 0)
			% Error.  Stock not found in exchange.
			totalInvestment = -1;
			totalRevenue = -1;
			totalValue = -1;
			return;
		else
			totalValue = totalValue...
				+ (currentStock.currentPrice...
				* portfolio.stockShares(i));
		end
    end

    % Save information to the portfolio.
	portfolio.totalInvestment = totalInvestment;
	portfolio.totalRevenue = totalRevenue;
	portfolio.totalValue = totalValue;

	% Make sure to return the
	% updated portfolio struct.
	portfolioMod = portfolio;

	return;

end