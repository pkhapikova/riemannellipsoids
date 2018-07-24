function [sigma, M] = vectorToMatrix(y)
M(1,1) = y(1);
M(1,2) = y(2);
M(1,3) = y(3);
M(2,1) = y(4);
M(2,2) = y(5);
M(2,3) = y(6);
M(3,1) = y(7);
M(3,2) = y(8);
M(3,3) = y(9);
sigma(1,1) = y(10);
sigma(1,2) = y(11);
sigma(1,3) = y(12);
sigma(2,2) = y(13);
sigma(2,3) = y(14);
sigma(3,3) = y(15);
% need all of the elements of sigma
sigma(2,1) = sigma(1,2);
sigma(3,1) = sigma(1,3);
sigma(3,2) = sigma(2,3);



end