% Name:        rk
% Author:      Parker Ottaway
% Date:        31 March 2018
% Class:       MAT276 Tu,Th 1:00pm-2:40pm
% Description: Runge-Kutta method for solving
%              initial value differential equations.

% Input parameters:
% x  = Starting x value (beginning of interval).
% xf = Ending x value (end of interval).
% [x,xf]
% y  = Initial y value.
% n  = Number of steps in interval.

% Output:
% X = column vector for x values used.
% Y = column vector for y values found using x values.
function[] = rk(x,xf,y,n)
h = (xf - x) / n;               % Calculates step size.
X = x;                          % Puts first x in X column vector.
Y = y;                          % Puts first y in Y column vector.
for i = 1:n                     % loop that repeats the number n of steps
    k1 = f(x,y);                % Calculates left-hand slope.
    k2 = f(x+h/2,y+h*k1/2);     % Finds first midpoint of slope.
    k3 = f(x+h/2,y+h*k2/2);     % Finds second midpoint of slope.
    k4 = f(x+h,y+h*k3);         % Calculates right-hand slope.
    k  = (k1+2*k2+2*k3+k4)/6;   % Finds average slope.
    y = y + h * k;              % Adds step amount to y.
    x= x + h;                   % Adds step amount to x.
    X = [X;x];                  % Adds x to bottom of X column vector.
    Y = [Y;y];                  % Adds y to bottom of Y column vector.
end                             % Exits for loop after n repetitions.
fprintf('%8.14f %8.14f\n',[X,Y]'); % Transposes matricies and prints.