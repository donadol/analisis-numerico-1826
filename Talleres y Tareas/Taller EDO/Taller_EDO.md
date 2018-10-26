# Taller de Ecuaciones Diferenciales Ordinarias
## Elaborado por: Laura Donado y Jhonny Parra


1. Considere un cuerpo con temperatura interna 𝑇 el cual se encuentra en un ambiente con temperatura constante 𝑇𝑒. Suponga que su masa 𝑚 concentrada en un solo punto. Entonces la transferencia de calor entre el cuerpo y el entorno externo puede
ser descrita con la ley de Stefan-Boltzmann:

![imagen](https://latex.codecogs.com/png.latex?%5Cbg_white%20v%5Cleft%28t%5Cright%29%5C%3A%3D%5C%3A%5Cepsilon%20%5Cgamma%20S%5Cleft%28T%5E4%5Cleft%28t%5Cright%29-Te%5E4%5Cright%29)




Solución:
Con y=0.5

Codigo en R:
´´´ R

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
´´´

|x     | y       | 
| ------------ | ------------ | 
|   0      | 180.0000
|  10      | 189.2440
|  20      | 194.5765
|  30      | 197.3757
|  40      | 198.7590
|  50      | 199.4200
|  60      | 199.7304
|  70      | 199.8751
|  80      | 199.9422
|  90      | 199.9732
| 100      | 199.9876
| 110      | 199.9943
| 120      | 199.9974
| 130      | 199.9988
| 140      | 199.9994
| 150      | 199.9997
| 160      | 199.9999
| 170      | 199.9999
| 180      | 200.0000
| 190      | 200.0000
| 200      | 200.0000


Grafica:

![imagen](https://github.com/donadol/analisis_numerico_1826/blob/master/Talleres%20y%20Tareas/Taller%20EDO/Euler%20punto%201.png?raw=true)
