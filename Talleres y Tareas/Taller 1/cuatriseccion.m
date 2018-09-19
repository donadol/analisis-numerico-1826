syms x;
eqnstr=input('Ingrese su función: ','s');
eqn(x)=str2sym(eqnstr);
xlstr=input('Ingrese el límite menor para la cuatrisección: ','s');
xhstr=input('Ingrese el límite superior para la cuatrisección: ','s');
xl=str2double(xlstr);
xh=str2double(xhstr);
found=false;
xr1ol=0;
xr2ol=0;
xr3ol=0;
if eqn(xl)*eqn(xh)<0
    fprintf('aa          bb           ppm1           ppm2          ppm3            err1          err2             err3\n');
    while found==false
        xr1=xl+(xh-xl)/4;
        xr2=xl+(xh-xl)/2;
        xr3=xl+(xh-xl)*3/4;
        fprintf('%f     %f      %f      %f      %f     %f     %f       %f\n',xl,xh,xr1,xr2,xr3,abs(xr1-xr1ol),abs(xr2-xr2ol),abs(xr3-xr3ol));
        if eqn(xl)*eqn(xr1)<0
            xh=xr1;
        elseif eqn(xr1)*eqn(xr2)<0
            xl=xr1;
            xh=xr2;
        elseif eqn(xr2)*eqn(xr3)<0
            xl=xr2;
            xh=xr3;
        elseif eqn(xr3)*eqn(xh)<0
            xl=xr3;
        end
        xr1ol=xr1;
        xr2ol=xr2;
        xr3ol=xr3;
        if abs(eqn(xl)*eqn(xh))<0.000000001
            found=true;
            if eqn(xl)<0.001
                answer=xl;
            else
                answer=xh;
            end
        end
    end
    figure('units','normalized','outerposition',[0 0 1 1]);
    fplot(eqn);
    grid
    xlabel('x','FontSize',14);
    ylabel('y','FontSize',14);
    title('Ecuación','FontSize',18);
    ax=gca;
    ax.XAxisLocation='origin';
    ax.YAxisLocation='origin';
    ax.Children.Color=[1 0 1];
    ax.Children.LineWidth=2;
    answer
else
    disp('Los límites deben ser de signo contrario');
end
