#include <iostream>
using namespace std;
int main(){
	int a=10;
	int *p=&a;

	cout<<"The value of a is "<<a<<endl;
	cout<<"The address of a: "<<&a<<endl;
	cout <<"Pointer p holds:"<<p<<endl;
	cout<<"value pointed at p:"<<*p<<endl;
	return 0;
}

