% conditions initiales
t_0 = 0;
y_10 = 2.5;
y_20 = 0;
h = 0.0001;
N = 0.03/h;

% résolution par Runge-Kutta d'ordre 4
M = sys2rk4(t_0, y_10, y_20, h, N);

% affichage  des valeurs de f_1
figure(1)
plot(M(:,1,:), M(:,2,:), "LineWidth", 2, "b")
set(gca, 'FontSize', 20)
title("Variation de la charge de courant")
legend("f_1")
xlabel("t (en s)")
ylabel("Coulombs")

% affichage  des valeurs de f_2
figure(2)
plot(M(:,1,:), M(:,3,:), "LineWidth", 2, "b")
set(gca, 'FontSize', 20)
title("Variation de l'intensité du courant")
legend("f_2")
xlabel("t (en s)")
ylabel("Ampère")

% Intensité maximale du courant
[maxima,idx] = max(M(:,3,:));
printf("L'intensité maximale atteinte lors de la simulation est de %dA à l'instant t=%d\n", maxima, M(idx,1))
