function [root,n] = regula_falsi(a,b,tol,f)
%eg - pass f as f = @(x) x.^4-3*x+5
   xL = a;
   xR = b;
   xM = (xL.*f(xR)-xR.*f(xL))./(f(xR)-f(xL));
   n = 1;
   while min(abs(xM-xR),abs(xL-xM)) >= tol
       fprintf('xL = %.9f, xR = %.9f, xM = %.9f, n = %d, e = %.9f \n',xL,xR,xM,n,min(abs(xL-xM),abs(xM-xR)));
       if f(xL)*f(xM) < 0
           xR = xM;
       elseif f(xM)*f(xR) < 0
           xL = xM;
       elseif f(xM) == 0
           break;
       end
       xM = (xL.*f(xR)-xR.*f(xL))./(f(xR)-f(xL));
       n = n+1;
   end
   root = xM;
   fprintf('Ans = %.9f after %d iterations with error = %.9f.\n',root,n,min(abs(xL-xM),abs(xM-xR)));
end
