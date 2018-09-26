f<-function(x0){
  return(x0*exp(x0))
}

f1<-function(x0,h0){
  return((1/(2*h0))*(-3*f(x0)+4*f(x0+h0)-f(x0+2*h0)))
}

f2<-function(x0,h0){
  return((1/(2*h0))*(f(x0+h0)-f(x0-h0)))
}

evaluar<-function(fcn,x){
  return(eval(fcn))
}

x=c(1.8, 1.9, 2.0, 2.1, 2.2)
h=c(0.1, 0.01, 0.001, 0.0001)
y<-character()
y1<-character()
y2<-character()
der<-character()

for (x0 in x){
  y<-c(y,f(x0))
}

cat("x | f(x)\n")
for(i in 1:length(x)){
  cat(x[i], " | ", y[i], "\n")
}

#formula 4.4
for(i in 1:length(x)){
  y1<-c(y1, f1(x[i],h[1]))
}

cat("Con aproximación 4.4\n")
cat("x | f'(x)\n")
for(i in 1:length(x)){
  cat(x[i], " | ", y1[i], "\n")
}

#formula 4.5
for(i in 1:length(x)){
  y2<-c(y2, f2(x[i],h[1]))
}

cat("Con aproximación 4.5\n")
cat("x | f'(x)\n")
for(i in 1:length(x)){
  cat(x[i], " | ", y2[i], "\n")
}

#Error
d=Deriv(expression(x*exp(x)), "x")
cat("Error con 4.4\n")
cat("x | f'(x) | error\n")
for(i in 1:length(x)){
  cat(x[i], " | ", y1[i], " | ", abs(y1[i]-evaluar(d,x[i])))
}
