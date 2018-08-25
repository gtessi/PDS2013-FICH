function x = Ilineal(t)
    va=abs(t);
    if va<1
        x=1-va;
    else
        x=0;
    end
end