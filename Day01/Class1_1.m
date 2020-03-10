clear all
clc

x = pi;
u = 200;
ans_sin = 0.0;
ans_cos = 0.0;

t = -1;
for i = 0 : u
    t = t * -1;
    ans_sin = ans_sin + t * (x ^ (2 * i + 1)) / factorial(2 * i + 1);
    ans_cos = ans_cos + t * (x ^ (2 * i + 0)) / factorial(2 * i + 0);
end

ans_sin
ans_cos

dif_sin = sin(pi) - ans_sin
dif_cos = cos(pi) - ans_cos