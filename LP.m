%input = 'unitTests/10/test1'
input = 'part1';

[basic, non_basic, b, a, c, z] = readInput(strcat(input,'.dict'));

result_ok = true;
result = "";
if (sum(b<0) > 0)
	[basic, non_basic, b, a, c, z,result_ok] = initialization(basic,non_basic,b,a,c,z);
	
	if (result_ok && sum(b<0) > 0)
		result_ok = false
		result = "UNBOUNDED";
	else
		result = "INFEASIBLE";
	end
end
if (result_ok)
	[basic, non_basic, b, a, c, z, result_ok] = simplex_phase2(basic, non_basic, b, a, c, z);
	%no need to check for infeasibility because the dual would be unbounded in initialization phase
	if (result_ok)
		fprintf("\n\n max value:%f\n\n", z);
	else
		fprintf("\n\nUNBOUNDED\n\n");
	end
else
	fprintf('\n\n%s\n\n',result);
end
