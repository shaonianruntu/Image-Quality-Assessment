% if needed, compile the mexfiles
% mex ical_stat.c
% mex ical_std.c

% Feed in integers
src = round(255*rand(128));
dst = round(255*rand(128));

[I, Map] = MAD_index( src , dst );
% I.LO: the lo quality index
% I.HI: the hi quality index
% I.MAD: the MAD quality index, using both indices


% Map.HI and Map.LO are the maps used to calculate the indices
% subplot(121); imshow( uint8( src ) );
% subplot(122); imshow( uint8( dst ) );