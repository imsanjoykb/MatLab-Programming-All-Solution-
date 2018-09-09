function [basic,non_basic,b,a,c,z,result_ok] = simplex_phase2(basic,non_basic,b,a,c,z)
	result_ok = 0;%feasible solution
	count = 0;
	while 1 > 0

		[entering_id, entering_value, leaving_id, leaving_value] = find_entering_leaving(b, a, c, basic, non_basic);
		
		%fprintf("count %d, objective %f, entering_value %d, leaving_value %d  \n",count, z,entering_value, leaving_value)
		
		if (entering_id == -1)
			result_ok = 0;
			break;
		end

		if (leaving_id == -1)			
			result_ok = 1; %UNBOUNDED
			break;
		end
		
		[basic, non_basic, b, a, c, z] = rearrange(basic, non_basic, b, a, c, z, entering_id, leaving_id);
		
		count++;
		
	end

end


