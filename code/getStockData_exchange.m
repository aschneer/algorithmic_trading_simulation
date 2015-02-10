function [flag,stockStruct] = getStockData_exchange(...
							exchange,symbol)
	% This function will search the
	% given exchange matrix for the
	% desired stock.  If it is found,
	% the stock struct is returned
	% and the flag is "1".
	% If not, then "0" is returned
	% as the flag and the "stockStruct"
	% is returned empty.

	for i = (1:length(exchange))
		if(strcmp(exchange(i).symbol,symbol))
			stockStruct = exchange(i);
			flag = 1;
			return;
		end
	end
	% If desired stock is not found,
	% return 0.
	stockStruct = createEmptyStock();
	flag = 0;
	return;
end