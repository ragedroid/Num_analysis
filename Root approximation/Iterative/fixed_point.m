function [root,n] = fixed_point(a,b,x0,tol,phi,x)
%eg - directly pass phi as syms x; phi based on choice

    %sanity check for phi
    dphi = diff(phi);
    range = a:1e-2:b;
    max = 0;
    for i = range
        if abs(subs(dphi,x,i)) > max
            max = abs(subs(dphi,x,i));
        end
    end
    
    %iteration
    if abs(max) < 1
        xn = x0;
        xn1 = subs(phi,x,x0);
        n = 1;
        while abs(xn1-xn) >= tol
            fprintf('x(n) = %.9f, x(n+1) = %.9f, n = %d, e = %.9f \n',xn,xn1,n,abs(xn1-xn));
            xn = xn1;
            xn1 = subs(phi,x,xn);
            n = n+1;
        end
        root = xn1;
        fprintf('Ans = %.9f after %d iterations with error = %.9f.\n',root,n,abs(xn1-xn));
    
    else
        fprintf('|phi''(x)| exceeds 1 on interval. Choose a different function.\n');
    end
end
