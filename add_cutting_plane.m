function [basic, non_basic, b, a, c, z, num] = add_cutting_plane(basic,non_basic,b,a,c,z)
	%number of rows would be added	
	num = 0;
	zero = 1e-6;
	
	n = length(basic);	
	m = length(non_basic);	
	
	for i = 1:n
		if (b(i) - floor(b(i)) > zero && ceil(b(i)) - b(i) > zero)
			num++;
			row = -a(i,:) - floor(-a(i,:));			
			a = [a;row];
			b = [b;floor(b(i)) - b(i)];
			basic = [basic, n + m + num];						
		end
	end

end