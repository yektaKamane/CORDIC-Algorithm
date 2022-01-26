#include "CordicMachine.h"


int    CordicMachine::getFractionalNumber() const {
    return fractional_number;
}

int    CordicMachine::getIterationNumber() const {
    return iteration_number;
}

void   CordicMachine::setIterationNumber(int iterationNumber) {
    iteration_number = iterationNumber;
}

int    CordicMachine::getZsign() const {
    return Zsign;
}

void   CordicMachine::setZsign(int zsign) {
    Zsign = zsign;
}

double CordicMachine::getK() const {
    return K;
}

void   CordicMachine::setK(double k) {
    K = k;
}

double CordicMachine::getOutputX() const {
    return output_X;
}

double CordicMachine::getOutputY() const {
    return output_Y;
}

double CordicMachine::getOutputZ() const {
    return output_Z;
}

void   CordicMachine::setOutputX(double outputX) {
    output_X = outputX;
}

void   CordicMachine::setOutputY(double outputY) {
    output_Y = outputY;
}

void   CordicMachine::setOutputZ(double outputZ) {
    output_Z = outputZ;
}

bool   CordicMachine::isXInputCheckPrecise() const {
    return X_inputCheckPrecise;
}

bool   CordicMachine::isYInputCheckPrecise() const {
    return Y_inputCheckPrecise;
}

bool   CordicMachine::isZInputCheckPrecise() const {
    return Z_inputCheckPrecise;
}

void   CordicMachine::setXInputCheckPrecise(bool xInputCheckPrecise) {
    X_inputCheckPrecise = xInputCheckPrecise;
}

void   CordicMachine::setYInputCheckPrecise(bool yInputCheckPrecise) {
    Y_inputCheckPrecise = yInputCheckPrecise;
}

void   CordicMachine::setZInputCheckPrecise(bool zInputCheckPrecise) {
    Z_inputCheckPrecise = zInputCheckPrecise;
}

void   CordicMachine::cordic_calculate(double input_X,double input_Y,double input_Z) {

    while (true) {

        setXInputCheckPrecise( (abs(getOutputX() - input_X) > pow(0.5, getFractionalNumber())) );
        setYInputCheckPrecise( (abs(getOutputY() - input_Y) > pow(0.5, getFractionalNumber())) );
        setZInputCheckPrecise( (abs(getOutputZ() - input_Z) > pow(0.5, getFractionalNumber())) );

        if (isXInputCheckPrecise() || isYInputCheckPrecise() || isZInputCheckPrecise()) {

            if (getIterationNumber() > 0) {
                input_X = getOutputX();
                input_Y = getOutputY();
                input_Z = getOutputZ();
            }

            if (input_Z < 0)
                setZsign(-1);
            else
                setZsign(1);

            double iterationPower = pow(0.5, getIterationNumber());
            setOutputX(input_X - (getZsign() * input_Y * iterationPower));
            setOutputY(input_Y + (getZsign() * input_X * iterationPower));
            setOutputZ(input_Z - (getZsign() * atan(iterationPower)));

            setIterationNumber((getIterationNumber()) + 1);

        }
        else
            break;

    }

        Constant_K_Calculate();

}

double CordicMachine::ConvertToRadian(double degree) {
    double pi = 3.14159265359;
    return (degree * (pi / 180));
}

void   CordicMachine::Constant_K_Calculate() {
    for (int i = 1; i < getIterationNumber(); ++i) {
        setK( getK() * pow((1 + pow(0.25, i)), 0.5) );
    }

}

void   CordicMachine::print_cordic_result() const {

    std::cout << "CORDIC Machine Run " << std::endl;

    std::cout.precision(10);
    std::cout << "\t\tK: " <<  getK()    << std::endl;
    std::cout << "\t\titerationNumber: " <<  getIterationNumber() << std::endl;
    std::cout << "\t\toutput_X: " <<  getOutputX() / getK() << std::endl;
    std::cout << "\t\toutput_Y: " <<  getOutputY() / getK() << std::endl;
    std::cout << "\t\toutput_Z: " <<  getOutputZ() << std::endl;

    std::cout << "###############################################" << std::endl;
}


