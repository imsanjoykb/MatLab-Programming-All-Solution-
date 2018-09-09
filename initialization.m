function [basic,non_basic,b,a,c,z,result_ok] = initialization(basic,non_basic,b,a,c,z)
	result_ok = 0;
	b1 = ones(size(c)(2),1);
	a1 = -a';
	c1 = -b';
	z1 = 0;
	basic1 = non_basic;
	non_basic1 = basic;

	[basic1,non_basic1,b1,a1,c1,z1,result_ok] = simplex_phase2(basic1,non_basic1,b1,a1,c1,z1);
	%if the dual is unbounded, the primal will be infeasible
	if (result_ok == 1)
		return;
	end

	b = -c1';
	a = -a1';
	
	%recalculate z and c
	tmp_c = zeros(1,size(basic1)(2));
	tmp_z = 0;
	size_non_basic = size(non_basic)(2);
	size_non_basic1 = size(non_basic1)(2);
	size_basic1 = size(basic1)(2);
	for i = 1:size_non_basic
		%if this variable is in basic, update entire c
		for j = 1:size_non_basic1
			if non_basic1(j) == non_basic(i)
				tmp_c = tmp_c .+ a(j,:) * c(i);
				tmp_z += b(j) * c(i);
				break;
			end
		end		
		%if this variable is already in non_basic, just update the corresponding coefficient
		for j = 1:size_basic1
			if basic1(j) == non_basic(i)
				tmp_c(j) = tmp_c(j) + c(i);				
				break;
			end
		end

	end
	
	c = tmp_c;
	z = tmp_z;
	
	basic = non_basic1;
	non_basic = basic1;
	
end