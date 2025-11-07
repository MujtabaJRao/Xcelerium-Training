#include <iostream>
using namespace std;

int main() {
    int size;              
    cout << "Enter size of array: ";
    cin >> size;

    
    int *arr = new int[size];

    
    cout << "Enter " << size << " integers:\n";
    for (int i = 0; i < size; i++) {
        cin >> arr[i];
    }

    
    cout << "\nYou entered: ";
    for (int i = 0; i < size; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    
    delete[] arr;

    return 0;
}

