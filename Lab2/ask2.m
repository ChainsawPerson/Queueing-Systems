pkg load statistics
pkg load queueing

clc;
clear all;
close all;

lambda = 5;
m = 10;
states = [0, 1, 2, 3, 4]; 
initial_state = [1, 0, 0, 0, 0];

births = lambda ./ (1+states) (:,[1:4]);
deaths = [m, m, m, m];

#PART B
# I)
display("Part I:");
transition_matrix = ctmcbd(births, deaths);
display(transition_matrix);

# II)
display("Part II:");
Prob = ctmc(transition_matrix);
display(Prob);

figure(1);
hold on;
bar(states, Prob, "r", 0.5);
title("Probability of state");
xlabel("States");
ylabel("Probability");
axis([-0.5 4.5 0 0.62]);
hold off;

# III)
display("Part III:");
avrg = sum(Prob.*states);
display(strcat("Average number = " , num2str(avrg)));
display(" ");

# IV)
display("Part IV:");
display(strcat("Blocking Probability = " , num2str(Prob(5))));
display(" ");

# V)
display("Part V:")
index = 0;
for T = 0 : 0.01 : 60
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);
  Prob1(index) = P0(2);
  Prob2(index) = P0(3);
  Prob3(index) = P0(4);
  Prob4(index) = P0(5);
  if (P0 - Prob) < 0.01
    break;
  endif
endfor

T = 0 : 0.01 : T;
figure(2);
hold on;
plot(T, Prob0, "r", "linewidth", 1.3);
plot(T, Prob1, "b", "linewidth", 1.3);
plot(T, Prob2, "c", "linewidth", 1.3);
plot(T, Prob3, "k", "linewidth", 1.3);
plot(T, Prob4, "g", "linewidth", 1.3);
title("State probability for \\lambda = 5, m = 10 across time");
xlabel("Time (s)");
ylabel("Probability");
axis([0 0.5]);
legend (" State : 0"," State : 1"," State : 2"," State : 3"," State : 4");
grid on;
hold off;
