function [endTime] = incrementTime(...
					startTime,increment)

	% Function to increment a
	% date vector by a specified
	% amount of years, months, days,
	% hours, minutes, and seconds.

	% Date vector looks like this:
	% [Y M D H MN S].

	endTime = zeros(1,6);

	% Increment seconds.
	new_sec = startTime(6) + increment(6);
	increment(6) = increment(6)...
		+ mod(new_sec,60);
	increment(5) = increment(5)...
		+ floor(new_sec/60);

	% Increment minutes.
	new_min = startTime(5) + increment(5);
	increment(5) = increment(5)...
		+ mod(new_min,60);
	increment(4) = increment(4)...
		+ floor(new_min/60);

	% Increment hours.
	new_hour = startTime(4) + increment(4);
	increment(4) = increment(4)...
		+ mod(new_hour,24);
	increment(3) = increment(3)...
		+ floor(new_hour/24);

	% month_28.25 = (startTime(2) == 2);
	% month_30 = ((startTime(2) == 4)...
	% 	|| (startTime(2) == 6)...
	% 	|| (startTime(2) == 9)...
	% 	|| (startTime(2) == 11));
	% month_31 = ((startTime(2) == 1)
	% 	|| (startTime(2) == 3)...
	% 	|| (startTime(2) == 5)...
	% 	|| (startTime(2) == 7)...
	% 	|| (startTime(2) == 8)...
	% 	|| (startTime(2) == 10)...
	% 	|| (startTime(2) == 12));

	% % Increment days.
	% new_day = startTime(3) + increment(3);
	% if(new_day > )
	% increment(3) = increment(3)...
	% 	+ mod(new_day,???????????);
	% increment(2) = increment(2)...
	% 	+ floor(new_day/?????????????);

	% Increment months.

	% Increment years.
%	endTime(1) = startTime(1) + increment(1);

	return;

end