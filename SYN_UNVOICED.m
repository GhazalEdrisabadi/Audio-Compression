
function syn_y1 = SYN_UNVOICED(aCoeff, gain, frame_length, b);

wn = randn(1, frame_length);
syn_y2 = filter(1, [1 aCoeff((b + 1) : (b + 1 + 9))], wn);
syn_y1 = syn_y2 .* gain(b);