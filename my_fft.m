% FFT
u = rand(N,1);

tic
v = my_fft(u);
toc;

function v = my_fft(u)
    N = length(u);
    WN = exp(2*pi*i/N);
    v = zeros(N,1);
    
    if N==2
        v = [1, 1;1, WN]*u;
    else
        veven = my_fft(u(1:2:N));
        vodd  = my_fft(u(2:2:N));
        M = N/2;
        Wj = 1;
        for j = 0:(M-1)
            v(j+1) = veven(j+1) + Wj*vodd(j+1);
            v(M+j+1) = veven(j+1) - Wj*vodd(j+1);
            Wj = Wj*WN;
        end
    end
end