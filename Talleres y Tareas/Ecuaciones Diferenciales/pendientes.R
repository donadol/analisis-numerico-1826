f<-function(x){
  return(2+(exp(1)-2)*exp(-x^3))
}

pendientes<-function(step){
  x<-seq(-0.1, 0.1, step)
  y<-c(f(x))
  m<-c(0)
  plot(x,y)
  cat("Con h =",step,"\n")
  cat("x1           |x2            |y1            |y2            |m    \n")
  for(i in 2:length(x)){
    cat(format(round(x[i-1],8),nsmall=8), " | ",format(round(x[i],8),nsmall=8), " | ",format(round(y[i-1],8),nsmall=8), " | ",format(round(y[i],8),nsmall=8), " | ", format(round((f(x[i])-f(x[i-1]))/step,8),nsmall=8), "\n")
  }
}
h<-c(10^-6, 10^-5, 10^-4, 10^-3, 10^-2, 10^-1)
pendientes(h[3])
