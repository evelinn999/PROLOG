#include <vector>
#include <string>
#include <optional> 

class validador{
private:
    std::vector <char> tokens;
public:
    validador(const std::string &input_string);

    bool is_valid();

    std::vector <char> get_tokens();
    
};