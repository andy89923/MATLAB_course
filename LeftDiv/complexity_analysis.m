clear all; close all, clc
% size=[500 1000 2000 3000 4000];  % Matrix size
size = [50 100 200 300 400];
% size = [1 2 3 4 5]

for i = 1:length(size)  
    n = size(i);         
    A = rand(n);            
    b = rand(n,1);         
    
    tstart1 = tic;                            % Gaussian LU decomposition
    x1 = splv(A,b);
    telapse1 = toc(tstart1);
    soltimes1(i) = telapse1;
    
    tstart2 = tic;                            % Matlab optimized left devision x = A\b
    x2 = A\b;
    telapse2 = toc(tstart2);
    soltimes2(i) = telapse2;
          
    tstart3 = tic;                            % Inverse Matrix inverse(A)
    x3 = inv(A) * b;
    telapse3 = toc(tstart3);
    soltimes3(i) = telapse3;
    
    tstart4 = tic;                            % inverse(A) by Cofactor
    x4 = cofactor(A)*b;
    telapse4 = toc(tstart4);
    soltimes4(i) = telapse4;
    
    tstart5 = tic;                            % Gauss
    tmp = rref([A b]);
    x5 = tmp(length(A)+1);
    telapse5 = toc(tstart5);
    soltimes5(i) = telapse5;
    
    fprintf("n = %d, time = ", n);
    fprintf("LU %d, ", telapse1);
    fprintf("LD %d, ", telapse2);
    fprintf("Iv %d, ", telapse3);
    fprintf("Co %d, ", telapse4);
    fprintf("GA %d\n", telapse5);

end

figure(1);                                 % calculation time soltime1 (Gaussian LU)  
plot(size,soltimes1,'o');                  % soltime2 (A\b), soltime3 (Inverse)
xlabel('matrix size');
ylabel('time to solve Ax = b(sec)');
hold on;
plot(size,soltimes2,'x');
hold on;
plot(size,soltimes3,'*');
hold on;
plot(size,soltimes4,'.');
hold on;
plot(size,soltimes5,'+');

legend('LU','mldivide','inverse', 'cofactor', 'Gauss');

% 
logn = log(size);
logtime1 = log(soltimes1);              % Gaussian Elimination LU                                   
pvals1 = polyfit(logn,logtime1,1);      % soltimes = kn^(B) 
ordernLU = pvals1(1);                   % log(soltimes) = A + Blog(n); pvals = [B A]
                                        % ordernLU = B

logtime2 = log(soltimes2);              % Left division by Matlab optimization 
pvals2 = polyfit(logn,logtime2,1);      % soltimes = kn^(B)
ordernLEFTDIV = pvals2(1);              % log(soltimes) = A + Blog(n); pvals = [B A]
                                                      % ordernLEFTDIV = B
                                                      
logtime3 = log(soltimes3);              % Inverse
pvals3 = polyfit(logn,logtime3,1);      % soltimes = kn^(B)
ordernINVERSE = pvals3(1);              % log(soltimes) = A + Blog(n); pvals = [B A]
                                                       % ordernINVERSE = B
logtime4 = log(soltimes4);          
pvals4 = polyfit(logn,logtime4,1);     
ordernCofactor = pvals4(1);              
     
logtime5 = log(soltimes5);          
pvals5 = polyfit(logn,logtime5,1);     
ordernGauss = pvals5(1);  

h=[0:1:400];                         
s1 = h.^(ordernLU)*exp(pvals1(2));       % polynomial fitting to soltimes = kn^(B)
s2 = h.^(ordernLEFTDIV)*exp(pvals2(2));  % log(soltimes) = A + Blog(n); pvals = [B A]
s3 = h.^(ordernINVERSE)*exp(pvals3(2));  % Note: soltimes3./soltimes1
s4 = h.^(ordernCofactor)*exp(pvals4(2));
s5 = h.^(ordernGauss)*exp(pvals5(2));

hold on;
plot(h,s1,'r');
hold on;
plot(h,s2,'g');
hold on;
plot(h,s3,'b');
hold on;
plot(h,s4,'c');
hold on;
plot(h,s5,'m');
