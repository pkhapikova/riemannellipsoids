function yout = matrixToVector(sigma, M)
y(1) = M(1,1);
y(2) = M(1,2);
y(3) = M(1,3);
y(4) = M(2,1);
y(5) = M(2,2);
y(6) = M(2,3);
y(7) = M(3,1);
y(8) = M(3,2);
y(9) = M(3,3);
y(10) = sigma(1,1);
y(11) = sigma(1,2);
y(12) = sigma(1,3);
y(13) = sigma(2,2);
y(14) = sigma(2,3);
y(15) = sigma(3,3);

yout = y';  % put all transposes inside the subroutine
end