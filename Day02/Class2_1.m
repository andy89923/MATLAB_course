clear all
clc

tic

lef = 0.0;
rig = 10.0;

fun = @(x) exp(x);
rel = integral(fun, lef, rig);

seq = 20000;
ans = 0.0;
sum = 0.0;
t = lef;

gap = (rig - lef) / seq; 

for i = 0 : seq
    sum = sum + 2 * fun(t);
    t = t + gap;
end
sum = sum - fun(lef) - fun(rig);
ans = sum * gap / 2;

rel
ans
dif = rel - ans

toc