bps = 4;        % Bits per symbol / bits per subcarrier 16QAM
M = 2^bps;
nFrames = 1000*10000;  % number of OFDM frames
nBlocks = 2;     % number of OFDM blocks in one frame
nSymbols = 64;  % number of symbols in one block
nPilots = 8;   % number of pilot symbols
nP = nSymbols / nPilots; % pilot intervals
nFFT = nSymbols;    % Number of FFT points to sample
nCP = 16;     % cyclic prefix length in samples
SNR = 20.0;      % signal to noise ratio
clipping = 0;


% % generate pilot values
% pilotvalue = randi([0 M-1],nPilots,1);
% pilotvalue = pilotvalue.';  % turn into column
% save(strcat('Pilot',string(nPilots),'.mat'), "pilotvalue");

% load pilot values
load(strcat('Pilot',string(nPilots),'.mat'), "pilotvalue");

% load variable channel impulse responses H
load('H_data.mat', 'H'); 

input_samples = [];
input_labels = [];

symbol_bin = [0,0,0,0; 0,0,0,1; 0,0,1,0; 0,0,1,1; 
              0,1,0,0; 0,1,0,1; 0,1,1,0; 0,1,1,1; 
              1,0,0,0; 1,0,0,1; 1,0,1,0; 1,0,1,1; 
              1,1,0,0; 1,1,0,1; 1,1,1,0; 1,1,1,1];

% Generate ofdm frames
for n = 1 : nFrames
    txpilot = randi([0 M-1],nSymbols,1);
    for p = 1 : nP : nSymbols
        txpilot(p) = pilotvalue(ceil(p/nP));
    end
    txsymbols = randi([0 M-1],nSymbols,1);
    txframe = [txpilot; txsymbols];

    % add to labels
    txsymbols_bin = [];
    for j = 1 : length(txsymbols)
        txsymbols_bin = [txsymbols_bin symbol_bin(txsymbols(j)+1,:)];
    end
    input_labels = cat(1, input_labels, txsymbols_bin); 

    % OFDM processing
    txgrid = qammod(txframe,M,UnitAveragePower=true);    
    txout = ifft(txgrid,nFFT); % Pack data into OFDM symbols using IFFT    
    txout = txout(:); % Vectorise txout matrix    
    txSigOFDM = [txout(end-nCP+1:end); txout]; % Prepend cyclic prefix

    % Filter through channel
    h_cur = H(n,:);
    rxin(n,:) = cconv(txSigOFDM, h_cur); % Circular convolution with channehl h
    rxin = awgn(rxin,SNR);  % Add additive white Gaussian noise
    % channelDelay = dsp.Delay(1);    % Could use fractional delay
    % rxin = channelDelay(rxin);   % Add delay

    % rxsync = rxin(nCP+1+channelDelay.Length:end);
    rxsync = rxin(nCP+1:end); % Remove CP
    rxsync = rxsync(1:nFFT);
    rxgrid = fft(rxsync,nFFT);

    % Convert complex numbers into coordinates
    rxcoord = [];
    for k = 1 : length(rxgrid)
        z = rxgrid(k);
        rxcoord = [rxcoord real(z) imag(z)];
    end

    input_samples = cat(1, input_samples, rxcoord);
end


% disp(input_samples);
% disp(input_labels);

% Save to a .mat file
save('16QAM_8Pilots_Train.mat', 'bps', 'M', 'nFrames', ...
    'nSymbols', 'nPilots', 'nCP', 'SNR', 'clipping', ...
    "input_samples", "input_labels");

disp('done');
