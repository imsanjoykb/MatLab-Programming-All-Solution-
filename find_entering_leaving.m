function [entering_id,entering_value, leaving_id,leaving_value] = find_entering_leaving(b, a, c, basic, non_basic)
	
	entering_value = length(basic) + length(non_basic) + 1;
	entering_id = -1;
	for i = 1:length(c)
		%find a positive coefficient and pick the one with smallest index (to make sure simplex converges)
		if c(i) > 0 && entering_value > non_basic(i)
			entering_id = i;
			entering_value = non_basic(i);
		end
	end
	
	
	if (entering_id == -1)
		entering_id = -1;
		leaving_id = -1;
		entering_value = -1;
		leaving_value = -1;
		return;
	end
	
	%divide b by the column of entering, then select negative elements, pick the index of the max		
	max = intmin;
	leaving_value = length(basic) + length(non_basic) + 1;
	leaving_id = -1;
	size_b = size(b)(1);
	for i = 1:size_b
		num = b(i) / a(i,entering_id);
		%check if this position gives a lower bound
		if (a(i,entering_id) < 0 && num <= 0 && max <= num)			
			if (max < b(i) / a(i,entering_id) || leaving_value > basic(i))			
				max = b(i) / a(i,entering_id);
				leaving_id = i;
				leaving_value = basic(i);
			end			
		end
	end	
		
end
