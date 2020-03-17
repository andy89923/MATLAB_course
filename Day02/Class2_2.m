clear all 
clc 

tic 

lef = 0.0;
rig = 10.0;

fun = @(x) exp(x);
rel = integral(fun, lef, rig);

seq = 20000;
gap = (rig - lef) / seq;

mat_un = lef : gap : rig;
mat_af = fun(mat_un);

ans = (sum(mat_af) * 2 - mat_af(1) - mat_af(end)) * gap;
ans = ans / 2;

rel
ans


dif = rel - ans

toc