#3 reglas para calcular area de la curva de la distribución normal usando 4 cifras y el dibujo

f<-function(x){
  return (1/sqrt(2*pi)*exp(-x^2/2))
}

right<-function(inicio, final, particiones){
  sum=0
  x=seq(inicio, final, length=particiones)
  cat("x(i-1)  | x(i)     | f(x(i))  | Área\n")
  for(i in 2:length(x)){
    s=f(x[i])*(x[i]-x[i-1])
    sum=sum+s
    rect(x[i-1], 0, x[i], f(x[i]), border="blue")
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f(x[i]),4),nsmall=4), " | ", format(round(s,4),nsmall=4), "\n")
  }
  cat("El área bajo la curva en el intervalo [", inicio, ", ", final, "] con ", particiones, " particiones es: ", format(round(sum,4), nsmall=4))
}

left<-function(inicio, final, particiones){
  sum=0
  x=seq(inicio, final,length=particiones)
  cat("x(i-1)  | x(i)     | f(x(i))  | Área\n")
  for(i in 2:length(x)){
    s=f(x[i-1])*(x[i]-x[i-1])
    sum=sum+s
    rect(x[i-1], 0, x[i], f(x[i-1]), border="green")
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f(x[i]),4),nsmall=4), " | ", format(round(s,4),nsmall=4), "\n")
  }
  cat("El área bajo la curva en el intervalo [", inicio, ", ", final, "] con ", particiones, " particiones es: ", format(round(sum,4), nsmall=4))
}

midpoint<-function(inicio, final, particiones){
  sum=0
  x=seq(inicio, final,length=particiones)
  cat("x(i-1)  | x(i)     | f(x(i))  | Área\n")
  for(i in 2:length(x)){
    s=f((x[i]+x[i-1])/2)*(x[i]-x[i-1])
    sum=sum+s
    rect(x[i-1], 0, x[i], f((x[i]+x[i-1])/2), border="purple")
    cat(format(round(x[i-1],4),nsmall=4), " | ", format(round(x[i],4),nsmall=4), " | ", format(round(f(x[i]),4),nsmall=4), " | ", format(round(s,4),nsmall=4), "\n")
  }
  cat("El área bajo la curva en el intervalo [", inicio, ", ", final, "] con ", particiones, " particiones es: ", format(round(sum,4), nsmall=4))
}

#Curva distribución normal
x=seq(-4,4,length=100)
#y=dnorm(x,mean=0,sd=1)
y=f(x)
plot(x,y,type="l",lwd=1,col="red")
cat("x      |y    \n")
for( i in 1:length(x)){
  cat(format(round(x[i], 4), nsmall = 4), " | ", format(round(f(x[i]),4), nsmall=4), "\n")
}
