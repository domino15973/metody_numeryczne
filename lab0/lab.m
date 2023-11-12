function [y] = lab(x)
    y = zeros(1,length(x));

    for i = 1:1:length(x)
        y(i) = x(i).^2 + 1;
    end
    plot(x,y)
end