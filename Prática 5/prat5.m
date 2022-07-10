function [] = prat5

  %=== Definicao das funcoes ===
  function f = df_dt(t, theta)
    N=74;  r=(1+(N/100));  m=1;  c=0.5;  g=9.81;        %- Constantes do problema
    f=[theta(2);(-(g/r)*sin(theta(1))-(c/m)*theta(2))]; %- Funcoes
  end

  %=== Resolucao da EDO ===
  ti=0;  tf=20;  dt=0.01;   %- Definicao dos intervalos
  [t,theta_t]=ode45(@(t,theta) df_dt(t,theta),[ti:dt:tf],[0; 15]);
  f_theta=theta_t(:,1);     %- Angulo
  f_w=theta_t(:,2);         %- Velocidade angular

  N=74;  r=(1+(N/100));  m=1;  c=0.5;  g=9.81;  %- Constantes do problema

  n_voltas=floor(max(f_theta)/(2*pi))           %- Numero de voltas completas

  Tr=m*(theta_t(:,2).^2*r+g*cos(theta_t(:,1))); %- Tracao na corda

  f_osc=theta_t(:,2)./(2*pi);                   %- Frequencia de oscilacao

  %=== Plot dos Graficos ===
  figure(1)
  plot(t,f_theta,'b-');
  title('Gráfico 1 - \theta vs t', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Ângulo (rad)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(2)
  plot(t, f_w, 'b-');
  title('Gráfico 2 - \omega vs t', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade angular (rad/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(3)
  plot(theta_t(:,1), theta_t(:,2), 'b-');
  title('Gráfico 3 - \omega vs \theta', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade Angular (rad/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Ângulo (rad)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(4)
  plot(t, Tr, 'b-');
  title('Gráfico 4 - T_r vs t', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Tração (N)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  t_osc=t(find(f_theta==max(f_theta)));    %- Encontrando o t em que a oscilacao comeca
  figure(5)
  plot(t, f_osc, 'b-');
  title('Gráfico 5 - f vs t', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Frequência de oscilação (Hz)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  xlim([t_osc tf]);   ylim([-0.5 0.5])     %- Ajustando os limites
  grid on;
end
