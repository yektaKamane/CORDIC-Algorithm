#pragma once
#include <iostream>
#include <cstdlib>

class CordicMachine {

    private:

        int fractional_number = 29;
        int iteration_number = 0;

        int Zsign{};
        double K = pow(2,0.5);

        bool X_inputCheckPrecise{};
        bool Y_inputCheckPrecise{};
        bool Z_inputCheckPrecise{};


        double output_X = 0;
        double output_Y = 0;
        double output_Z = 0;


    public:

        void setK(double k);

        void    setIterationNumber(int iterationNumber);

        void setXInputCheckPrecise(bool xInputCheckPrecise);
        void setYInputCheckPrecise(bool yInputCheckPrecise);
        void setZInputCheckPrecise(bool zInputCheckPrecise);

        int    getFractionalNumber() const;
        int    getIterationNumber() const;

        int    getZsign() const;
        void   setZsign(int zsign);

        void setOutputX(double outputX);
        void setOutputY(double outputY);
        void setOutputZ(double outputZ);

        double getK() const;

        static double ConvertToRadian(double degree);

        double getOutputX() const;
        double getOutputY() const;
        double getOutputZ() const;

        bool   isXInputCheckPrecise() const;
        bool   isYInputCheckPrecise() const;
        bool   isZInputCheckPrecise() const;

        void   cordic_calculate(double input_X,double input_Y,double input_Z);

        void  Constant_K_Calculate();

        void   print_cordic_result() const;


};
