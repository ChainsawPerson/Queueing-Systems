clc;
clear all;
close all;

# TASK A

lambda = 1/5;
random_exp_samples = exprnd(lambda, 1, 100);
time_between_samples = zeros(1, 100);

for i = 2 : 100
  time_between_samples(i) = time_between_samples(i-1) + random_exp_samples(i);
endfor

samples = 1:1:100;

figure(1);
stairs(samples, time_between_samples, "linewidth", 1.2);
title("Poisson Process N(t)");
xlabel("Number of samples received");
ylabel("Time between samples");

# TASK B

no_random_samples = [100, 200, 300, 500, 1000, 10000];

for i = 1 : columns(no_random_samples)
  sample = exprnd(lambda, 1, no_random_samples(i));
  sample_time = sum(sample);
  mean_no_samples = no_random_samples(i)/sample_time
endfor
