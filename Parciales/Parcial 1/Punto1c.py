#Asumiento n>0
#En la primera columna de la tabla se observa el n utilizado para sumar hasta el n^2,
#en la segunda el número de operaciones necesarias y en la tercera el resultado de la suma
n=int(input("ingrese n: "))
print("  n #op   s")
i=1
lim=(n**2)
op=0
s=0
while i <= lim:
  s+=i**2
  op+=i
  print(repr(i).rjust(3), repr(op).rjust(3), repr(s).rjust(3))
  i+=1
