import math

def g(x):
  return ((1+math.exp(x))/5)

def error(x):
  return abs((g(x)-x)/g(x))*100

print('Ecuación a resolver: g(x)=(1+e^x)/5 en el intervalo [0,1]')
print('Ingrese x para aproximación inicial:')
x=float(input('x='))
print('     x   g(x) Error%')
for i in range(5):
  x=round(x,4)
  e=round(error(x),4)
  print(repr(x).ljust(6,'0'),format(g(x),'.4g'), repr(e).ljust(6,'0'))
  x=g(x)
