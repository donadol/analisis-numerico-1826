
----------------------------- VERSIÓN 69 PUNTOS ---------------------------------

require(pracma)

# Perfil superior
 xi = c(0.9, 1.3, 1.9,  2.1, 2.6, 3.0, 3.9, 4.4,  4.7,  5,   6.0,  7.0, 8.0,  9.2,  10.5, 11.3, 11.6, 12.0, 12.6, 13.0, 13.3,
# Perfil inferior cabeza
        0.817, 0.897, 1.022, 1.191, 1.510, 1.834, 2.264, 2.962, 3.624, 4.202, 4.499, 4.779, 5.109, 5.527,
# Perfil ala superior
        4.659, 4.865, 5.085, 5.261, 5.387, 5.478, 5.527,
# Perfil ala inferior
        4.659, 4.750, 4.990, 5.289, 5.560, 5.839, 6.113, 6.606, 6.916, 7.305, 7.563, 7.802, 7.983,
# Perfil inferior posterior
        8.141, 8.473, 8.832, 9.337, 9.887, 10.572, 10.995, 11.501, 11.923, 12.364, 12.763, 13.300,

        0.817, 0.9)




 
 
# Perfil superior 
 yi = c(1.3, 1.5, 1.85, 2.1, 2.6, 2.7, 2.4, 2.15, 2.05, 2.1, 2.25, 2.3, 2.25, 1.95, 1.4,  0.9,  0.7,  0.6,  0.5,  0.4,  0.25,
# Perfil inferior cabeza    
        1.180, 1.065, 1.023, 1.010, 1.032, 1.085, 1.192, 1.115, 1.087, 1.100, 0.830, 0.608, 0.350, 0.106,
# Perfil ala superior
        -5.161, -4.741, -3.933, -2.951, -1.970, -0.981, 0.106,
# Perfil ala inferior
        -5.161, -5.259, -5.284, -5.268, -5.161, -4.982, -4.769, -4.286, -3.911, -3.213, -2.670, -2.176, -1.655,
# Perfil inferior posterior
        -1.138, -0.434, -0.514, -0.494, -0.382, -0.005, -0.090, -0.085, -0.030, 0.093, 0.120, 0.250,

        1.180, 1.3)


 #Grafica de los puntos
 plot(xi,yi, pch=20, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Pato")
 
 
 DibujarLinea<-function(inicio, final){
   xi0 = xi[inicio:final]
   yi0 = yi[inicio:final]
   x0 <- seq(xi[inicio], xi[final], len=20)
   y0 <- barylag(xi0, yi0, x0)
   lines(x0, y0, col="blue")
 }
 
 #Grafica perfil superior
  DibujarLinea (1, 3)
  DibujarLinea (3, 6)
  DibujarLinea (6, 9)
  DibujarLinea (9, 17)
  DibujarLinea (17, 21)
 
  
 #Grafica perfil inferior cabeza

  DibujarLinea (22, 24)
  DibujarLinea (24, 28)
  DibujarLinea (28, 31)
  DibujarLinea (31, 35)
  
#Grafica perfil ala superior
  DibujarLinea (36, 41)
  DibujarLinea (41, 42)
#Grafica perfil ala inferior
  
  DibujarLinea (43, 56)
  DibujarLinea (56, 57)

  
#Grafica perfil inferior posterior
  DibujarLinea (57, 61)
  DibujarLinea (61, 65)
  DibujarLinea (65, 67)
  
  DibujarLinea (68, 69)
  
  
--------------------------FIN VERSION 69 PUNTOS ---------------------








-------------------------VERSION 69 PUNTOS CON VERSION 44 PUNTOS ENCIMA -------------------------------


require(pracma)

# Perfil superior
xi = c(0.9, 1.3, 1.9,  2.1, 2.6, 3.0, 3.9, 4.4,  4.7,  5,   6.0,  7.0, 8.0,  9.2,  10.5, 11.3, 11.6, 12.0, 12.6, 13.0, 13.3,
       # Perfil inferior cabeza
       0.817, 0.897, 1.022, 1.191, 1.510, 1.834, 2.264, 2.962, 3.624, 4.202, 4.499, 4.779, 5.109, 5.527,
       # Perfil ala superior
       4.659, 4.865, 5.085, 5.261, 5.387, 5.478, 5.527,
       # Perfil ala inferior
       4.659, 4.750, 4.990, 5.289, 5.560, 5.839, 6.113, 6.606, 6.916, 7.305, 7.563, 7.802, 7.983,
       # Perfil inferior posterior
       8.141, 8.473, 8.832, 9.337, 9.887, 10.572, 10.995, 11.501, 11.923, 12.364, 12.763, 13.300,
       
       0.817, 0.9)






# Perfil superior 
yi = c(1.3, 1.5, 1.85, 2.1, 2.6, 2.7, 2.4, 2.15, 2.05, 2.1, 2.25, 2.3, 2.25, 1.95, 1.4,  0.9,  0.7,  0.6,  0.5,  0.4,  0.25,
       # Perfil inferior cabeza    
       1.180, 1.065, 1.023, 1.010, 1.032, 1.085, 1.192, 1.115, 1.087, 1.100, 0.830, 0.608, 0.350, 0.106,
       # Perfil ala superior
       -5.161, -4.741, -3.933, -2.951, -1.970, -0.981, 0.106,
       # Perfil ala inferior
       -5.161, -5.259, -5.284, -5.268, -5.161, -4.982, -4.769, -4.286, -3.911, -3.213, -2.670, -2.176, -1.655,
       # Perfil inferior posterior
       -1.138, -0.434, -0.514, -0.494, -0.382, -0.005, -0.090, -0.085, -0.030, 0.093, 0.120, 0.250,
       
       1.180, 1.3)


#Grafica de los puntos
plot(xi,yi, pch=20, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Pato")


DibujarLinea<-function(inicio, final){
  xi0 = xi[inicio:final]
  yi0 = yi[inicio:final]
  x0 <- seq(xi[inicio], xi[final], len=20)
  y0 <- barylag(xi0, yi0, x0)
  lines(x0, y0, col="green")
}

#Grafica perfil superior
DibujarLinea (1, 3)
DibujarLinea (3, 6)
DibujarLinea (6, 9)
DibujarLinea (9, 17)
DibujarLinea (17, 21)


#Grafica perfil inferior cabeza

DibujarLinea (22, 24)
DibujarLinea (24, 28)
DibujarLinea (28, 31)
DibujarLinea (31, 35)

#Grafica perfil ala superior
DibujarLinea (36, 41)
DibujarLinea (41, 42)
#Grafica perfil ala inferior

DibujarLinea (43, 56)
DibujarLinea (56, 57)


#Grafica perfil inferior posterior
DibujarLinea (57, 61)
DibujarLinea (61, 65)
DibujarLinea (65, 67)

DibujarLinea (68, 69)






# Perfil superior
xi = c(0.9, 1.9,  2.6, 3.0, 4.4,  4.7,   6.0, 8.0,  10.5,  11.6, 12.6, 13.0, 13.3,
       # Perfil inferior cabeza
       0.817, 1.022, 1.191,  1.834, 2.264, 2.962, 4.202, 4.779,  5.527,
       # Perfil ala superior
       4.659, 4.865,   5.478, 5.527,
       # Perfil ala inferior
       4.659, 4.750, 4.990, 5.289,  5.839,  6.606,  7.802, 7.983,
       # Perfil inferior posterior
       8.141, 8.473,  9.337, 10.572,  11.501, 12.364, 12.763, 13.300,
       
       0.817, 0.9)






# Perfil superior 
yi = c(1.3, 1.85, 2.6, 2.7, 2.15, 2.05, 2.25, 2.25, 1.4,  0.7,  0.5,  0.4,  0.25,
       # Perfil inferior cabeza    
       1.180, 1.023, 1.010,  1.085, 1.192, 1.115, 1.100, 0.608, 0.106,
       # Perfil ala superior
       -5.161, -4.741,  -0.981, 0.106,
       # Perfil ala inferior
       -5.161, -5.259, -5.284, -5.268,  -4.982,  -4.286,  -2.176, -1.655,
       # Perfil inferior posterior
       -1.138, -0.434,  -0.494,  -0.005, -0.085,  0.093, 0.120, 0.250,
       
       1.180, 1.3)


#Grafica de los puntos
points(xi, yi, pch=20, col="black")

DibujarLinea<-function(inicio, final){
  xi0 = xi[inicio:final]
  yi0 = yi[inicio:final]
  x0 <- seq(xi[inicio], xi[final], len=20)
  y0 <- barylag(xi0, yi0, x0)
  lines(x0, y0, col="blue")
}


#Grafica perfil superior
DibujarLinea (1, 2)
DibujarLinea (2, 6)
DibujarLinea (6, 10)
DibujarLinea (10, 13)
#Grafica perfil inferior cabeza

DibujarLinea (14, 16)
DibujarLinea (16, 18)
DibujarLinea (18, 20)
DibujarLinea (20, 22)

#Grafica perfil ala superior
DibujarLinea (23, 25)
DibujarLinea (25, 26)
#Grafica perfil ala inferior

DibujarLinea (27, 36)



#Grafica perfil inferior posterior
DibujarLinea (36, 38)
DibujarLinea (38, 40)
DibujarLinea (40, 42)


DibujarLinea (43, 44)



  

  

