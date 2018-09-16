
require(pracma)


#PUNTOS DEL PATO VOLADOOOR:

# Perfil superior
 xi = c(0.9, 1.3, 1.9,  2.1, 2.6, 3.0, 3.9, 4.4,  4.7,  5,   6.0,  7.0, 8.0,  9.2,  10.5, 11.3, 11.6, 12.0, 12.6, 13.0, 13.3,
# Perfil inferior cabeza
        0.817, 0.897, 1.022, 1.191, 1.510, 1.834, 2.264, 2.962, 3.624, 4.202, 4.499, 4.779, 5.109, 5.527,
# Perfil ala superior
        4.659, 4.865, 5.085, 5.261, 5.387, 5.478, 5.527,
# Perfil ala inferior
        4.659, 4.750, 4.990, 5.289, 5.560, 5.839, 6.113, 6.606, 6.916, 7.305, 7.563, 7.802, 7.983,
# Perfil inferior posterior
        8.141, 8.473, 8.832, 9.337, 9.887, 10.572, 10.995, 11.501, 11.923, 12.364, 12.763, 13.300)

 
 
# Perfil superior 
 yi = c(1.3, 1.5, 1.85, 2.1, 2.6, 2.7, 2.4, 2.15, 2.05, 2.1, 2.25, 2.3, 2.25, 1.95, 1.4,  0.9,  0.7,  0.6,  0.5,  0.4,  0.25,
# Perfil inferior cabeza    
        1.180, 1.065, 1.023, 1.010, 1.032, 1.085, 1.192, 1.115, 1.087, 1.100, 0.830, 0.608, 0.350, 0.106,
# Perfil ala superior
        -5.161, -4.741, -3.933, -2.951, -1.970, -0.981, 0.106,
# Perfil ala inferior
        -5.161, -5.259, -5.284, -5.268, -5.161, -4.982, -4.769, -4.286, -3.911, -3.213, -2.670, -2.176, -1.655,
# Perfil inferior posterior
        -1.138, -0.434, -0.514, -0.494, -0.382, -0.005, -0.090, -0.085, -0.030, 0.093, 0.120, 0.250)


 #Grafica de los puntos
 plot(xi,yi, pch=20, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Patito")
 
 
 #Grafica perfil superior
  xi0 = xi[1:6] #PUNTOS QUE TOMA PARA LA INTERPOLACIÓN
  yi0 = yi[1:6]
  x0 = seq(xi[1], xi[6], len=100) #PUNTOS A INTERPOLAR (HACE 100 INTERPOLACIONES PARA QUE LA GRAFICA QUEDE SUAVE JAJA) (AJA PODEMOS REDUCIRLO)
  y0 = barylag(xi0, yi0, x0) #CALCULA LAS X0 INTERPOLACIONES Y LAS ALMACENA EN Y0
  lines (x0, y0, col="blue") #GRAFICA LOS 100 PUNTOS INTERPOLADOS EN UNA LINEA CON COLOR AZUL
  
  xi1 = xi[6:8]
  yi1 = yi[6:8]
  x1 <- seq(xi[6], xi[8], len=100)
  y1 <- barylag(xi1, yi1, x1)
  lines(x1, y1, col="blue")
  
  xi2 = xi[8:10]
  yi2 = yi[8:10]
  x2 <- seq(xi[8], xi[10], len=100)
  y2 <- barylag(xi2, yi2, x2)
  lines(x2, y2, col="blue")
  
  #Hasta 19 se arruina
  xi3 = xi[10:18]
  yi3 = yi[10:18]
  x3 <- seq(xi[10], xi[18], len=100)
  y3 <- barylag(xi3, yi3, x3)
  lines(x3, y3, col="blue")
  
  xi3 = xi[18:21]
  yi3 = yi[18:21]
  x3 <- seq(xi[18], xi[21], len=100)
  y3 <- barylag(xi3, yi3, x3)
  lines(x3, y3, col="blue")
  
 #Grafica perfil inferior cabeza
  
  #con 26?
  xi4 = xi[22:25]
  yi4 = yi[22:25]
  x4 <- seq(xi[22], xi[25], len=100)
  y4 <- barylag(xi4, yi4, x4)
  lines(x4, y4, col="blue")
  
  xi5 = xi[25:28]
  yi5 = yi[25:28]
  x5 <- seq(xi[25], xi[28], len=100)
  y5 <- barylag(xi5, yi5, x5)
  lines(x5, y5, col="blue")
  
  xi6 = xi[28:31]
  yi6 = yi[28:31]
  x6 <- seq(xi[28], xi[31], len=100)
  y6 <- barylag(xi6, yi6, x6)
  lines(x6, y6, col="blue")
  
  xi7 = xi[31:35]
  yi7 = yi[31:35]
  x7 <- seq(xi[31], xi[35], len=100)
  y7 <- barylag(xi7, yi7, x7)
  lines(x7, y7, col="blue")
  
#Grafica perfil ala superior
  
  xi8 = xi[36:41]
  yi8 = yi[36:41]
  x8 <- seq(xi[36], xi[41], len=100)
  y8 <- barylag(xi8, yi8, x8)
  lines(x8, y8, col="blue")
  
  xi9 = xi[41:42]
  yi9 = yi[41:42]
  x9 <- seq(xi[41], xi[42], len=100)
  y9 <- barylag(xi9, yi9, x9)
  lines(x9, y9, col="blue")
  
#Grafica perfil ala inferior
  
  xi10 = xi[43:56]
  yi10 = yi[43:56]
  x10 <- seq(xi[43], xi[56], len=100)
  y10 <- barylag(xi10, yi10, x10)
  lines(x10, y10, col="blue")
  
  xi11 = xi[56:57]
  yi11 = yi[56:57]
  x11 <- seq(xi[56], xi[57], len=100)
  y11 <- barylag(xi11, yi11, x11)
  lines(x11, y11, col="blue")
  
#Grafica perfil inferior posterior
  
  xi11 = xi[57:61]
  yi11 = yi[57:61]
  x11 <- seq(xi[57], xi[61], len=100)
  y11 <- barylag(xi11, yi11, x11)
  lines(x11, y11, col="blue")
  
  xi12 = xi[61:67]
  yi12 = yi[61:67]
  x12 <- seq(xi[61], xi[67], len=100)
  y12 <- barylag(xi12, yi12, x12)
  lines(x12, y12, col="blue")
  
  
  
# TAL VEZ TOQUE LEER ALGO RELACIONADO CON LA INFLEXIÓN PARA QUE EL PROGRAMA SEPA QUE PUNTOS ELEGIR, CUANDO LOS PUNTOS HACEN UN CAMBIO BRUSCO
# AHÍ ES CUANDO YA TOCA HACER OTRO POLINOMIO, YO SÉ QUE ME ENTIENDES JAJA


  

