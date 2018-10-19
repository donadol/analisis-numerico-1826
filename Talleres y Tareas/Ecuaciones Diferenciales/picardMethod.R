#Picard's method
library(pracma)

f<-function(t){t+exp(-t)}

picard<-function(fcn,a,b,y0,h){
  t<-seq(a,b,h)
  y<-c(y0)
  for(i in 2:length(t)){
    fcn1=paste(-1*y[i-1],fcn)
    eval(parse(text = paste('fcnInt <- function(t) { return(' , fcn1 , ')}', sep='')))
    y<-c(y, y0+integrate(fcnInt,a,t[i])$value)
  }
  taylor(f,0,3)
  return(y)
}

picard("+t+1", 0, 1, 1, 1/3)
