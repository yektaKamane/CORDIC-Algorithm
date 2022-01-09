#pragma once
#include <iostream>
#include <fstream>
#include <vector>
#include <string>

class OS{
    public:
        void Read_Record_From_CSV(std::ifstream & ,std::vector<std::string>&);
        std::string tokenize(std::string& , int , char);
        void Print_Process_Data(const std::vector<std::string>&);
};