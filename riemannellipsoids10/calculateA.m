function [A1,A2,A3] = calculateA(a,b,c)

func1 = @(x) 1./((a.^2+x).*sqrt((a.^2+x).*(b.^2+x).*(c.^2+x)));
A1 = a.*b.*c.*integral(func1, 0, Inf,'RelTol',1e-12,'AbsTol',1e-12); 
func2 = @(x) 1./((b.^2+x).*sqrt((a.^2+x).*(b.^2+x).*(c.^2+x)));
A2 = a.*b.*c.*integral(func2, 0, Inf,'RelTol',1e-12,'AbsTol',1e-12);
func3 = @(x) 1./((c.^2+x).*sqrt((a.^2+x).*(b.^2+x).*(c.^2+x)));
A3 = a.*b.*c.*integral(func3, 0, Inf,'RelTol',1e-12,'AbsTol',1e-12);