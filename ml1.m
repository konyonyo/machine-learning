n = 50; # 訓練データの数
N = 1000;
x = linspace(-3, 3, n)'; # 訓練データx (-3から3までをn個に分割した列ベクトル)
X = linspace(-3, 3, N)';
pix = pi*x;
y = sin(pix)./(pix)+0.1*x+0.05*randn(n, 1); # 訓練データy

p(:, 1) = ones(n, 1); # 行列pの1列目はn行1列の要素が全て1の行列
P(:, 1) = ones(N, 1);
for j = 1:15
    p(:, 2*j) = sin(j/2*x);
    p(:, 2*j+1) = cos(j/2*x);
    P(:, 2*j) = sin(j/2*X);
    P(:, 2*j+1) = cos(j/2*X);
end

# パラメータ計算
t = p \ y;
F = P * t;

figure(1);
clf;
hold on;
axis([-2.8, 2.8, -0.5, 1.2]);
plot(X, F, 'g-');
plot(x, y, 'bo');
