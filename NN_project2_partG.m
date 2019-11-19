
info = audioinfo('file_example_WAV_1MG.wav');
[y1, Fs1] = audioread('file_example_WAV_1MG.wav');
sound(y1, Fs1)
t = 0:seconds(1/Fs1):seconds(info.Duration);
t = t(1:end-1);

plot(t, y1)
xlabel('Time')
ylabel('Audio Signal')

figure
info2 = audioinfo('Tug Boat Hornwav.wav');
[y2, Fs2] = audioread('Tug Boat Hornwav.wav');
sound(y2, Fs2)
t2 = 0:seconds(1/Fs2):seconds(info2.Duration);
t2 = t2(1:end-1);

plot(t2, y2)
xlabel('Time')
ylabel('Audio Signal')

figure

info3 = audioinfo('Voice 12wav.wav')
[y3, Fs3] = audioread('Voice 12wav.wav');
sound(y3, Fs3)
t3 = 0:seconds(1/Fs3):seconds(info3.Duration);
t3 = t3(1:end-1);

plot(t3, y3)
xlabel('Time')
ylabel('Audio Signal')


v = y3/1.5;
hold on
plot(t3, v);

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
    mk = 1.2*sin(((2*pi*k)/3)-(pi/2));
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

%time = 0:0.5/100:0.5;
%clf
%plot(time, y)
%hold on
%plot(time, x)

%k
%wnew