#include <iostream>
#include <cmath>

using namespace std;

double horner(double p[], int n, double x){
  double y=p[0];
  for(int i=1; i<n; i++)
    y=x*y+p[i];
  return y;
}
double eval(double p[], int n, double x){
  double s=0;
  for(int i=0; i<n; i++)
    s=s+p[i]*pow(x, n-i-1);
  return s;
}

int main() {
  double p[]={7,6,-6,3,4};
  int n=sizeof(p)/sizeof(double);
  double x=3;
  cout<<"Resultado por metodo de Horner: "<<horner(p,n,x)<<endl;
  cout<<"Resultado: "<<eval(p,n,x);
}
