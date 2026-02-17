% primeHunter.m
%
% Determines primality of input values using modular arithmetic
%
% Functionality:
%    - determining primality of single values
%    - finding all primes smaller than input value
%    - finding all primes in a range of values
%    - reports total amount of time for calculations
%
% Author: Nehemiah Chavers

function prime = primeHunter(num, sequential)

tic % Begin timekeeping

if mod(num,1) == 0 && mod(sequential,1) == 0 && num > -1 && sequential > -1 % Determines if input values are positive integers

    if sequential == 0 % First mode, used for single values
    
        prime = true; % Assume input is always prime
    
        if mod(num,2) == 0 && num > 2 || num < 2 % Reject even values greater than 2 or values less than 2
    
            prime = false; 
    
        elseif mod(num,2) ~= 0 % Proceed with modular arithmetic if input is odd
    
            for A = 2:num-1
        
                if mod(num,A) == 0 % Reject if number is divisible by any integer other than 1 or itself
        
                    prime = false;
        
                    break % Stop calculation if above condition is satisfied (further calculations uneccessary if so) 
        
                end
        
            end
    
        end
    
    elseif sequential == 1 % Initiate second mode
    
        D = true(1,num); % Create logical mask of trues
    
        P = 1:num; % Create 1xnum vector of all integers from 1 to num
    
        for C = num:-1:1 % Work backwards from num to 1
    
            if mod(C,2) == 0 && C ~= 2 || C == 1 % Set Cth index of D to false if even and not equal to 2 or less than 2
    
                D(C) = false;
    
            elseif mod(C,2) ~= 0 % Continue with modular arithmetic
    
                for A = 2:C-1
        
                    B = C/A;
        
                    if mod(B,1) == 0 % Set Cth index of D to false if divisible by any integer other than 1 or itself
        
                        D(C) = false;
    
                        break % Stop calculation if above condition triggers
    
                    end
    
                end
    
            end
    
        end
    
        primes = P(D); % Mask out prime numbers
    
        prime = struct('Primes', cell(1,length(primes))); % Preallocate structure array
    
        for J = 1:length(primes)
    
            prime(J).Primes = primes(J); % Place elements of P into structure
    
        end
    
    elseif sequential > 1 && sequential < num % Initiate third mode only if sequential is greater than 1 and less than num
    
        P = sequential:num; % Generate vector of integers from sequential to num

        D = true(1,length(P)); % Generate logical vector of trues from 1 to length of P
    
        for C = length(P):-1:1
    
            if mod(P(C),2) == 0 && P(C) ~= 2 % Set Cth index of D to false if even and not equal to 2
    
                D(C) = false;
    
            elseif mod(P(C),2) ~= 0 % Continue with modular arithimetic if odd
    
                for A = 2:P(C)-1
        
                    B = P(C)/A;
        
                    if mod(B,1) == 0 % Set Cth index of D to false if divisible by any integer other than 1 or itself
        
                        D(C) = false;
    
                        break % Stop calculation if above condition is satisfied
    
                    end
    
                end
    
            end
    
        end
    
        primes = P(D); % Mask out primes
    
        prime = struct('Primes', cell(1,length(primes))); % Preallocate structure array
    
        for J = 1:length(primes)
    
            prime(J).Primes = primes(J); % Place each prime in structure array
    
        end

    elseif sequential > 1 && sequential >= num % Error if sequential is greater than num

        prime = 'The first input must be greater than 1 and larger than the second input to create a valid range of integers.';
    
    end

else, prime = 'You can''t prime hunt a number that''s not a positive integer.'; % Only positive integers can be prime by definition

end

toc % Display total calculation time

end

% Note: this function can only handle input values reliably below 2^53 due to 
% floating point representation, beyond which integers are not given unique 
% identities, so the function may return false even if the inputs are actually prime.