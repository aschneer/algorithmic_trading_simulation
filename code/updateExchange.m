function [exchangeMod] = updateExchange(...
						exchange,...
						currentTime)
	% This function will update the
	% given stock exchange based on
	% simulated market activity.

	for i = (1:length(exchange))
		% Simulate price activity for
		% each stock.
		[newStockData] = simStock_GeneralMills01(...
			exchange(i),currentTime);
		% Update the market activity
		% of each stock in the exchange.
		nextEntry = (length(exchange(i).year) + 1);
		exchange(i).currentPrice = newStockData.currentPrice;
		exchange(i).year(nextEntry) = currentTime(1);
		exchange(i).month(nextEntry) = currentTime(2);
		exchange(i).day(nextEntry) = currentTime(3);
		exchange(i).high(nextEntry) = newStockData.high(end);
		exchange(i).low(nextEntry) = newStockData.low(end);
		exchange(i).close(nextEntry) = newStockData.close(end);
		exchange(i).volume(nextEntry) = newStockData.volume(end);
	end

	% Make sure to return the
	% modified excange so the
	% data is not lost.
	exchangeMod = exchange;

	return;

end