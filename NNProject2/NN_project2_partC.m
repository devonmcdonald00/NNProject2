k = 0;
e = 10000;
wold = [0 -2 1];
wnew = [0 0 0];
sMin = -0.2;
sMax = 0.2;
alpha = 0.12;
y = zeros(101, 1);
x = zeros(101, 1);
while abs(e) > 0.001
    k = k+1;
    vk = 1.2*sin((2*pi*k)/3);
    vk1 = 1.2*sin((2*pi*(k-1))/3);
    a = (wold(1)*vk)+(wold(2)*vk1)+wold(3);
    sk = sMin+(rand()*(sMax-sMin));
    mk = 0.12*sin(((2*pi*k)/3)+(pi/2));
    t = sk+mk;
    if k <= 101
        y(k) = a;
    end
    e = t-a;
    if k <= 101
        x(k) = t;
    end
    wnew = [(wold(1)+(2*alpha*e*vk)) (wold(2)+(2*alpha*e*vk1)) (wold(3)+(2*alpha*e))];
    wold(1) = wnew(1);
    wold(2) = wnew(2);
    wold(3) = wnew(3);
end

time = 0:0.5/100:0.5;
clf
plot(time, y)
hold on
plot(time, x)

k
wnew


