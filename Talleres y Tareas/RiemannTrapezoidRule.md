# Tarea de métodos númericos para integración: Calcular el área entre dos curvas por medio de la regla del trapecio
## Elaborado por: Laura Donado y Jhonny Parra


## Descripción del problema:

Encontrar una aproximación del área entre dos curva en un intervalo dado usando la regla del trapecio con cuatro cifras de presición.

## Regla del trapecio:

En matemáticas, la regla del trapecio es un método para calcular aproximadamente el valor de una integral definida mediante una suma finita. 
La regla se basa en aproximar el valor de la integral de f(x) por el de la función lineal, que pasa a través de los puntos (a, f(a)) y (b, f(b)).
Sea f(x) una función continua en [a, b], y sea un conjunto finito de puntos {x0, x1, x2,...xn} tales que a= x0<x1<x2...<xn = b.
consideramos la partición de este intervalo P=  {[x0, x1), [x1, x2), ... [xn-1, xn]}.



## Solución e implementación en R:
### Área entre las dos curvas
```r

f<-function(x){
  #x^3-9*x
  return(sin(x))
}

g<-function(x){
  #9-x^2
  return(cos(x))
}
 
trapezoid<-function(inicio, final, particiones){
  graficarFcn(inicio-1, final+1, .1)
  h=(final-inicio)/particiones
  x=seq(inicio, final, length=particiones+1)
  sum=0
  cat("x(i-1)      |  x(i)        |  f(x(i-1))   |  f(x(i))     |  g(x(i-1))   |  g(x(i))     |  Área\n")
  for(i in 2:length(x)){
    if(abs(f(x[i-1]))>abs(g(x[i-1]))){
      b1=abs(f(x[i-1]))-abs(g(x[i-1]))
    }
    else{
      b1=-abs(f(x[i-1]))+abs(g(x[i-1]))
    }
    if(abs(f(x[i]))>abs(g(x[i]))){
      b2=abs(f(x[i]))-abs(g(x[i]))
    }
    else{
      b2=-abs(f(x[i]))+abs(g(x[i]))
    }
    A=h/2*(b1+b2)
    sum=sum+A
    segments(x[i-1], f(x[i-1]), x[i-1], g(x[i-1]))
    segments(x[i], f(x[i]), x[i], g(x[i]))
    segments(x[i-1], f(x[i-1]), x[i], f(x[i]))
    segments(x[i-1], g(x[i-1]), x[i], g(x[i]))
    cat(format(round(x[i-1],8),nsmall=8), " | ", format(round(x[i],8),nsmall=8), " | ", format(round(f(x[i-1]),8),nsmall=8), " | ", format(round(f(x[i]),8),nsmall=8)," | ", format(round(g(x[i-1]),8),nsmall=8), " | ", format(round(g(x[i]),8),nsmall=8), " | ", format(round(A,8),nsmall=8), "\n")
  }
  cat("El área entre las dos curvas es: ", sum, "\n")
} 
graficarFcn<-function(inicio, final, pasos){
  x<-seq(inicio, final, pasos)
  plot(x, f(x), col="blue",type = "l")
  lines(x, g(x), col="red", type = "l")
}
```


A continuación, las salidas obtenidas con el intervalo [-pi/2, pi/2] usando diez particiones:

#### Con trapezoid(0, pi/2, 10):
|x(i-1)   | x(i)      | f(x(i-1))  | f(x(i))  | g(x(i-1))  | g(x(i))  | Área|
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|0.00000000  |  0.15707963  |  0.00000000  |  0.15643447  |  1.00000000  |  0.98768834  |  0.14382634 |
|0.15707963  |  0.31415927  |  0.15643447  |  0.30901699  |  0.98768834  |  0.95105652  |  0.11571219 |
|0.31415927  |  0.47123890  |  0.30901699  |  0.45399050  |  0.95105652  |  0.89100652  |  0.08474882 |
|0.47123890  |  0.62831853  |  0.45399050  |  0.58778525  |  0.89100652  |  0.80901699  |  0.05169866 |
|0.62831853  |  0.78539816  |  0.58778525  |  0.70710678  |  0.80901699  |  0.70710678  |  0.01737550 |
|0.78539816  |  0.94247780  |  0.70710678  |  0.80901699  |  0.70710678  |  0.58778525  |  0.01737550 |
|0.94247780  |  1.09955743  |  0.80901699  |  0.89100652  |  0.58778525  |  0.45399050  |  0.05169866 |
|1.09955743  |  1.25663706  |  0.89100652  |  0.95105652  |  0.45399050  |  0.30901699  |  0.08474882 |
|1.25663706  |  1.41371669  |  0.95105652  |  0.98768834  |  0.30901699  |  0.15643447  |  0.11571219 |
|1.41371669  |  1.57079633  |  0.98768834  |  1.00000000  |  0.15643447  |  0.00000000  |  0.14382634  |


![trapezoid](https://github.com/donadol/analisis_numerico_1826/blob/master/Talleres%20y%20Tareas/trapezoid.png)
