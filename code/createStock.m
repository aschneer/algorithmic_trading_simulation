function [stockStruct] = createStock(...
			    name,...
				symbol,...
				exchange,...
				currentPrice,...
				year,...
				month,...
	    		day,...
    			high,...
    			low,...
    			close,...
    			volume)

	% Function to "create a stock".

	% This is a theoretical stock.
	% The "creation" means that the
	% stock structure is filled with
	% initial data which defines it.

	% This returns a stock structure
	% with all the initial information
	% about that stock's current value
	% and last day of trading in it.

	% The date information refers to the
	% date when the last trading occurred
	% for the stock.  The price and trade
	% information is for that last day
	% of trading.

	% Create stock structure.
	stockStruct = createEmptyStock();

	% Modify stock structure and
	% add all the relevant information.
	stockStruct.name = name;
	stockStruct.symbol = symbol;
	stockStruct.exchange = exchange;
	stockStruct.currentPrice = currentPrice;
	stockStruct.year(1) = year;
	stockStruct.month(1) = month;
	stockStruct.day(1) = day;
	stockStruct.high(1) = high;
	stockStruct.low(1) = low;
	stockStruct.close(1) = close;
	stockStruct.volume(1) = volume;
	
	return;

end