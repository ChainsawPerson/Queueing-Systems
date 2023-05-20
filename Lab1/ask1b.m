clc;
clear all;
close all;

# TASK: In a common diagram, design the Probability Density Function of Exponential Distribution
# with mean values 1/lambda 0.5, 1, 3. In the horizontal axes, choose k parameters 
# between 0 and 8.

k = 0:0.00001:8;
lambda = [0.5, 1, 3];

for i = 1 : columns(lambda)
  exponential(i,:) = exppdf(k,lambda(i));
endfor

colors = "rbk";
figure(1);
hold on;

for i = 1 : columns(lambda)
  plot(k, exponential(i,:), colors(i), "linewidth", 1.2);
endfor

hold off;

title("Probability Density Function of Exponential Distribution");
xlabel("k values");
ylabel("probability");
legend("1/lambda=0.5", "1/lambda=1", "1/lambda=3");

# TASK: In a common diagram, design the Cumulative Distribution Function of the
# former Exponential Distributions.

for i = 1 : columns(lambda)
  exponentialcdf(i, :) = expcdf(k, lambda(i));
endfor

figure(2);
hold on;

for i = 1 : columns(lambda)
  plot(k, exponentialcdf(i,:), colors(i), "linewidth", 1.2);
endfor

hold off;

title("Cumulative Distribution Function of Exponential Distribution");
xlabel("k values");
ylabel("P(K < k)");
legend("1/lambda=0.5", "1/lambda=1", "1/lambda=3");

# TASK: For 1/lambda = 2.5 calculate the probabilities P( X > 30000) and 
# P ( X > 50000 | X > 20000).

exponentialcdf_Task3 = expcdf(k, 2.5);

Prob3 = 1 - exponentialcdf_Task3(30000)
Prob5 = 1 - exponentialcdf_Task3(50000);
Prob2 = 1 - exponentialcdf_Task3(20000);
Prob5_2 = Prob5/Prob2
