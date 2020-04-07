clear all
clc

format short

n = 3;
all = [1.0 0.0 1.0; 2.0 -1.0 1.0; 3.0 2.0 0.0];
% all = all';

ans = GSO(all, n);
ans'


function [u] = GSO(V, n)
    U = V;
    
    lef = 1;
    rig = n;
    
    for i = 1 : 1 : n
        
        ll = 1;
        rr = n;
        for j = 1 : 1 : i - 1
            U([lef:rig]) = U([lef:rig]) - Cterm(V([lef:rig]), U([ll:rr]), n);
            
            ll = ll + n;
            rr = rr + n;   
        end
        
        lef = lef + n;
        rig = rig + n;
    end
    
    u = U;
    
    lef = 1;
    rig = n;
    for i = 1 : 1 : n
        t = sqrt(Vlen(u([lef:rig]), n));
        u([lef:rig]) = Short(u([lef:rig]), n, t);
        
        lef = lef + n;
        rig = rig + n;
    end
    
end

% each term of minus
function [tem] = Cterm(V, U, n)
    tmp =  Vlen(U, n) / Dot(V, U, n);
    
    tem = Short(U, n, tmp);
end

% shorten the vector by variables t
function [rep] = Short(X, n, t)
    rep = X;
    for i = 1 : 1 : n
        rep(i) = X(i) / t;
    end
end

% calculate the length
function rep = Vlen(X, n)
    rep = 0.0;
    
    for i = 1 : 1 : n
        rep = rep + X(i) * X(i);
    end
end

% calculate the dot product of X and Y 
function rep = Dot(X, Y, n)
    rep = 0.0;
    
    for i = 1 : 1 : n
        rep = rep + X(i) * Y(i);
    end
end
