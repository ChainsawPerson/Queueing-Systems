% system M/M/1/10
% when there are 3 clients in the system, the capability of the server doubles.

clc;
close all;

rand("seed",1);

for l = 1:3

lambda = [1, 5, 10];
mu = 5;

total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;

threshold = lambda./(lambda + mu); 

transitions = 0; 
total=0;
  while transitions >= 0 & transitions < 1000000

   transitions = transitions + 1; % one more transitions step
  
    if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
      index = index + 1;
      for i=1:1:length(arrivals)
          P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
      endfor
    
      mean_clients = 0; % calculate the mean number of clients in the system
      for i=1:1:length(arrivals)
         mean_clients = mean_clients + (i-1).*P(i);
     endfor
    
      to_plot(index) = mean_clients;
        
      if abs(mean_clients - previous_mean_clients) < 0.0001 % convergence test
        break;
      endif
    
     previous_mean_clients = mean_clients;
    
   endif
  
    random_number = rand(1); % generate a random number

    if(current_state == 0 || random_number < threshold(l)) 
      total_arrivals = total_arrivals + 1;
      state(transitions) = current_state +1;
      try 
        arrivals(current_state+1 ) =arrivals(current_state+1) + 1;
        state(transitions) = current_state; 
        if (current_state <10)
        current_state = current_state + 1;
        endif
        next_transition(transitions) = 1;
        total = total +1;
      catch
        arrivals(current_state + 1) = 1;
        current_state = current_state + 1;
        next_transition(transitions) = 1;
        total = total +1;
    end

    else % departure
        state(transitions) = current_state+1;
        if current_state != 0 % no departure from an empty system
        current_state = current_state - 1;
        next_transition(transitions) = 0;
        total = total -1;
        endif
    endif
    t_arrivals(transitions)= total;

endwhile

figure(l);
bar(P,'r',0.4);
title("Probabilities");
figure(l+3);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/10 queue: Convergence");
xlabel("transitions in thousands");
ylabel("Average number of clients");

clear all;

endfor

% Debugging:

%for i=1:1:30
%  disp(cstrcat("State No: ", num2str(state(i))));
%  if(next_transition(i+1) ==1)
%   display("Type of next transition: Arrival");
%  else 
%   display("Type of next transition: Departure");
%  endif
%  disp(cstrcat("Total arrivals: ", num2str(t_arrivals(i)), "\n"));
%endfor
