cmake_minimum_required(VERSION 3.19)
project(CORDIC_Simulation)

set(CMAKE_CXX_STANDARD 14)

add_executable(CORDIC_Simulation main.cpp  CordicMachine/CordicMachine.cpp Os/OS.cpp)