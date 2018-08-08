# Taller 1: Métodos Numéricos
## Presentado por: Jhonny Parra y Laura Donado
- ### Punto número 1
**Descripción del problema:** Evaluar el polinomio en cada valor indicado y el número de operaciones mínimo para hacerlo, para el siguiente polinomio junto con su derivada.  
![ecuacion](http://latex.codecogs.com/gif.latex?P%28x%29%20%3D%207x%5E5%20&plus;%206x%5E4%20-%206x%5E3%20&plus;%203x%20-4%2C%20x_%7B0%7D%20%3D%203)  
**Planteamiento del problema:** Para hallar la solución se utilizó el siguiente código, el cual esta basado en el propuesto en el taller añadiendo el cálculo del número de operaciónes mínimas realizadas. Para dicho cálculo, se tiene en cuenta que una división es un amultiplicación, una multiplicación son varias sumas y una suma es una operación.  
``` c++
#include <iostream>
#include <cmath>

using namespace std;

double horner(double p[], int n, double x, int &o){
  double y=p[0];
  for(int i=1; i<n; i++){
    if(x<y)
      o+=x;
    else
      o+=y;
    o++;
    y=x*y+p[i];
  }
  return y;
}
double eval(double p[], int n, double x, int &o){
  double s=0;
  for(int i=0; i<n; i++){
    o++;
    if(pow(x, n-i-1)<p[i])
      o+=pow(x, n-i-1);
    else
     o+=p[i];
    s=s+p[i]*pow(x, n-i-1);
  }
  return s;
}
int derivate(double p[], int n){
  for(int i=0; i<n; i++)
    p[i]=p[i]*(n-i-1);
  n--;
  return n;
}
void printFcn(double p[], int n){
  for(int i=0; i<n; i++){
    if(p[i]!=0){
      cout<<p[i];
      if((n-i-1)!=0)
        cout<<"x^"<<n-i-1;
    if(i<n-1)
      cout<<" + ";
    }
  }
}
int main() {
  double p[]={7,6,-6,0,3,-4};
  int n=sizeof(p)/sizeof(double);
  double x=3;
  int o=0;
  cout<<"La funcion a resolver es: "<<endl;
  printFcn(p,n);
  cout<<endl<<endl;
  cout<<"Resultado por metodo de Horner: "<<horner(p,n,x,o)<<" con "<<o<<" operaciones"<<endl;
  o=0;
  cout<<"Resultado evaluacion normal: "<<eval(p,n,x,o)<<" con "<<o<<" operaciones"<<endl<<endl;
  cout<<"Derivando se obtiene: "<<endl;
  n=derivate(p,n);
  printFcn(p,n);
  cout<<endl<<endl;
  o=0;
  cout<<"Resultado por metodo de Horner: "<<horner(p,n,x,o)<<" con "  <<o<<" operaciones"<<endl;
  o=0;
  cout<<"Resultado evaluacion normal: "<<eval(p,n,x,o)<<" con "  <<o<<" operaciones"<<endl;
  return 0;
}
```
Con lo cual se obtuvo:  
La funcion a resolver es: 7x^5 + 6x^4 + -6x^3 + 3x^1 + -4  
Resultado por metodo de Horner: 2030 con 20 operaciones  
Resultado evaluacion normal: 2030 con 12 operaciones  
  
Derivando se obtiene: 35x^4 + 24x^3 + -18x^2 + 3  
Resultado por metodo de Horner: 3324 con 16 operaciones  
Resultado evaluacion normal: 3324 con 47 operaciones 

- ### Punto número 5
**Descripción del problema:** Calcule la propagación del error dado por las operaciones aritméticas, para el siguiente problema  
**Problema:** La velocidad de una partícula es constante e igual a 4 m/s, medida con un error de 0.1 m/s durante un tiempo de recorrido de 5 seg. medido con error de 0.1 seg. Determine el error absoluto y el error relativo en el valor de la distancia recorrida.  
Se tiene:  
v = 4, Ev = 0.1 (Velocidad)  
t = 5, Et = 0.1 (Tiempo)  
d = vt (Distancia recorrida)  
**Planteamiento del problema:** Para el cálculo del error absoluto se utiliza como valor teorico v = 4 y t = 5, con lo que se obtiene d = 20  
Para hallar la solución del se utilizó el siguiente código. 
``` python
v=4;
ev=0.1;
t=5;
et=0.1;
rta=v*t;
vi=v-ev;
ti=t-et;
print('Vel Time Distance   Ea   Er')
while vi<=v+ev:
  d=round(vi*ti,2)
  ea=round(abs(d-rta),2)
  er=round(ea/rta*100,2)
  print(repr(vi).rjust(3), repr(ti).rjust(4), repr(d).rjust(8), repr(ea).ljust(4,'0'), repr(er).ljust(4,'0'))
  ti+=et
  if ti>t+et:
    ti=t-et
    vi+=ev
```
Con lo cual se obtuvo:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/error.png)

