clear all
clc

fun = @(x, y) exp(-((abs(x).*abs(y)) ./ (x.^2 + y.^2).^(1/2)));

seq = 50;
xs = linspace(-2, 2, seq);
ys = linspace(-2, 2, seq);

[xx, yy] = meshgrid(xs, ys);
zz = fun(xx, yy);

[fx, fy] = gradient(zz);

hold on
contourf(zz)
quiver(fx, fy)


colormap('default')
colorbar