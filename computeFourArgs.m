function[result] = computeFourArgs(N, Distr, U, V)

        %COMPUTEFOURARGS function compute the random points either with
        %                uniform style or gaussian style, but also with a possibility to
        %                specify parameters to be used in a generation of the coordinates

        if ~isequal(size(U), [1, 2]) || ~isequal(size(V), [1, 2])            
            error('U and V arguments should have 2 numbers each! Please, enter correct number!');
        elseif(N < 1)
            error('Your number must be greather than 0')
        end

        choice = Distr;
        switch choice
            case "uniform"
                if U(1) > V(1)  
                    error('A1 must be less than B1!');
                elseif U(2) > V(2)
                    error('A2 must be less than B2!');
                else
                    X = rand(1,N) * (V(1) - U(1)) + U(1);
                    Y = rand(1,N) * (V(2) - U(2)) + U(2);
                    result = [X; Y];
                end
            case "gaussian"
                if U(2) < 0 || V(2) < 0
                    error('Negative deviation! Please, enter correct number')
                end
                X = randn(1,N) * V(1) + U(1);
                Y = randn(1,N) * V(2) + U(2);
                result = [X; Y];
            otherwise
                error("Wrong argument! Please, enter correct string")
        end
    end
       
    