function [stockMod] = simStock_GeneralMills01(...
						stockStruct,...
						currentDay)

	% This function pulls actual
	% stock price history data for
	% GIS (General Mills) from
	% Yahoo! Finance via the
	% SQQ script.  It reads the data
	% from a CSV file that has been
	% created beforehand.

	% The only that is changed in this
	% function is the closing price.

	% All values in the stock data struct
	% that are not changed will be set
	% to "-1" in their corresponding
	% matrices, denoting an empty value.

	% Pull current day price from
	% external CSV file for GIS.
	dataAll = csvread('./Historical_Stock_Data/GIS.csv');
	% Only need close price data.
	dataClose = dataAll(:,4);

	% Calculate new price.
	if((currentDay(3) <= length(dataClose))...
		&& (currentDay(3) >= 1))
		newPrice = dataClose(currentDay(3));
	else
		% dataClose array is out
		% of bounds.  There is no
		% more historical stock
		% data to feed in.
		newPrice = 0;
	end

	% Update the stock data.
	newDataIndex = (length(stockStruct.year) + 1);
	stockStruct.currentPrice = newPrice;
	stockStruct.high(newDataIndex) = -1;
	stockStruct.low(newDataIndex) = -1;
	stockStruct.close(newDataIndex) = newPrice;
	stockStruct.volume(newDataIndex) = -1;

	% Return updated stock struct.
	stockMod = stockStruct;

	return;

end