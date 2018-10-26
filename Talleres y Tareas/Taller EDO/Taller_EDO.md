# Taller de Ecuaciones Diferenciales Ordinarias
## Elaborado por: Laura Donado y Jhonny Parra


1. Considere un cuerpo con temperatura interna 𝑇 el cual se encuentra en un ambiente con temperatura constante 𝑇𝑒. Suponga que su masa 𝑚 concentrada en un solo punto. Entonces la transferencia de calor entre el cuerpo y el entorno externo puede
ser descrita con la ley de Stefan-Boltzmann:


![imagen](https://latex.codecogs.com/png.latex?%5Cbg_white%20v%5Cleft%28t%5Cright%29%5C%3A%3D%5C%3A%5Cepsilon%20%5Cgamma%20S%5Cleft%28T%5E4%5Cleft%28t%5Cright%29-Te%5E4%5Cright%29)




Solución:
Con y=0.5

Codigo en R:


```r

euler <- function(f, x0, y0, h, n) {
  x <- x0
  y <- y0
  
  for(i in 1:n) {
    y0 <- y0 + h * f(x0, y0)
    x0 <- x0 + h
    x <- c(x, x0)
    y <- c(y, y0)
  }

  graficarSolucionNumerica(x, y)
  return(data.frame("|",x = x, "|", y = y, "|"))
}



euler (function(t,T){-1.68*10^(-9) * T^4 + 2.6880 }, 0, 180, 10, 20)




graficarSolucionNumerica<-function (x, y){
  plot(x,y, pch=20, col = "blue", xlab="X", ylab="Y", main="Euler")
  for (i in 2:length(x)){
    segments(x[i-1], y[i-1], x[i], y[i], col="red")
  }
}
```


|x     | y       | 
| ------------ | ------------ | 
|   0      | 180.00000      |
|  10      | 189.24403      |
|  20      | 194.57647      |
|  30      | 197.37569      |
|  40      | 198.75899      |
|  50      | 199.41997      |
|  60      | 199.73044      |
|  70      | 199.87506      |
|  80      | 199.94217      |
|  90      | 199.97324      |
| 100      | 199.98763      |
| 110      | 199.99428      |
| 120      | 199.99735      |
| 130      | 199.99878      |
| 140      | 199.99943      |
| 150      | 199.99974      |
| 160      | 199.99988      |
| 170      | 199.99994      |
| 180      | 199.99997      |
| 190      | 199.99999      |
| 200      | 199.99999      |


Gráfica:

![imagen](https://github.com/donadol/analisis_numerico_1826/blob/master/Talleres%20y%20Tareas/Taller%20EDO/Euler%20punto%201.png?raw=true)  
  
3. Obtenga 20 puntos de la solución de la ecuación, utilizando el método de Euler (los
tres primeros términos)con h=0.1
![ecuacion](https://latex.codecogs.com/gif.latex?\frac{dy}{dx}-(x&plus;y)=1-x^{2};&space;y(0)=1))  
Grafique su solución y compare con la solución exacta, cuál es el error de truncamiento
en cada paso  
```r
options (digits=8)
library(phaseR)
f<-function(fcn,x,y){
  return(eval(fcn))
}

errorTruncamiento<-function(x,y){
  sol=x^2+x+exp(x)
  return(abs(y-sol))
}

rk3<-function(dy, ti, tf, y0, h, graficar=TRUE, numpendientes=10){
  t<-seq(ti, tf, h)
  y<-c(y0)
  error<-c(errorTruncamiento(ti,y0))
  for(i in 2:length(t)){
    k1=h*f(dy, t[i-1], y[i-1])
    k2=h*f(dy, t[i-1]+h/2, y[i-1]+k1*(0.5))
    k3=h*f(dy, t[i-1]+h, y[i-1]-k1+2*k2)
    y<-c(y, y[i-1]+1/6*(k1+4*k2+k3))
    error<-c(error,errorTruncamiento(t[i-1],y[i-1]))
  }
  if (graficar){
    graficarCampoPendiente(min(t), max(t), min(y), max(y), dy, numpendientes, "RK3")
    graficarSolucionNumerica(t, y)
  }
  return(data.frame(linea="|",x=t, linea="|",w=y, linea="|",error=error, linea="|"))
}

graficarCampoPendiente<-function(x0, xn, y0, yn, fcn, numpendientes, metodo){
  apma1 <- function(t, y, parameters){
    a <- parameters[1] 
    dy <- a*(f(fcn, t, y))
    list(dy)
  } 
  apma1.flowField <- flowField(apma1, x = c(x0, xn), 
                               y   = c(y0, yn), parameters = c(1), 
                               points = numpendientes, system = "one.dim", 
                               add = FALSE, xlab = "x", ylab = "y", 
                               main = metodo)
  grid()
}

graficarSolucionNumerica<-function (x, y){
  points (x, y, pch=20, col="blue")
  for (i in 2:length(x)){
    segments(x[i-1], y[i-1], x[i], y[i], col="red")
  }
}

rk3(expression(1-x^2+(x+y)), 0, 2, 1,0.1)
```

|x     | y       | Error Truncamiento       | 
| ------------ | ------------ |  ------------ |
| 0.0       |  1.0000000       | 0.0000000e+00       |
| 0.1       |  1.2151583       | 0.0000000e+00       |
| 0.2       |  1.4613758       | 1.2584742e-05       |
| 0.3       |  1.7398155       | 2.6940105e-05       |
| 0.4       |  2.0517628       | 4.3299322e-05       |
| 0.5       |  2.3986382       | 6.1925102e-05       |
| 0.6       |  2.7820116       | 8.3113249e-05       |
| 0.7       |  3.2036182       | 1.0719671e-04       |
| 0.8       |  3.6653753       | 1.3455014e-04       |
| 0.9       |  4.1694023       | 1.6559495e-04       |
| 1.0       |  4.7180411       | 2.0080504e-04       |
| 1.1       |  5.3138801       | 2.4071315e-04       |
| 1.2       |  5.9597798       | 2.8591801e-04       |
| 1.3       |  6.6589017       | 3.3709232e-04       |
| 1.4       |  7.4147395       | 3.9499171e-04       |
| 1.5       |  8.2311546       | 4.6046468e-04       |
| 1.6       |  9.1124144       | 5.3446386e-04       |
| 1.7       | 10.0632349       | 6.1805847e-04       |
| 1.8       | 11.0888285       | 7.1244832e-04       |
| 1.9       | 12.1949553       | 8.1897946e-04       |
| 2.0       | 13.3879814       | 9.3916166e-04       |
  
Gráfica:  
![imagen](https://github.com/donadol/analisis_numerico_1826/blob/master/Talleres%20y%20Tareas/Taller%20EDO/rk3.png?raw=true)
