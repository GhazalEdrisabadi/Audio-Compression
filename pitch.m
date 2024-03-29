% min_freq = 80;
% max_freq = 300;
% 
% period_max = round(fs / min_freq);
% period_min = round(fs / max_freq);

function pitch_period = pitch(y, fs)

clear pitch_period;

% Total data points in 2ms of "x"
% Min period of a female voice frame = 2ms
% Max period of a male voice frame = 20ms
period_min = round (fs .* 2e-3);                                      
period_max = round (fs .* 20e-3);   

R = xcorr(y);
% R_max is the peak of "R", R_mid = (index of R_max) = the midpoint of "R"
[R_max , R_mid] = max(R);                          
pitch_per_range = R ( R_mid + period_min : R_mid + period_max );
[R_max, R_mid] = max(pitch_per_range);
pitch_period = R_mid + period_min;
