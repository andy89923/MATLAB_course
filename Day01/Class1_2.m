clear all
clc

seq = 50000;
ans = 0.0;
t = 0.0;

gap = 10 / seq; 

for i = 1 : seq
    t = t + gap;
    ans = ans + (exp(t) * gap);
end

fun = @(x) exp(x)
dif = ans - integral(fun, 0, 10);

ans
dif
