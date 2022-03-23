function[result] = computeTwoArgs(N, Distr)

        %COMPUTETWOARGS function compute the random points either with
        %               uniform style or gaussian style

        if(N < 1)
            error('Your number must be greater than 0')
        end

        switch Distr
            case "uniform"
                result = rand(2, N);
            case "gaussian"
                result = randn(2, N);
            otherwise
                error("Wrong argument! Please, enter correct string")
        end
    end