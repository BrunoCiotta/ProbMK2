function [] = prat2
  %Definindo as variaveis
  v0=10+0.1*74;
  r=100;

  %=== VELOCIDADE ===
  s=[0:0.01:30]; %Intervalo em que o grafico será plotado

  v_s=@(s) (sqrt((8.*s) - ((0.02/3).*s.^3) + (v0^2)));
  v=v_s(20)
  plot(s,v_s(s), 'r-', 'LineWidth', 1.5);
  grid on;
  title('Gráfico 1 - Velocidade x Deslocamento', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Deslocamento (m)', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Velocidade (m/s)', 'FontName', 'Times', 'FontSize', 12)
  figure(1);

  %=== ACELERACAO ===
  figure(2);
  a_s=@(s) (sqrt((4-0.01.*s.^2).^2+(((8.*s)-((0.02/3).*s.^3)+(v0^2))./r).^2));
  a=a_s(20)
  plot(s,a_s(s), 'r-', 'LineWidth', 1.5);
  grid on;
  title('Gráfico 2 - Aceleracao x Deslocamento', 'FontName', 'Times', 'FontSize', 12)
  xlabel('Deslocamento (m)', 'FontName', 'Times', 'FontSize', 12)
  ylabel('Aceleração (m/s^2)', 'FontName', 'Times', 'FontSize', 12)

  t_s=@(s)(1/v_s(s));
  %t_s=@(s) (((sqrt((4-0.01.*s.^2).^2+(((8.*s)-((0.02/3).*s.^3)+(17.4^2))./100).^2)))^(-1));
  t=quad(t_s, 0, 20)
end
