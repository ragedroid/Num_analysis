function [root,n] = newton_std(x0,tol,f,x)
%eg - pass f as syms x; f = x.^4-3*x+5
    df = diff(f);
    xn = x0;
    xn1 = x0-(subs(f,x,x0)/subs(df,x,x0));
    n = 1;
    while abs(xn1-xn) >= tol
        fprintf('x(n) = %.9f, x(n+1) = %.9f, n = %d, e = %.9f \n',xn,xn1,n,abs(xn1-xn));
        xn = xn1;
        xn1 = xn-(subs(f,x,xn)/subs(df,x,xn));
        n = n+1;
    end
    root = xn1;
    fprintf('Ans = %.9f after %d iterations with error = %.9f.\n',root,n,abs(xn1-xn));
end
