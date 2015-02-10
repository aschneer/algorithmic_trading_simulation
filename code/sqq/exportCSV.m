%% Write stock quote data to CSV file using SQQ script.

% (Run SQQ script to get the data).

symbol = 'AAPL';

filename = sprintf('../Historical_Stock_Data/%s.csv',symbol);
dateMod = datevec(date);
csvwrite(filename,[dateMod(:,1) dateMod(:,2) dateMod(:,3) closeadj]);