%Function that calculates Mdot and sigmadot from the assorted constants and
%forces and makes sure everything is in the right form for the integrator
%function
function dydt = riemann(~,y,G,ro,volume)

[sigma, M] = vectorToMatrix(y);

%%% calculate some preliminaires
sigmainv = inv(sigma);
invsigmahat = (sigmainv/trace(sigmainv));

[R,EValue] = eig(sigma);

tmp = (5/(ro*volume))*diag(EValue);
a = sqrt(tmp(1,1));
b = sqrt(tmp(2,1));
c = sqrt(tmp(3,1));

%%
[A1 A2 A3] = calculateA(a,b,c);

A = [A1 0 0 ; 0 A2 0 ; 0 0 A3];


%%
gravityfunction = 2*pi*G*ro*(2*eye(3)/trace(sigmainv) - sigma*R*A*transpose(R));
%%%%%%%%%%%%%
dMdt =  M'*sigmainv*M + eye(3)*trace(invsigmahat*M*sigmainv*M) - trace(invsigmahat*M)*(sigmainv*M + M'*sigmainv) + gravityfunction; 
dsigmadt = M + (M.') - 2*eye(3)*trace(invsigmahat*M);
%%%%%%%%%%%%%

dydt = matrixToVector(dsigmadt, dMdt);
end