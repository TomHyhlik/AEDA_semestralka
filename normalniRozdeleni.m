function report = normalniRozdeleni(variable)

    [h,p]=kstest((variable-mean(variable))/std(variable)) 

    if p > 0.55
        report = "ANO"
%         fprintf("ANO\n")
    else
        report = "NE"
%         fprintf("NE\n")
    end

end