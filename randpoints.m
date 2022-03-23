function[result] = randpoints(N,Distr,U,V)

    %RANDPOINTS function compute 2xN matrix with some random numbers
    %           depending on the arguments
    %
    %   One argument:   all numbers uniformly distributed in the
    %                   interval [0, 1] make matrix 2xN
    %
    %   Two arguments:  same as one argument, but user can choose the way
    %                   of computing numbers
    %       'uniform'  - normal computing with rand 
    %       'gaussian' - computing with randn instead of rand
    %
    %   Four arguments:  the user withing arg 3 and arg 4 can specify parameters to be used in
    %                    the generation of the coordinates.
    %       'uniform'  - in two last args user can choose an interval [X1, Y1] [X2, Y2]
    %       'gaussian' - in two last args user can choose the mean and
    %                    standard deviation for x and y coordinates [meanX,
    %                    devX], [meanY,devY]


    switch nargin
        case 0
            error('No arguments! Please, enter correct number of arguments!')
        case 1
            if(N < 1)
                error('Your number must be greater than 0')
            end
            result = rand(2, N);
        case 2
            result = computeTwoArgs(N, Distr);
        case 4
            result = computeFourArgs(N, Distr, U, V);
        otherwise
            error('Bad number of arguments! Please, enter correct number of arguments!')
    end
end