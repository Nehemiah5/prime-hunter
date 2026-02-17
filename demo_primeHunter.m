%% Demo: primeHunter
% Demonstrates capabilities of primeHunter function

%% Single Value

% Case when prime:

number = 4679;

prime1 = primeHunter(number, 0)

pause(1)

% Case when not prime

number = 4680;

prime2 = primeHunter(number, 0)

pause(1)

%% All Primes Less Than or Equal to Input

number = 311;

primeStruct1 = primeHunter(number, 1)

pause(1)

%% All Primes in A Range of Values

upperValue = 300;

lowerValue = 90;

primeStruct2 = primeHunter(upperValue, lowerValue)

pause(1)

% Note that the upper value must be larger than the lower value, otherwise
% you will receive the following message:

primeError1 = primeHunter(upperValue, 1000)

pause(1)

%% If Input Values are not Positive or Integers

P = 90.3;

R = 44.03;

I = -60;

M = -80;

primeError2 = primeHunter(P,R)

pause(1)

primeError3 = primeHunter(I,M)