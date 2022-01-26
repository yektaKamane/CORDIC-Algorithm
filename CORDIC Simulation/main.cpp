#include <vector>
#include <string>
#include "Os/OS.h"
#include "CordicMachine/CordicMachine.h"

int main() {

    std::vector<std::string> processData;
    std::string special_data;
    std::ifstream inputFile("../Test/process_inputs.csv");

    OS system;
    system.Read_Record_From_CSV(inputFile,processData);

    CordicMachine MyCordicMachine;

    double X_input;
    double Y_input;
    double Z_input;

    for (int input = 1; input <= 5 ; ++input) {

        X_input = stod(system.tokenize(processData[input], 0, ','));
        Y_input = stod(system.tokenize(processData[input], 1, ','));
        Z_input = stod(system.tokenize(processData[input], 2, ','));

        MyCordicMachine.cordic_calculate(X_input,Y_input,CordicMachine::ConvertToRadian(Z_input));
        MyCordicMachine.print_cordic_result();
    }

    return 0;
}
