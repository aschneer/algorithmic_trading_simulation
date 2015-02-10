function [] = exportData(...
			exchange,...
			portfolio,...
			performance,...
			account,...
			timeStamp)
	% Export all data from the
	% simulation to files that can
	% be analyzed in Excel.
	% The data will be written
	% to text files, but separated
	% by commas to satisfy the CSV
	% format.

	% Simulation output data - folder name:
	timeStampString = sprintf('%04d%02d%02d_%02d_%02d_%02.0f',...
	    timeStamp(1),timeStamp(2),timeStamp(3),...
	    timeStamp(4),timeStamp(5),timeStamp(6));
	% Concatenate strings to make folder name.
	outputFolderName = ['./Simulation_' timeStampString];

	% Create folder for output data.
	mkdir(outputFolderName);

	% Write portfolio performance data
	% to a CSV file.
	% Prepare file.
	temp = sprintf('/%s.csv',performance.name);
	fileName_performance = [outputFolderName temp];
	fileID_performance = fopen(fileName_performance,'w');
	% Write data.
	fprintf(fileID_performance,'Performance Struct Name:,');
	fprintf(fileID_performance,performance.name);
	fprintf(fileID_performance,'\n');
	fprintf(fileID_performance,'Portfolio Tracked:,');
	fprintf(fileID_performance,performance.portfolioTracked);
	fprintf(fileID_performance,'\n\n');
	fprintf(fileID_performance,'Year,');
	fprintf(fileID_performance,'Month,');
	fprintf(fileID_performance,'Day,');
	fprintf(fileID_performance,'Total Investment,');
	fprintf(fileID_performance,'Total Revenue,');
	fprintf(fileID_performance,'Total Value,');
	fprintf(fileID_performance,'\n');
	for i = (1:length(performance.year))
		fprintf(fileID_performance,'%d,',performance.year(i));
		fprintf(fileID_performance,'%d,',performance.month(i));
		fprintf(fileID_performance,'%d,',performance.day(i));
		fprintf(fileID_performance,'%0.2f,',performance.totalInvestment(i));
		fprintf(fileID_performance,'%0.2f,',performance.totalRevenue(i));
		fprintf(fileID_performance,'%0.2f',performance.totalValue(i));
		fprintf(fileID_performance,'\n');
	end
	% Close file.
	fclose(fileID_performance);

	% Write investment account data
	% to a CSV file.
	% Prepare file.
	temp = sprintf('/%s.csv',account.name);
	fileName_account = [outputFolderName temp];
	fileID_account = fopen(fileName_account,'w');
	% Write data.
	fprintf(fileID_account,'Account Name:,');
	fprintf(fileID_account,account.name);
	fprintf(fileID_account,'\n\n');
	fprintf(fileID_account,'Year,');
	fprintf(fileID_account,'Month,');
	fprintf(fileID_account,'Day,');
	fprintf(fileID_account,'Balance,');
	fprintf(fileID_account,'\n');
	for i = (1:length(account.year))
		fprintf(fileID_account,'%d,',account.year(i));
		fprintf(fileID_account,'%d,',account.month(i));
		fprintf(fileID_account,'%d,',account.day(i));
		fprintf(fileID_account,'%0.2f',account.balance(i));
		fprintf(fileID_account,'\n');
	end
	% Close file.
	fclose(fileID_account);

	% Write transaction table to a file.
	% Prepare file.
	fileName_transactions = [outputFolderName '/transactions.csv'];
	fileID_transactions = fopen(fileName_transactions,'w');
	% Write data.
	fprintf(fileID_transactions,'Transaction,');
	fprintf(fileID_transactions,'Year,');
	fprintf(fileID_transactions,'Month,');
	fprintf(fileID_transactions,'Day,');
	fprintf(fileID_transactions,'Hour,');
	fprintf(fileID_transactions,'Minute,');
	fprintf(fileID_transactions,'Second,');
	fprintf(fileID_transactions,'Symbol,');
	fprintf(fileID_transactions,'Price,');
	fprintf(fileID_transactions,'Shares,');
	fprintf(fileID_transactions,'Total');
	fprintf(fileID_transactions,'\n');
	for i = (1:size(portfolio.transactions,1))
		fprintf(fileID_transactions,'%s,',portfolio.transactions{i,1});
		fprintf(fileID_transactions,'%d,',portfolio.transactions{i,2});
		fprintf(fileID_transactions,'%d,',portfolio.transactions{i,3});
		fprintf(fileID_transactions,'%d,',portfolio.transactions{i,4});
		fprintf(fileID_transactions,'%d,',portfolio.transactions{i,5});
		fprintf(fileID_transactions,'%d,',portfolio.transactions{i,6});
		fprintf(fileID_transactions,'%0.3f,',portfolio.transactions{i,7});
		fprintf(fileID_transactions,'%s,',portfolio.transactions{i,8});
		fprintf(fileID_transactions,'%0.2f,',portfolio.transactions{i,9});
		fprintf(fileID_transactions,'%d,',portfolio.transactions{i,10});
		fprintf(fileID_transactions,'%0.2f',portfolio.transactions{i,11});
		fprintf(fileID_transactions,'\n');
	end
	% Close file.
	fclose(fileID_transactions);

	% Write stock exchange data to a file.
	% Prepare folder.
	stockExchangeDataFolder = [outputFolderName '/Stock_Exchange'];
	mkdir(stockExchangeDataFolder);
	% Create a data file for each stock
	% in the exchange.
	for i = (1:length(exchange))
		% Prepare current data file.
		currentStockDataFile = sprintf('/%s.csv',exchange(i).symbol);
		fileName_currentStock =...
			[stockExchangeDataFolder currentStockDataFile];
		fileID_currentStock = fopen(fileName_currentStock,'w');
		% Write data.
		fprintf(fileID_currentStock,'Name,');
		fprintf(fileID_currentStock,'%s\n',exchange(i).name);
		fprintf(fileID_currentStock,'Symbol,');
		fprintf(fileID_currentStock,'%s\n',exchange(i).symbol);
		fprintf(fileID_currentStock,'Exchange,');
		fprintf(fileID_currentStock,'%s\n',exchange(i).exchange);
		fprintf(fileID_currentStock,'Current Price,');
		fprintf(fileID_currentStock,'%0.2f\n',exchange(i).currentPrice);
		fprintf(fileID_currentStock,'\n');
		fprintf(fileID_currentStock,'Stock Activity');
		fprintf(fileID_currentStock,'\n\n');
		fprintf(fileID_currentStock,'Year,');
		fprintf(fileID_currentStock,'Month,');
		fprintf(fileID_currentStock,'Day,');
		fprintf(fileID_currentStock,'High,');
		fprintf(fileID_currentStock,'Low,');
		fprintf(fileID_currentStock,'Close,');
		fprintf(fileID_currentStock,'Volume');
		fprintf(fileID_currentStock,'\n');
		for j = (1:length(exchange(i).year))
			fprintf(fileID_currentStock,'%d,',exchange(i).year(j));
			fprintf(fileID_currentStock,'%d,',exchange(i).month(j));
			fprintf(fileID_currentStock,'%d,',exchange(i).day(j));
			fprintf(fileID_currentStock,'%0.2f,',exchange(i).high(j));
			fprintf(fileID_currentStock,'%0.2f,',exchange(i).low(j));
			fprintf(fileID_currentStock,'%0.2f,',exchange(i).close(j));
			fprintf(fileID_currentStock,'%d',exchange(i).volume(j));
			fprintf(fileID_currentStock,'\n');
		end
		% Close current file.
		fclose(fileID_currentStock);
	end

	% Copy the parameters file
	% into the results folder
	% so we know which parameters
	% were used to produce that
	% data.
	copyfile('./parameters.m',outputFolderName);

	return;

end