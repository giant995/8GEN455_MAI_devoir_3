% Implémentation de l'algorithme Runge-Kutta d'ordre 4
%
% Paramètres:
%       t_0 (integer): Temps t initiales
%       y_10 (integer): Valeur initiale de y_1
%       y_20 (integer): Valeur intiiale de y_2f
%
% Returns:
%       result (matrix): Matrice à 3 colonnes comportant les valeurs de y_1n et y_2n pour chaque instant t
%
function[result]=sys2rk4(t_0, y_10, y_20, h, N)
  % Valeurs initiales
  y_1n = y_10;
  y_2n = y_20;
  t_n = t_0;
  
  for i=1:N 
    % Insertion de t_n, y_1n et y_2n dans la matrice résultante
    result(i, 1) = t_n;
    result(i, 2) = y_1n;
    result(i, 3) = y_2n;
    
    % Calcul des k_m1
    k_11 = h*f1(t_n, y_1n, y_2n);
    k_21 = h*f2(t_n, y_1n, y_2n);
    
    % Calcul des k_m2
    k_12 = h*f1(t_n+(h/2), y_1n+(k_11/2), y_2n+(k_21/2));
    k_22 = h*f2(t_n+(h/2), y_1n+(k_11/2), y_2n+(k_21/2));
    
    % Calcul des k_m3
    k_13 = h*f1(t_n+(h/2), y_1n+(k_12/2), y_2n+(k_22/2));
    k_23 = h*f2(t_n+(h/2), y_1n+(k_12/2), y_2n+(k_22/2));
    
    % Calcul des k_m4
    k_14 = h*f1(t_n+h, y_1n+k_13, y_2n+k_23);
    k_24 = h*f2(t_n+h, y_1n+k_13, y_2n+k_23);
    
    % Calcul des y(m, n+1)
    y_1n = y_1n+(1/6)*(k_11 + k_12 + k_13 + k_14);
    y_2n = y_2n+(1/6)*(k_21 + k_22 + k_23 + k_24);
    
    % Calcul de t(n+1)
    t_n = t_n + h;
  endfor
endfunction