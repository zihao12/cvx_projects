
function [] = myplot()
    es = -0.5:0.2:1
    ss = zeros(size(es))
    ps = zeros(size(es))

    for i = 1:length(es)
        out = hwk5p4(es(i))
        %ss = out(1)
        ps(i) = out(2)
    end

    plot(es,ps, '*')
    xlabel('epsilon')
    ylabel('derivative of objective')
    
end