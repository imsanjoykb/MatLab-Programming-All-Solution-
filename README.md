LP-IP-solver
============

Linear Programming and Integer Programming Solver with Simplex in Octave/Matlab

I had written and tested it in Octave from scratch.  

The performance is not good since the implementation of Simplex is using Bland's rule to choose leaving and entering variable, which can make sure the algorithm terminates but it's not optimal.


The IP is using Gomory-Chvatal Cut. It, however, may suffer from numerical problem when checking if a number is integer.

Input_format.PDF: describe the format of the input

Powered By ##Sanjoy ##Biswas





