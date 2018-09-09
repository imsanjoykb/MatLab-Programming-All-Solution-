LP-IP-solver
============

Linear Programming and Integer Programming Solver with Simplex in Octave/Matlab

I had written and tested it in Octave from scratch. 

It's probably for the purpose of studying Simplex, LP and IP only. 

The performance is not good since the implementation of Simplex is using Bland's rule to choose leaving and entering variable, which can make sure the algorithm terminates but it's not optimal.
(Interior Point Method is better than Simplex)

The IP is using Gomory-Chvatal Cut. It, however, may suffer from numerical problem when checking if a number is integer.



Input_format.PDF: describe the format of the input

ILP.m: to solve Integer Programming problems

LP.m: to solve Liner Programming problems




