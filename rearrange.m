function [basic, non_basic, b, a, c, z] = rearrange(basic, non_basic, b, a, c, z, entering_id, leaving_id)
	[m,n] = size(a);

	div = abs(a(leaving_id, entering_id));
	a(leaving_id,:) = a(leaving_id,:) ./ div;
	
	b(leaving_id) = b(leaving_id) ./ div;
	
	
	%coefficient for the new non_basic variable
	a(leaving_id,entering_id) = -1 ./ div;
	
	leaving_row = a(leaving_id,:);
	
	entering_col = a(:,entering_id);
	entering_col(leaving_id) = 0;
	
	a(:,entering_id) = 0;
	a(leaving_id,entering_id) = leaving_row(entering_id);
	
	%update matrix a after switching 2 variables
	a = a .+ entering_col * leaving_row;
		
	b = b .+ b(leaving_id) .* entering_col;	
	
	z = z + c(entering_id) .* b(leaving_id);
	
	col = c(entering_id);
	c(entering_id) = 0;
	c = c .+ col .* leaving_row;
	
	id = basic(leaving_id);
	basic(leaving_id) = non_basic(entering_id);
	non_basic(entering_id) = id;
	
	
end
