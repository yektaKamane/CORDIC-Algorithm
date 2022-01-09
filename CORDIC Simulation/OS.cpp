#include "OS.h"


void OS::Read_Record_From_CSV(std::ifstream &inputFile,std::vector<std::string>& data){

    std::string myline;

    if (inputFile.is_open()) {
        while (getline(inputFile,myline)) {
            data.push_back(myline);
        }
    }

}

std::string OS::tokenize(std::string& data, int index,char del)
{
    int start = 0;
    int end = data.find(del);
    int count = 0;

    while (end != -1) {
        if (count == index)
            return data.substr(start, end - start);
        count++;
        start = end + 1;
        end = data.find(del, start);
    }

    return data.substr(start, end - start);
}

void OS::Print_Process_Data(const std::vector<std::string>& data) {
    std::cout << "#################################" << std::endl;

    for (const auto& element:data)
        std::cout << element << std::endl;

    std::cout << "#################################" << std::endl;
}
