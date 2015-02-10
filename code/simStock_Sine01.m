function [stockMod] = simStock_Sine01(...
						stockStruct,...
						currentDay)

	% This function will simulate the
	% behavior of a stock price as
	% a perfect sinewave.  It will
	% calculate the next value by
	% pulling it from a pre-set
	% array of values based on the
	% current day.  A separate
	% function will generate the array
	% of values for as many days as
	% are required.

	% The only that is changed in this
	% function is the closing price.

	% All values in the stock data struct
	% that are not changed will be set
	% to "-1" in their corresponding
	% matrices, denoting an empty value.

	% Set parameters by which to determine
	% the new stock price.

	% Amplitude ($).
	A = (0.10*stockStruct.close(1));
	% Period (days).
	T = 14;
	% Zero offset ($).
	% This will also be
	% the initial value.
	k = stockStruct.close(1);

	% Calculate the new price.
	secPerDay = 24*60*60;
	newPrice = (A*sin(2*pi*(1/(T*secPerDay))...
		*(currentDay(3)*secPerDay)) + k);

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