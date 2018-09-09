function [basic,non_basic,b,a,c,z,result_ok] = solve_by_simplex_dual(basic,non_basic,b,a,c,z,result_ok)

	b1 = -c';
	a1 = -a';
	c1 = -b';
	z1 = -z;
	basic1 = non_basic;
	non_basic1 = basic;
	
	[basic1,non_basic1,b1,a1,c1,z1,result_ok] = simplex_phase2(basic1,non_basic1,b1,a1,c1,z1);	
	b = -c1';
	a = -a1';
	c = -b1';
	z = -z1;

end
