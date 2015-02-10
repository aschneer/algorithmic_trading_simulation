function [exchangeMatrix] = createExchange_03(...
								timeStamp)
	
	% Create theoretical stocks.
	
	% This will create a list of
	% theoretical stocks with information
	% about their behavior.
	
	% Create theoretical stocks and add data
	% to their structures.  Create a
	% "stockExchange" matrix to store a list
	% of all the stocks theoretically available
	% for purchase.  Each stock in the exchange
	% will have

	% For this version of the function,
	% pull initial data directly from
	% Yahoo! Finance historical data.

	stockSymbol = 'GIS';
	filename = sprintf('./Historical_Stock_Data/%s.csv',...
						stockSymbol);
	dataAll = csvread(filename);
	dataClose = dataAll(:,4);
	startPrice = dataClose(1);

	% Create exchange matrix.
	exchangeMatrix(1) = createStock(...
		'General_Mills',...
		'GIS',...
		'NYSE',...
		startPrice,...
		timeStamp(1),...
		timeStamp(2),...
		timeStamp(3),...
		-1,...
		-1,...
		startPrice,...
		-1);

	return;

end