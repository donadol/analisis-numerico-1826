

#z=función objetivo
#n=número de variables
#Arreglo con la parte izquierda de las restricciones
#Arreglo con los signos de las restricciones
#Arreglo con la parte derecha de las restricciones
#Por defecto z toma valores positivos


#8X1+7X2+6X3+5X4+5X5 
#-6X1-3X2+2X3-4X4-X5+3 <= 0
#-4X1-5X2-4X3-3X4+3X5+7 <= 0
#ProgramacionLinealBinaria (expression(8*X1+7*X2+6*X3+5*X4+5*X5), 5, c(expression(-6*X1-3*X2+2*X3-4*X4-X5+3), expression(-4*X1-5*X2-4*X3-3*X4+3*X5+7)), c("<=","<="), c(0,0))
ProgramacionLinealBinaria<-function(z, n, restriccionesIzquierda, restriccionesSigno, restriccionesDerecha){
  
  
  menorZ=0
  infactibilidadMenor=100000
  iMenor<-0
  iMenores<-c()
  
  #izquierda
  #posibleZ
  zOptimo=1000000
  hayZOptimo=0
  for(i in 1:n){
    assign(paste("X", i, sep = ""), 0)    
  }
  
 
  
  while(1){
    for (i in 1:n){
      infactibilidad=0
      for (m in 1:n){
        if (!(m %in% iMenores))
          assign(paste("X", m, sep = ""), 0)
        if (m==i)
          assign(paste("X", m, sep = ""), 1)
      }
      for (j in 1:length(restriccionesIzquierda)){
        valorIzquierda=eval(restriccionesIzquierda[j])
        cat(i,"   ", j, "   ",valorIzquierda, "|||", X1, X2, X3, X4, X5, "\n")
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
        }
      }
    }
    assign(paste("X", iMenor, sep = ""), 1)
    iMenores [length(iMenores)+1]=iMenor;
    if (hayZOptimo)
      break
  }
  cat ("El Z optimo es ", zOptimo)
}



https://es.slideshare.net/jaimemedrano771/programacin-lineal-entera-y-binaria
