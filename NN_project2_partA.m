%vk = 1.2*sin((2*pi*k)/3)
%mk = 1.2*sin(((2*pi*k)/3) + (pi/2))
Evkvk = ((1.2)^2) * (1/3) * ((sin((2 * pi * 1) / 3)^2) + (sin((2 * pi * 2) / 3)^2) + (sin((2 * pi * 3) / 3)^2));
Evkvk1 = ((1.2)^2) * (1/3) * ((sin((2 * pi * 1) / 3) * sin((2 * pi * 0) / 3)) + (sin((2 * pi * 2) / 3) * sin((2 * pi * 1) / 3)) + (sin((2 * pi * 3) / 3) * sin((2 * pi * 2) / 3)));
R = [Evkvk Evkvk1; Evkvk1 Evkvk];
A = 2 * R;
lambda = eig(A);
lambda1 = lambda(1);
lambda2 = lambda(2);
[V, D] = eig(A);
z1 = [(-sign(V(1, 1) * (V(1, 1) / V(1, 1)))); (-sign(V(2, 1))) * (V(2, 1) / V(2, 1))];
z2 = [(-sign(V(1, 2) * (V(1, 2) / V(1, 2)))); (-sign(V(2, 2))) * (V(2, 2) / V(2, 2))];

Emkvk = (1/3) * ((0.12 * sin(((2 * pi * 1) / 3) + (pi / 2)) * 1.2 * sin((2 * pi * 1) / 3)) + (0.12 * sin(((2 * pi * 2) / 3) + (pi / 2)) * 1.2 * sin((2 * pi * 2) / 3)) + (0.12 * sin(((2 * pi * 3) / 3) + (pi / 2)) * 1.2 * sin((2 * pi * 3) / 3)));
Esmkvk1 = (1/3) * ((0.12 * sin(((2 * pi * 1) / 3) + (pi / 2)) * 1.2 * sin((2 * pi * 0) / 3)) + (0.12 * sin(((2 * pi * 2) / 3) + (pi / 2)) * 1.2 * sin((2 * pi * 1) / 3)) + (0.12 * sin(((2 * pi * 3) / 3) + (pi / 2)) * 1.2 * sin((2 * pi * 2) / 3)));
%quad = [1 -(A(1, 1)*2) (A(1, 1)^2)-(A(1, 2)^2)]
h = [Emkvk; Esmkvk1];
Xstar = inv(R) * h;

c = 0.0205;
x1 = linspace(-2, 2);
x2 = x1';
x = [x1; x2'];

%f = c-(2.*x2.*h)+(x2.*R.*x1)
%contour(x1, x2, f)
x1_lim = [-2 2];
x2_lim = [-2 2];
x1 = x1_lim(1):(x1_lim(2) - x1_lim(1)) / 30:x1_lim(2);
x2 = x2_lim(1):(x2_lim(2) - x2_lim(1)) / 30:x2_lim(2);
[X1, X2] = meshgrid(x1, x2);
F = (R(1, 1) * X1.^2 + (R(1, 2) + R(2, 1)) * X1 .* X2 + R(2, 2) * X2.^2) ...
    +-2 * (h(1) * X1 + h(2) * X2) + c;
contour(X1, X2, F)
hold on
plot(Xstar(1), Xstar(2), 'o')
minimumMeanSquareError = c - (2 * transpose(Xstar) * h) + (transpose(Xstar) * R * Xstar)

maximumStableLearningRate = 2 / (max(lambda1, lambda2))
