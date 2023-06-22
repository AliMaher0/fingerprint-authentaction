function [dp,c] = dprime(h,fA)
% a simple calculation given hit/false alarm rates
% The sensitivity index d' measures the distance between the signal and the noise means in standard deviation units.
% c is the distance of the bias criterion from the point where neither response is favored,
% also in standard units. 
% Positive c values indicate a bias towards high hit rates and false alarm rates.
% Correction of perfect rates according to 1/2N rule is included.
%   dp = dprime(h,fA) returns the d' value dp 
%   for the hit rate h and false alarm rate fA
%   h = hit rate, (0 < h < 1) 
%   fA = false alarm rate, (0 < fA < 1)
%
%   outputs: 
%   dp = d'
%   c = criterion c (negative values --> bias towards yes responses)
%
narginchk(2,2); %Validate number of input arguments
% check for values out of bounds, also issue errors or warnings if =1 or 0
if or(or(h>1,h<0),or(fA>1,fA<0))
    error('input arguments must fall in the 0 to 1 range')
% standard d' formula returns NaN or Inf results for 0 or 1 inputs,
% corrections may be required 
elseif or(or(h==1,h==0),or(fA==1,fA==0))
    warning('This function will not return finite values when h or fA = 0 or 1.')
end
% d prime rule = z(h)-z(fA)
dp = norminv(h)-norminv(fA);
% c rule = -0.5*[z(h)+z(fA)]
c = -0.5*(norminv(h)+ norminv(fA));
end
