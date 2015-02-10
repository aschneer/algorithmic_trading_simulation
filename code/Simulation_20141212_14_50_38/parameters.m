%% Parameters:

% SET PARAMETERS FOR THE
% SIMULATION HERE.  THEN,
% RUN "main.m".  MAKE SURE
% ALL CODE FILES ARE IN THE
% SAME FOLDER AND THAT
% FOLDER IS OPEN IN FREEMAT/
% MATLAB.


% NOTE:  TO CHANGE THE
% STRATEGY USED FOR CALCULATING
% THE STOCK PRICE BEHAVIORS,
% SEE THE "updateExchange()"
% FUNCTION.


			% % This is the amount of
			% % revenue that would be
			% % earned from selling
			% % the given stock at the
			% % new price relative to
			% % its price the day before.
			% THRESHOLD_SELL = 15;
			% % This represents the amount
			% % of money that would be
			% % saved by buying the stock
			% % at the current price
			% % relative to the price
			% % the day before.
			% THRESHOLD_BUY = 15;



SIMULATION_DAYS = 8;
% This is the commission
% charged by the broker
% per trade in USD/trade.
TRADE_COMMISSION = 0;
% This is the minimum
% required profit (gain
% minus commission) required
% to justify a sell, in $.
MIN_TRANS_PROFIT = 5;
% Averaging window for
% function that determines
% the average of the stock
% price, in # days.
STOCK_AVG_WINDOW = 100;
% Account starting balance
% in $.
ACCOUNT_BALANCE_INIT = 10000;
% How much of account should
% be spent on initial stock
% purchase.
INITIAL_PURCHASE_AMOUNT =...
	(ACCOUNT_BALANCE_INIT / 2);
% Stock name to purchase
% and simulate.
NAME_TO_SIMULATE = 'General_Mills';
% Stock symbol to purchase
% and simulate.
SYMBOL_TO_SIMULATE = 'GIS';
% Exchange of stock being
% simulated.
EXCHANGE_TO_SIMULATE = 'NYSE';