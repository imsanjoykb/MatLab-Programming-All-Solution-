function [basic,non_basic,b,a,c,z,result_ok] = simplex(basic,non_basic,b,a,c,z)
	zero = 1e-10;
	result_ok = 0;
	%check if initialization is needed
	if (sum(b<0) > 0)
		[basic, non_basic, b, a, c, z,result_ok] = initialization(basic,non_basic,b,a,c,z);
		
		if (result_ok == 1)
			result_ok = 2; %infeasible
		end
	end
	%if no initialization is needed or initialization is successful
	if (result_ok == 0)
		[basic, non_basic, b, a, c, z, result_ok] = simplex_phase2(basic, non_basic, b, a, c, z);
		
	end

end
