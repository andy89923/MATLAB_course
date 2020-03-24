clear all
clc

n1 = 1.00;
n2 = 1.45;

fun_gt2 = @(x) sqrt(1 - ((n1 ./ n2 .* sind(x)) .^ 2));

fun_nue = @(x) n1 * cosd(x) - n2 * fun_gt2(x);
fun_den = @(x) n1 * cosd(x) + n2 * fun_gt2(x);

fun = @(x) (fun_nue(x) ./ fun_den(x)) .^ 2;
fun2 = @(x) 1 - fun(x);

deg = 0.0 : 1.0 : 90.0;

rs = fun(deg);
ts = ones(1, 91) - rs;


subplot(1, 2, 1)
plot(deg, rs, 'rs-')
% fplot(fun, [0, 90], 'rs-');
title('TE n1 = 1.0, n2 = 1.45');
ylabel('反射率');
xlabel('入射角');

subplot(1, 2, 2)
% fplot(fun2, [0, 90], 'rs-')
plot(deg, ts, 'rs-')
title('TE n1 = 1.0, n2 = 1.45');
ylabel('穿透率');
xlabel('入射角');