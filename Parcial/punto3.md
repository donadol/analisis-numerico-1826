```r
#Programación Lineal Binaria aplicando el método aditivo de Egon Balas: Por Laura Donado y Jhonny Parra
#2018
#Entradas:
#z: función objetivo
#n: número de variables
#restriccionesIzquierda: arreglo con la parte izquierda de las restricciones
#restriccionesSigno: arreglo con los signos de las restricciones
#restriccionesDerecha: arreglo con la parte derecha de las restricciones
#Un ejemplo de entrada es: ProgramacionLinealBinaria (expression(8*X1+7*X2+6*X3+5*X4+5*X5), 5, c(expression(-6*X1-3*X2+2*X3-4*X4-X5+3), expression(-4*X1-5*X2-4*X3-3*X4+3*X5+7)), c("<=","<="), c(0,0))
ProgramacionLinealBinaria<-function(z, n, restriccionesIzquierda, restriccionesSigno, restriccionesDerecha){
  
  
  menorZ=0
  infactibilidadMenor=10000000000
  iMenor=0
  iMenores=c()
  zOptimo=10000000000
  hayZOptimo=0
  solucionesMaximas=2^n
  numeroSolucion=1
  for(i in 1:n){     #Se crea el conjunto de variables Xi
    assign(paste("X", i, sep = ""), 0)    
    assign(paste("SX", i, sep = ""), 0) 
  }
  
  while(numeroSolucion<=solucionesMaximas){ #El límite del algoritmo corresponde a la soluciones máximas posibles del problema.
    if (numeroSolucion==1)
      inicio=0
    else
      inicio=1
    for (i in inicio:n){
      
      infactibilidad=0
      
      for (m in 1:n){        #Se va asignando alternativamente el valor de 1 a cada variable
        if (!(m %in% iMenores))
          assign(paste("X", m, sep = ""), 0)
        if (m==i)
          assign(paste("X", m, sep = ""), 1)
      }
      
      
      numeroSolucion=numeroSolucion+1
      for (j in 1:length(restriccionesIzquierda)){ #Para cada una de las restricciones a las que está sujeta el problema
        valorIzquierda=eval(restriccionesIzquierda[j]) #Se evalua la restricción
        cat(i,"   ", j, "   ",valorIzquierda, "|||     ")
        for (m in 1:n){
          cat(get(paste("X", m, sep = "")), " ")
        }
        cat ("\n")
        if (!eval (  parse(text=paste(valorIzquierda, restriccionesSigno[j],restriccionesDerecha[j]))  )){ #En caso de que no se cumpla se calcula la infactibilidad
          infactibilidad=infactibilidad+abs(valorIzquierda-restriccionesDerecha[j])
        }
      }
      if (infactibilidad!=0){   #Si la solución no es factible se busca la menor infactibilidad en la iteración
        if (infactibilidad<=infactibilidadMenor){
          iMenor=i
          infactibilidadMenor=infactibilidad
        }
      }
      else{     #Si la solución es factible se busca el Z menor (Z óptimo) de la iteración
        hayZOptimo=1
        posibleZ=eval(z)
        if (posibleZ<=zOptimo){
          zOptimo=posibleZ
          for (m in 1:n){
            assign(paste("SX", m, sep = ""), get(paste("X", m, sep = ""))) 
          }
        }
      }
    }
    assign(paste("X", iMenor, sep = ""), 1)
    iMenores [length(iMenores)+1]=iMenor;
    if (hayZOptimo) #En caso de que en la iteración haya un Z optimo el algoritmo ha terminado
      break
  }
  
  cat ("El Z optimo es ", zOptimo, " con   ")  #Se imprime el Z optimo y el valor que toman las variables Xi
  for (m in 1:n){
    cat(paste("X", m, sep = ""), "=", get(paste("SX", m, sep = "")), " ")
  }
}
```


> ProgramacionLinealBinaria (expression(X1+0.645*X2), 2, c(expression(-50*X1-31*X2-169),expression(3*X1-2*X2-5),expression(-X1+1)), c("<=","<=","<="), c(0,0,0))  
0     1     -169 |||     0  0  
0     2     -5 |||     0  0  
0     3     1 |||     0  0  
1     1     -219 |||     1  0  
1     2     -2 |||     1  0  
1     3     0 |||     1  0  
2     1     -200 |||     0  1  
2     2     -7 |||     0  1  
2     3     1 |||     0  1  
El Z optimo es  1  con   X1 = 1  X2 = 0 
