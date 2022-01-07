#include <iostream>
#include <cstdlib>

void   CordicMachine(double input_X,double input_Y,double input_Z);
double ConvertToRadian(double degree);

int main() {

    std::cout << "Please Enter X,Y,Z Respectively" << std::endl;
    double input_X;
    double input_Y;
    double input_Z;
    std::cin >> input_X >> input_Y >> input_Z;

    system("Color 02");
    std::cout << "CORDIC Machine Run ..." << std::endl;

    CordicMachine(input_X,input_Y,ConvertToRadian(input_Z));

    return 0;
}

void CordicMachine(double input_X,double input_Y,double input_Z){

    int fractionalNumber = 30;
    int iterationNumber = 0;

    double output_X = 0;
    double output_Y = 0;
    double output_Z = 0;

    double K = pow(2,0.5);
    int Zsign;

    bool X_inputCheckPrecise;
    bool Y_inputCheckPrecise;
    bool Z_inputCheckPrecise;


    while ( true ){

        X_inputCheckPrecise = (abs(output_X -  input_X) > pow(0.5,fractionalNumber));
        Y_inputCheckPrecise = (abs(output_Y -  input_Y) > pow(0.5,fractionalNumber));
        Z_inputCheckPrecise = (abs(output_Z -  input_Z)  > pow(0.5,fractionalNumber));

        if(X_inputCheckPrecise || Y_inputCheckPrecise || Z_inputCheckPrecise){

          if (iterationNumber > 0){
              input_X  = output_X;
              input_Y = output_Y;
              input_Z  = output_Z;
          }

          if (input_Z < 0)
             Zsign = -1;
          else
              Zsign = 1;

          double iterationPower = pow(0.5,iterationNumber);
          output_X = input_X  - (Zsign * input_Y * iterationPower );
          output_Y = input_Y + (Zsign * input_X  *  iterationPower );
          output_Z = input_Z  - (Zsign * atan(iterationPower));

          iterationNumber ++;

        } else break;
    }


    for (int i = 1; i < iterationNumber; ++i) {
       K *=  pow((1 + pow(0.25,i)),0.5);
    }


    std::cout.precision(10);
    system("Color 06");
    std::cout << "\t\tK: " <<  K << std::endl;
    std::cout << "\t\titerationNumber: " <<  iterationNumber << std::endl;
    std::cout << "\t\toutput_X: " <<  output_X << std::endl;
    std::cout << "\t\toutput_Y: " <<  output_Y << std::endl;
    std::cout << "\t\toutput_Z: " <<  output_Z << std::endl;
}

double ConvertToRadian(double degree)
{
    double pi = 3.14159265359;
    return (degree * (pi / 180));
}