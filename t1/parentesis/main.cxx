#include "validacion.h"
#include <iostream>

int main(){

    validador ENTRADA_A("(( ))) (( )");
    validador ENTRADA_B("(( )) ( )( ) )");
    validador ENTRADA_C("( ) ( )) (( ))");
    validador ENTRADA_D("((( ))) ( ) ( )a");

    std::cout<<"A) ";
    ENTRADA_A.is_valid()? std::cout<<"Es valido\n": std::cout<<"No es valido\n";
    
    
    for (char a : ENTRADA_D.get_tokens()){
        std::cout<<a;
    }

    std::cout<<"\n";

    std::cout<<"B) ";
    ENTRADA_B.is_valid()? std::cout<<"Es valido\n": std::cout<<"No es valido\n";

    std::cout<<"C) ";
    ENTRADA_C.is_valid()? std::cout<<"Es valido\n": std::cout<<"No es valido\n";

    std::cout<<"D) ";
    ENTRADA_D.is_valid()? std::cout<<"Es valido\n": std::cout<<"No es valido\n";



    return 0;
}