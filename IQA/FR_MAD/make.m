% This make.m is used under Windows

% add -largeArrayDims on 64-bit machines

mex -largeArrayDims -O -c ical_std.c
mex -largeArrayDims -O -c ical_stat.c