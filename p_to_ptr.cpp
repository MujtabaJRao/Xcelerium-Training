#include <iostream>
using namespace std;

int main() {
    int a = 10;        // normal variable
    int *p = &a;       // pointer to int (points to 'a')
    int **pp = &p;     // pointer to pointer (points to 'p')

    cout << "Value of a: " << a << endl;
    cout << "Address of a: " << &a << endl;

    cout << "\nValue of p (address of a): " << p << endl;
    cout << "Address of p: " << &p << endl;
    cout << "Value pointed by p (*p): " << *p << endl;

    cout << "\nValue of pp (address of p): " << pp << endl;
    cout << "Address of pp: " << &pp << endl;
    cout << "Value pointed by pp (*pp): " << *pp << endl;
    cout << "Value pointed by *pp (**pp): " << **pp << endl;

    return 0;
}

