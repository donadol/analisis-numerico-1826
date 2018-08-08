#include <iostream>
#include<stdio.h>
#include<cmath>
#include <iomanip> 

using namespace std;

double f (double x);
double v (double x);
int main()
{
    double a, b, c, d, e;
    double precision=0.00000001;
    double raiz;
    int iteracion=1;
     cout<<fixed;
    cout<<setprecision(8);
    cout<<"Ingrese a del intervalo [a, b] para realizar la cuatriseccion: ";
    cin>>a;
    cout<<"Ingrese b del intervalo [a, b] para realizar la cuatriseccion: ";
    cin>>b;
    if (f(a)*f(b)>0){
        cout<<"El intervalo dado no contiene la raiz."<<endl;
        return 0;
    }
    while (true){
       
        cout<<"|"<<iteracion<<"|";
        c=(b+3*a)/4;
        d=(b+a)/2;
        e=(3*b+a)/4;
        
        cout<<c<<"|";
        cout<<f(c)<<"|";
        if (abs(f(c))<=precision){
            raiz=c;
            break;
        }
        cout<<d<<"|";
        cout<<f(d)<<"|";
        if (abs(f(d))<=precision){
            raiz=d;
            break;
        }
        
        cout<<e<<"|";
        cout<<f(e)<<"|"<<endl;
        if (abs(f(e))<=precision){
            raiz=e;
            break;
        }            
        
        if (f(a)*f(c)<0)
            b=c;
        if (f(c)*f(d)<0){
            a=c;
            b=d;
        }
        if (f(d)*f(e)<0){
            a=d;
            b=e;
        }
        if (f(e)*f(b)<0)
            a=e;  
        iteracion++;        
    }
    
    cout<<endl<<"La raiz es: "<<raiz<<endl;
    cout<<endl<<"El volumen seria: "<<v(raiz);
    
    return 0;
}

double f (double x){
    return 768*x-112*pow (x, 2)+4*pow (x,3)-1000;
}

double v (double x){
    return (32-2*x)*(24-2*x)*x;
}
