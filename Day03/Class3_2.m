clear all
clc

lef = 0;
rig = 10;
seq = 10000;
gap = (rig - lef) / seq;

nn = [1 10 100 1000];
xx = lef : gap : rig;

for i = 1 : 1 : 4    
    subplot(2, 2, i);
    title(strcat('¤èªifourier n = ', num2str(nn(i))));
    ylabel('y');
    xlabel('x');
    
    now_max_n = nn(i);
    ss = numel(xx);
    yy = zeros(1, ss);
    for n = 1 : 1 : now_max_n 
        fun = @(x) (2 / (n*pi)) * sin(n*pi/2) * cos(x*n*pi/2);
        
        yy = yy + fun(xx);
    end
    shi = @(x) x + 0.5;
    yy = shi(yy);
   
    plot(xx, yy)
end
