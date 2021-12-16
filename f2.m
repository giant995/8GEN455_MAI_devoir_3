function[y]=f2(t, y_1, y_2)
  R = 180; % Ohm
  L = 65*10^(-3); % Henry
  C = 0.4*10^(-6); % Fahrad
  
  y = -1*R/L*y_2-1/(L*C)*y_1;
endfunction