function [root,n] = fixed_point(a,b,x0,tol,phi,x)
%eg - directly pass phi as syms x; phi based on choice

    %sanity check for phi by derivative
    dphi = diff(phi);
    range = a:1e-2:b;
    max = 0;
    for i = range
        if abs(subs(dphi,x,i)) > max
            max = abs(subs(dphi,x,i));
        end
    end
    
    %sanity check for phi by domain
    flag = 0;
    for i = range
        if (subs(phi,x,i) < a) || (subs(phi,x,i) > b)
            flag = 1;
        end
    end
    
    %iteration
    if (abs(max) < 1) && (flag == 0)
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
    
    elseif (abs(max) > 1)
        fprintf('|phi''(x)| exceeds 1 on interval. Choose a different function.\n');
        
    elseif (flag)
        fprintf('phi(x) is not contained within interval. Choose a different function.\n');
    end
end
