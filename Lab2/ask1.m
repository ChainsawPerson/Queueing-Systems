pkg load statistics
pkg load queueing

clc;
clear all;
close all;

lambda = 5;
UTI=[0,50]; 
RES=[0,50];
AV_REQ=[0,50]; 
X=[0,50]; 

m = [5.1:0.1:10];
for i=1:columns(m)
    [UTI(i),RES(i),AV_REQ(i),X(i)] = qsmm1(lambda, m(i));
endfor
# Utiliaztion
figure(1);
hold on;
plot(m,UTI,"linewidth", 1);
title("Utilization","fontsize",12);
xlabel("Parameter ì","fontsize",12);
ylabel("Utilization","fontsize",12);

hold off;
# Server responce time
figure(2);
hold on;
plot(m,RES,"linewidth", 1);
title("Response Time","fontsize",12);
xlabel("Parameter ì","fontsize",12);
ylabel("Response time","fontsize",12);

hold off;
# Average number of requests
figure(3);
hold on;
plot(m,AV_REQ,"linewidth", 1);
title(" Average number of requests","fontsize",12);
xlabel("Parameter ì","fontsize",12);
ylabel("Average Number of requests","fontsize",12);

hold off;
# Server throughput
figure(4);
hold on;
plot(m,X,"linewidth", 1);
title("Throughput","fontsize",12);
xlabel("Parameter ì","fontsize",12);
ylabel("Throughput","fontsize",12);

hold off;