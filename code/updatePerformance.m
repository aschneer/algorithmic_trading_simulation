function [performanceMod] = updatePerformance(...
							performance,...
							portfolio,...
							dateStamp)

	% This function will update the
	% performance struct with the
	% data from the given portfolio
	% on the given date.

	% Determine the next element
	% for data.
	nextIndex = (length(performance.year) + 1);
	% Update data.
	performance.year(nextIndex) = dateStamp(1);
	performance.month(nextIndex) = dateStamp(2);
	performance.day(nextIndex) = dateStamp(3);
	performance.totalInvestment(nextIndex) =...
		portfolio.totalInvestment;
	performance.totalRevenue(nextIndex) =...
		portfolio.totalRevenue;
	performance.totalValue(nextIndex) =...
		portfolio.totalValue;

	% Make sure to return the updated
	% performance struct so the data
	% is not lost.
	performanceMod = performance;

	return;

end