- ### Punto número 11
**Descripción del problema:** Método de Muller.  
**Planteamiento del problema:** El método de Muller consiste en obtener los coeficientes de la parábola que pasa por tres puntos. Dichos coeficientes se sustituyen en la fórmula cuadratica para tener el valor donde la parabola corta con el eje x, es decir la raiz.  
Se escribe la ecuación de la parábola de la siguiente manera:  
![ecuacion](http://latex.codecogs.com/gif.latex?f%28x%29%20%3D%20a%28x-x_%7B2%7D%29%5E2&plus;b%28x-x_%7B2%7D%29%20&plus;%20c)  
Se quiere que esta parábola pase por tres puntos:  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Bx_%7B0%7D%2C%20f%28x_%7B0%7D%29%5D%2C%20%5Bx_%7B1%7D%2C%20f%28x_%7B1%7D%29%5D%2C%20%5Bx_%7B2%7D%2C%20f%28x_%7B2%7D%29%5D)  
Para determinar los coeficientes a, b y c, se sustituyen en la fórmula cuadrática. Se obtiene:  
(1) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B0%7D%29%20%3D%20a%28x_%7B0%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B0%7D-x_%7B2%7D%29%20&plus;%20c)  
(2) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B1%7D%29%20%3D%20a%28x_%7B1%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B1%7D-x_%7B2%7D%29%20&plus;%20c)  
(3) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B2%7D%29%20%3D%20a%28x_%7B2%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B2%7D-x_%7B2%7D%29%20&plus;%20c)  
Al evaluar en x2, se obtiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B2%7D%29%3Dc)  
Este valor se sustituye en las ecuaciones (1) y (2), con lo cual se obtiene  
(4) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B0%7D%29-f%28x_%7B2%7D%29%3Da%28x_%7B0%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B0%7D-x_%7B2%7D%29)  
(5) ![ecuacion](http://latex.codecogs.com/gif.latex?f%28x_%7B1%7D%29-f%28x_%7B2%7D%29%3Da%28x_%7B1%7D-x_%7B2%7D%29%5E2&plus;b%28x_%7B1%7D-x_%7B2%7D%29)  
Para calcular a y b, se establecen las siguientes relaciones:  
![ecuacion](http://latex.codecogs.com/gif.latex?h_%7B0%7D%3Dx_%7B1%7D-x_%7B0%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?h_%7B1%7D%3Dx_%7B2%7D-x_%7B1%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Cdelta%20_%7B0%7D%3D%5Ctfrac%7Bf%28x_%7B1%7D%29-f%28x_%7B0%7D%29%7D%7Bx_%7B1%7D-x_%7B0%7D%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?%5Cdelta%20_%7B1%7D%3D%5Ctfrac%7Bf%28x_%7B2%7D%29-f%28x_%7B1%7D%29%7D%7Bx_%7B2%7D-x_%7B1%7D%7D)  
Lo anterior se remplaza en (4) y (5), y se obtiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?b%28h_%7B0%7D&plus;h_%7B1%7D%29-a%28h_%7B0%7D&plus;h_%7B1%7D%29%5E2%3Dh_%7B0%7D%5Cdelta%7B0%7D&plus;h_%7B1%7D%5Cdelta%7B1%7D)  
De lo anterior se despeja a y b. Por ende, se tiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?a%3D%5Cfrac%7B%5Cdelta_%7B1%7D-%5Cdelta_%7B0%7D%7D%7Bh_%7B1%7D&plus;h_%7B0%7D%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?b%3Dah_%7B1%7D&plus;%5Cdelta_%7B1%7D)  
![ecuacion](http://latex.codecogs.com/gif.latex?c%3Df%28x_%7B2%7D%29)  
Luego de encontrar los coeficientes, se remplazan en la ecuación cuadrática para determinar el valor de la raíz
![ecuacion](http://latex.codecogs.com/gif.latex?x_%7B3%7D%3Dx_%7B2%7D&plus;%5Cfrac%7B-2c%7D%7Bb%5Cpm%20%5Csqrt%7Bb%5E2-4ac%7D%7D)  
Para la implementación de dicho método se utilizó el siguiente código:  
``` python
import cmath
def f(x):
 return pow(x,3)-13*x-12
 #16*pow(x,4)-40*pow(x,3)+5*pow(x,2)+20*x+6
def muller(x0,x1,x2,tol,n):
  i=0
  print('Iter  X')
  while i<n:
    h1=x1-x0
    h2=x2-x1
    d1=(f(x1)-f(x0))/h1
    d2=(f(x2)-f(x1))/h2
    a=(d2-d1)/(h2+h1)
    b=d2+h2*a
    D=cmath.sqrt(b*b-4*f(x2)*a)
    if abs(b-D)<abs(b+D):
      E=b+D
    else: 
      E=b-D
    h=-2*f(x2)/E
    p=x2+h
    print(repr(i).ljust(5), p.real)
    if abs(h)<tol:
      print(f'El metodo concluyo satisfactoriamente despues de {i+1} iteraciones, solucion: {p.real}')
      return
    else:
      x0=x1
      x1=x2
      x2=p
      i+=1
  print(f'El metodo fracaso despues de {n} iteraciones')
  return


x0=float(input('Ingrese x0:'))
x1=float(input('Ingrese x1:'))
x2=float(input('Ingrese x2:'))

tol=float(input('Ingrese la tolerancia:'))
n=int(input('Ingrese número máximo de iteraciones:'))
muller(x0,x1,x2,tol,n)
```
Con lo cual se obtuvo:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/muller.png)

- ### Punto número 15
**Problema:** Se propone resolver la ecuación ![ecuacion](http://latex.codecogs.com/gif.latex?%5Cint_%7B0%7D%5E%7Bx%7D%20%285-e%5Eu%29du%3D2) con el método del punto fijo.  
a) Obtenga la ecuación f(x)=0 resolviendo la integral.  
b) Mediante un gráfico aproximado, o evaluando directamente, localice las raíces reales.  
c) Proponga una ecuación equivalente x=g(x) y determine el intervalo de convergencia para calcular una de las dos raíces.  
d) Del intervalo anterior, elija un valor inicial y realice 5 iteraciones. En cada iteración verifique que se cumple la condición de convergencia del punto fijo y estime el error de truncamiento en el último resultado.  
**Solución:**  
a) Al resolver la integral se obtiene:  
![ecuacion](http://latex.codecogs.com/gif.latex?f%28x%29%3D5x-e%5Ex-1)  
b) Las raíces reales obtenidas son:
![ecuacion](http://latex.codecogs.com/gif.latex?x_%7B0%7D%3D0.54488%2C%20x_%7B1%7D%3D2.39614)  
Lo cuales se pueden observar en la siguiente gráfica:  
![Gráfica raíces reales](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/grafica_punto_fijo.png)  
Se escoge la raíz ![ecuacion](http://latex.codecogs.com/gif.latex?x_%7B0%7D%3D0.54488) para el procedimiento  
c) Para la ecuación equivalente x=g(x) se tienen las siguientes opciones:  
(1) ![ecuacion](http://latex.codecogs.com/gif.latex?x%3Dln%285x-1%29)  
(2) ![ecuacion](http://latex.codecogs.com/gif.latex?g_%7B1%7D%28x%29%3Dln%285x-1%29)  
Para elegir la ecuación a utilizar se derivan y se ve si cumple la condición de convergencia del punto fijo, es decir que sea menor que 1 en magnitud.  
(3)  ![ecuacion](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bd%20g_%7B0%7D%28x%29%7D%7Bdx%7D%3D%5Cfrac%7Be%5Ex%7D%7B5%7D)  
(4)  ![ecuacion](http://latex.codecogs.com/gif.latex?%5Cfrac%7Bd%20g_%7B1%7D%28x%29%7D%7Bdx%7D%3D%5Cfrac%7B5%7D%7B5x-1%7D)  
Donde (3) corresponde a la derivada de (1), y (3) de (2).  
Al evaluarlas en x=0.5, se obtuvo:  
![ecuacion](http://latex.codecogs.com/gif.latex?g_%7B0%7D%280.5%29%3D0.3297%2C%20g_%7B1%7D%280.5%29%3D3.3333)  
Como se observa, la única que cumple la condición de convergencia es ![ecuacion](http://latex.codecogs.com/gif.latex?g_%7B0%7D%28x%29), por lo cual es la escogida para resolver la ecuación.  
d) Para la solución se utilizó el siguiente código:
``` python
import math

def g(x):
  return ((1+math.exp(x))/5)

def error(x):
  return abs((g(x)-x)/g(x))*100

def dg(x):
  return math.exp(x)/5
  
print('Ecuación a resolver: g(x)=(1+e^x)/5 en el intervalo [0,1]')
print('Ingrese x para aproximación inicial:')
x=float(input('x='))
print('     x   g(x) Error%')
for i in range(5):
  x=round(x,4)
  e=round(error(x),4)
  if abs(dg(x))<1:
    z='Cumple criterio de convergencia del punto fijo'
  print(repr(x).ljust(6,'0'),format(g(x),'.4g'), repr(e).ljust(6,'0'), z)
  x=g(x)
```
Con lo cual se obtuvo:  
![Salida del código](https://github.com/donadol/analisis_numerico_1826/blob/master/Trabajo%20en%20pareja%201/punto_fijo.png)

## Bibliografía
[Método de Muller y ejercicios](https://prezi.com/ihj_vsqouxcb/metodo-de-muller-y-ejercicios/)
