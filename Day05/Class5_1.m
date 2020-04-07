clear all
clc
format long

fun = @(x) tan(x) - x;

lef = 0.0;
rig = 6.0; 
ans = (lef + rig) / 2;
mid = ans;

fl = fun(lef);
fr = fun(rig);

while abs(fun(ans)) > 0.0000000000000009
    fm = fun(mid);
    
    if fl * fm < 0
        rig = mid;
    else
        lef = mid;
    end
    ans = mid;
    
    fl = fun(lef);
    fr = fun(rig);
    
    mid = (lef + rig) / 2.0;
end

ans
