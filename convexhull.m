function[H] = convexhull(P)

    %CONVEXHULL function compute Convex Hull with points given in the P
    %           argument.
    %
    %           Function will show error if the argument is not 2xN
    %           matrice.

    [rows, ~] = size(P);
    if rows ~= 2       
         error('Wrong! Inputs must be 2xN matrix')
    end

    X = P(1, :); 
    Y = P(2, :);
    plot(X, Y, '.'), hold on

    Imax = find(X == max(X));
    [~, indexOfMaxY] = max(P(2, Imax));

    I = Imax(indexOfMaxY);
    I0 = I;

    H = I;
    angle = 1.57;

    function[index, newAngle] = computeMinAngle(I, angle)
        X0 = P(1, I);
        Y0 = P(2, I);
    
        xSub = X - X0;
        ySub = Y - Y0;
    
        result = atan2(ySub, xSub);
        result2 = result - angle;
        DA = mod(result2, 2*pi);
        DA(I) = 2*pi;
    
        DAmin = min(DA); 
        newAngle = angle + DAmin;
        Imin = find(DA == DAmin);   
                                   
        Xmin = P(1,Imin); 
        Ymin = P(2,Imin);
    
    
        D2 = (Xmin-X0).^2+(Ymin-Y0).^2;
        [~,Perm] = sort(D2);
        index = Imin(Perm);
        
    end

    while(true)
        [score, newAngle] = computeMinAngle(I, angle);
        angle = newAngle;
        nmax = length(score);
        n = 1;
        if nmax == 1
            H(end + 1) = score;
        else
            while n <= nmax
                H(end + 1) = score(n);
                n = n + 1;
            end
        end 
        I = score(nmax);
        if score == I0 
            break
        end
    end
    for o = 1:length(H)
        plot(X(H), Y(H), '-')
    end 
end
    

 