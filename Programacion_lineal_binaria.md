# Programación Lineal Binaria
### Presentado por: Laura Donado y Jhonny Parra
## Método Aditivo de Egon Balas

## Descripción formal 

Un problema de programación lineal es un problema de minimizar o maximizar una función lineal sujeta a restricciones lineales del tipo desigualdad, igualdad o ambas. 

Sea Z una función objetivo a minimizar de la forma:

![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5Csum%20%5C%3Aci%5Ccdot%20Xi%5C%3A)

Donde todos los ci con coeficientes no negativos.

Para ello se debe tener en cuenta que:

1. La función objetivo se minimiza, en caso de maximización, use la regla de equivalencia: Max(Z)=Min(-Z)
2. Se requiere que ![ecuacion](https://latex.codecogs.com/gif.latex?C_%7Bj%7D%5Cgeq%200%2C%20%5Cforall%20j), donde ![ecuacion](https://latex.codecogs.com/gif.latex?C_%7Bj%7D) son los coeficientes de las restricciones. En caso que no se cumpla, entonces ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D) se sustituye por: ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D%3D1-%5Cbar%7BX_%7Bj%7D%7D), es decir ![ecuacion](https://latex.codecogs.com/gif.latex?%5Cbar%7BX_%7Bj%7D%7D) es el complemento.  
3. Infactibilidad hace referencia a que tan lejos esta una solución de satisfacer una restricción.
**Nota:** El cambio de variable también se debe aplicar a las restricciones.  

con ![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20X1%2C%5C%3AX2%2C%5C%3AX3...%5C%3AXn) variables independientes que pueden tomar únicamente valores de 0 y 1. Sujeta a restricciones de la forma:

![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5Csum%20%5C%3Aai%5Ccdot%20Xi%5C%3A%5Cle%20%5C%3Abi)

![imagen](http://latex.codecogs.com/gif.latex?%5Cbg_white%20%5Csum%20%5C%3Aai%5Ccdot%20Xi%5C%3A%5Cge%20%5C%3Abi)


El método aditivo de Egon Balas se basa en que si se tiene una función objetivo minimizando y todos sus términos son positivos, entonces, entre menos variables tomen el valor de uno (1), la función objetiva será mínima.

### Algoritmo
Entrada: 
* __Z:__ Función objetivo.  
* __R:__ Vector con ecuaciones de restricción.   
Salida:
* __Z*:__ Solución óptima factible. 
* __X:__ Vector con valores para las variables.   
   
Se debe tener en cuenta:  
1. La función objetivo se minimiza, en caso de maximización, use la regla de equivalencia: Max(Z)=Min(-Z)
2. Se requiere que ![ecuacion](https://latex.codecogs.com/gif.latex?C_%7Bj%7D%5Cgeq%200%2C%20%5Cforall%20j), donde ![ecuacion](https://latex.codecogs.com/gif.latex?C_%7Bj%7D) son los coeficientes de las restricciones. En caso que no se cumpla, entonces ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D) se sustituye por: ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D%3D1-%5Cbar%7BX_%7Bj%7D%7D), es decir ![ecuacion](https://latex.codecogs.com/gif.latex?%5Cbar%7BX_%7Bj%7D%7D) es el complemento.  
3. Infactibilidad hace referencia a que tan lejos esta una solución de satisfacer una restricción.
**Nota:** El cambio de variable también se debe aplicar a las restricciones.  
   
Pseudocódigo:
1. Inicializar todas las variables en 0. ![ecuacion](https://latex.codecogs.com/gif.latex?X_%7Bj%7D%20%3D%200%2C%20%5Cforall%20j)
2. Evaluar cada restrición.
3. Asignar 

- Deducción de la formula (Manera inductiva dos ecuaciones, n ecuaciones)
- Metodo en R (Con comentarios)
## Bibliografia
[Programación Lineal entera y binaria](https://es.slideshare.net/jaimemedrano771/programacin-lineal-entera-y-binaria)

