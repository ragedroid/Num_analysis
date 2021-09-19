function [root,n] = secant(a,b,tol,f)
%eg - pass f as f = @(x) x.^4-3*x+5
   if abs(f(a)) > abs(f(b))
      xL = a;
      xU = b;
   else
       xL = b;
       xU = a;
   end
   xM = (xL.*f(xU)-xU.*f(xL))./(f(xU)-f(xL));
   n = 1;
   while abs(xM-xU) >= tol
       fprintf('xL = %.9f, xR = %.9f, xM = %.9f, n = %d, e = %.9f \n',xL,xU,xM,n,abs(xM-xU));
       xL = xU;
       xU = xM;
       xM = (xL.*f(xU)-xU.*f(xL))./(f(xU)-f(xL));
       n = n+1;
   end
   root = xM;
   fprintf('Ans = %.9f after %d iterations with error = %.9f.\n',root,n,abs(xM-xU));
end

