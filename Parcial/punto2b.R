f<-function(x){
  return(log(x+2))
}
g<-function(x){
  return(sin(x))
}
Punto2<-function(x0,x1,precision){
  x2=0
  if(f(x0)*f(x1)<0){
    while(TRUE){
      x2=x1-f(x1)/(f(x1)-f(x0))*(x1-x0)
      if(f(x2)*f(x1)<0){
        x2=x1
        x1=x0
      }
      else{
        x2=x1
        x0=x0
      }
      cat ("|", x0, "|",x1, "|", x2,"|","\n")
      
      if (x2<=precision)   break
    }
    cat ("El punto de interseccion es ",x2,"\n")
  }
  else{
    print("No se puede realizar el metodo en el intervalo dado")
  }
}
