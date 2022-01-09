#include <iostream>
#include <vector>
#include <string>
#include "OS.h"
#include "CordicMachine.h"

int main() {

    std::vector<std::string> processData;
    std::string special_data;
    std::ifstream inputFile("../process_inputs.csv");

    OS system;
    system.Read_Record_From_CSV(inputFile,processData);
//    system.Print_Process_Data(processData);
//    special_data = system.tokenize(processData[2],2,',');
//    std::cout << special_data << std::endl;

    CordicMachine MyCordicMachine;

    double X_input = stod(system.tokenize(processData[1],0,','));
    double Y_input = stod(system.tokenize(processData[1],1,','));
    double Z_input = stod(system.tokenize(processData[1],2,','));


    MyCordicMachine.cordic_calculate(X_input,Y_input,MyCordicMachine.ConvertToRadian(Z_input));
    MyCordicMachine.print_cordic_result();

    return 0;
}
