#include <iostream>
using namespace std;

int main() {
    int size;

    cout << "Enter size of array: ";
    cin >> size;

   
    int *arr = new int[size];

    
    cout << "Enter " << size << " integers:" << endl;
    for (int i = 0; i < size; i++) {
        cin >> *(arr + i);
    }

    
    cout << "\nValues and their addresses:\n";
    for (int i = 0; i < size; i++) {
        cout << "Value: " << *(arr + i)
             << " | Address: " << (arr + i) << endl;
    }

    
    delete[] arr;

    cout << "\nMemory freed successfully!" << endl;

    return 0;
}

