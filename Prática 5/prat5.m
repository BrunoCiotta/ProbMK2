function [] = prat5

  %=== Definicao das funcoes ===
  function f = df_dt(t, theta)
    N=74;  r=(1+(N/100));  m=1;  c=0.5;  g=9.81;        %- Constantes do problema
    f=[theta(2);(-(g/r)*sin(theta(1))-(c/m)*theta(2))]; %- Funcoes
  end

  %=== Resolucao da EDO ===
  ti=0;  tf=20;  dt=0.1;  %- Definicao dos intervalos
  [t,theta_t]=ode45(@(t,theta) df_dt(t,theta),[ti:dt:tf],[0; 15]);
  f_theta=theta_t(:,1);   %- Angulo
  f_w=theta_t(:,2);       %- Velocidade angular

  N=74;  r=(1+(N/100));  m=1;  c=0.5;  g=9.81;  %- Constantes do problema

  n_voltas=floor(max(f_theta)/(2*pi))           %- Numero de voltas completas

  Tr=m*(theta_t(:,2).^2*r+g*cos(theta_t(:,1))); %- Tracao na corda

  f_osc=theta_t(:,1)./(2*pi);                   %- Frequencia de oscilacao

  %=== Plot dos Graficos ===
  figure(1)
  plot(t,f_theta,'b-');
  title('Gráfico 1 - Ângulo x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Ângulo (rad)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(2)
  plot(t, f_w, 'b-');
  title('Gráfico 2 - Velocidade Angular x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade angular (rad/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(3)
  plot(theta_t(:,1), theta_t(:,2), 'b-');
  title('Gráfico 3 - Velocidade Angular x Ângulo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade Angular (rad/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Ângulo (rad)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(4)
  plot(t, Tr, 'b-');
  title('Gráfico 4 - Tração x Tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Tração (N)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(5)
  plot(t, f_osc, 'b-');
  title('Gráfico 5 - Frequência de oscilação x Tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Frequeência de oscilação (1/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;
end
