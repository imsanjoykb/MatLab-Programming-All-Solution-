function [basic, non_basic, b, a, c, z] = readInput(file)
	fin = fopen(file,'r');
	
	ln = fgetl(fin);
	[m, n] = strread(ln);
	
	ln = fgetl(fin);
	basic = strread(ln)';

	ln = fgetl(fin);
	non_basic = strread(ln)';
	
	ln = fgetl(fin);
	b = strread(ln);

	a = zeros(m,n);
	for i = 1:m
		ln = fgetl(fin);
		a(i,:) = strread(ln)';
	end
	
	ln = fgetl(fin);
	v = strread(ln)';
	z = v(1);
	c = v(2:end);
	
	fclose(fin);
	
end