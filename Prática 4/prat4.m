function [] = prat4
  N=74;
  ti=0;
  tf=20;
  dt=0.001;
  %=== Definicao das expressoes ===
  r_o=@(o) (200*(3-2.*cos(o)));
  v_t=@(t) (0.05*(100+N).*(100-t));
  dodt=@(t,o) ((v_t(t))./(sqrt((400*sin(o)).^2+(r_o(o)).^2)));
  drdt=@(o, t) (400.*sin(o).*dodt(t,o));
  [t,o_t]=ode45(dodt,[ti:dt:tf],[0]);

  index=find(o_t<6*pi)(end)
  t(index)
  %i=find(r_o(o_t)<60 && r_o(o_t)>60)
  %i=fzero(drdt(o_t, t), 15)

  %=== Plot dos Graficos ===
  figure(1)
  plot(t,o_t,'b-');
  title('Gráfico 1 - Ângulo x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Ângulo (rad)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('t (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(2)
  plot(t,r_o(o_t), 'b-');
  title('Gráfico 2 - Raio x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Raio (mm)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(3)
  plot(t, dodt(t, o_t), 'b-');
  title('Gráfico 3 - Velocidade Angular x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade angular (rad/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(4)
  plot(t, drdt(o_t, t), 'b-');
  title('Gráfico 4 - Derivada do raio x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Derivada do raio (m)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('tempo (s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(5)
  plot(o_t, r_o(o_t), 'b-');
  title('Gráfico 5 - Raio x Ângulo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Raio (mm)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Ângulo (rad)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

  figure(6)
  plot(t, v_t(t), 'b-');
  title('Gráfico 6 - Velocidade x tempo', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade (mm/s)', 'FontName', 'Times', 'FontSize', 12)
  xlabel('tempo(s)', 'FontName', 'Times', 'FontSize', 12)
  grid on;

end
