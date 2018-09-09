%input = 'unitTests/ilpTest10'
input = 'assignmentTests/part5.dict';

[basic, non_basic, b, a, c, z] = readInput(input);

[basic, non_basic, b, a, c, z,result_ok] = simplex(basic,non_basic,b,a,c,z);

if (result_ok == 1)
	fprintf("\nunbounded\n");
	return;
elseif (result_ok == 2)	
	fprintf("\ninfeasible\n");	
	return;
end

while(result_ok == 0 && 1>0)
	[basic, non_basic, b, a, c, z,num] = add_cutting_plane(basic,non_basic,b,a,c,z);
	if (num == 0)
		break;
	end
	[basic,non_basic,b,a,c,z,result_ok] = solve_by_simplex_dual(basic,non_basic,b,a,c,z,result_ok);

end
if(result_ok == 0)
	z
else
	fprintf("\ninfeasible\n");
end
