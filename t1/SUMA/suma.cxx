#include <iostream>
#include <vector>
using namespace std;

void generarParticiones(int n, int maximo, vector<int>& actual) {
    if (n == 0) {
        for (size_t i = 0; i < actual.size(); i++) {
            if (i > 0) cout << " + ";
            cout << actual[i];
        }
        cout << endl;
        return;
    }

    for (int i = min(n, maximo); i >= 1; i--) {
        actual.push_back(i);                 
        generarParticiones(n - i, i, actual);
        actual.pop_back();                   
    }
}

int main() {
    int numero;
    cout << "Ingrese un numero: ";
    cin >> numero;

    vector<int> actual;
    generarParticiones(numero, numero, actual);

    return 0;
}
