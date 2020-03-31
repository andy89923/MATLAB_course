clear all
clc

fun_a = @(x, y) (1 - x) .^ 2 .* exp(-x.^ 2 - (y + 1).^2);
fun_b = @(x, y) (x./5 - x.^3 - y.^5) .* exp(-x.^2 - y.^2);
fun_c = @(x, y) exp(-(x+1).^ 2- y.^2);

fun = @(a, b) 3*fun_a(a, b) - 10*fun_b(a, b) - fun_c(a, b)/3;

xs = linspace(-3, 3, 30);
ys = linspace(-3, 3, 30);

[xx, yy] = meshgrid(xs, ys);
zz = fun(xx, yy);

meshc(xx, yy, zz)

colormap('default')
colorbar
