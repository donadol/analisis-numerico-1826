

#z=función objetivo
#n=número de variables
#Arreglo con la parte izquierda de las restricciones
#Arreglo con los signos de las restricciones
#Arreglo con la parte derecha de las restricciones


#8X1+7X2+6X3+5X4+5X5 
#-6X1-3X2+2X3-4X4-X5+3 <= 0
#-4X1-5X2-4X3-3X4+3X5+7 <= 0
#ProgramacionLinealBinaria (expression(8*X1+7*X2+6*X3+5*X4+5*X5), 5, c(expression(-6*X1-3*X2+2*X3-4*X4-X5+3), expression(-4*X1-5*X2-4*X3-3*X4+3*X5+7)), c("<=","<="), c(0,0))
#ProgramacionLinealBinaria (expression(100*X1+155*X2+50*X3+112*X4+70*X5+80*X6+60*X7+118*X8+110*X9+55*X10), 10, c(expression(100*X1+155*X2+50*X3+112*X4+70*X5+80*X6+60*X7+118*X8+110*X9+55*X10-700)), c("<="), c(0))
#ProgramacionLinealBinaria (expression(3*X1+2*X2+5*X3+2*X4+3*X5), 5, c(expression(-X1-X2+X3+2*X4-X5-1),expression(-7*X1+3*X3-4*X4-3*X5+2), expression(11*X1-6*X2-3*X4-3*X5+1)), c("<=", "<=", "<="), c(0, 0, 0))
ProgramacionLinealBinaria<-function(z, n, restriccionesIzquierda, restriccionesSigno, restriccionesDerecha){
  

  menorZ=0
  infactibilidadMenor=10000000000
  iMenor=0
  iMenores=c()
  
  
  zOptimo=10000000000
  hayZOptimo=0
  solucionesMaximas=2^n
  numeroSolucion=1
  for(i in 1:n){
    assign(paste("X", i, sep = ""), 0)    
    assign(paste("SX", i, sep = ""), 0) 
  }
  
  while(numeroSolucion<=solucionesMaximas){
    if (numeroSolucion==1)
      inicio=0
    else
      inicio=1
    for (i in inicio:n){
      
      infactibilidad=0
      
      for (m in 1:n){
        if (!(m %in% iMenores))
          assign(paste("X", m, sep = ""), 0)
        if (m==i)
          assign(paste("X", m, sep = ""), 1)
      }
      
      
      numeroSolucion=numeroSolucion+1
      for (j in 1:length(restriccionesIzquierda)){
        valorIzquierda=eval(restriccionesIzquierda[j])
        cat(i,"   ", j, "   ",valorIzquierda, "|||     ")
        for (m in 1:n){
          cat(get(paste("X", m, sep = "")), " ")
        }
        cat ("\n")
        if (!eval (  parse(text=paste(valorIzquierda, restriccionesSigno[j],restriccionesDerecha[j]))  )){
          infactibilidad=infactibilidad+abs(valorIzquierda-restriccionesDerecha[j])
        }
      }
      if (infactibilidad!=0){
        if (infactibilidad<=infactibilidadMenor){
          iMenor=i
          infactibilidadMenor=infactibilidad
        }
      }
      else{
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
    if (hayZOptimo)
      break
  }
  
  cat ("El Z optimo es ", zOptimo, " con   ")
  for (m in 1:n){
    cat(paste("X", m, sep = ""), "=", get(paste("SX", m, sep = "")), " ")
  }
}



https://es.slideshare.net/jaimemedrano771/programacin-lineal-entera-y-binaria
