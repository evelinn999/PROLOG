#include "validacion.h"
#include <stack>


validador::validador(const std::string &input_string){
    
    for (char character : input_string){
        if (character == '(' || character == ')'){
            this->tokens.push_back(character);
        }
    }
}


bool validador::is_valid(){

    if (tokens.size() == 0){
        return false;
    }


    std::stack<char> pila;

    for (char caracter : tokens) {

        if (caracter == '(') {
            pila.push(caracter);

        }else{
            if (pila.empty()) {
                return false; 
            }
            pila.pop();
        }
    }

    return pila.empty();
}

std::vector <char> validador::get_tokens(){
    return this->tokens;
}
