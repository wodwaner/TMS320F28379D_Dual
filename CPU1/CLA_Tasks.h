#ifndef _CLA_H_
#define _CLA_H_

#include "F2837xD_Cla_defines.h"
#include "CLAmath.h"
#include "F28x_Project.h"     // Device Headerfile and Examples Include File


//========== Shared variables, define as extern.... ==========
extern uint16_t counter_CLA1;
extern float seno;
extern float theta_CLA1;
//=============== CLA Tasks ====================
__interrupt void CLA1Task1();
__interrupt void CLA1Task2();
__interrupt void CLA1Task3();
__interrupt void CLA1Task4();
__interrupt void CLA1Task5();
__interrupt void CLA1Task6();
__interrupt void CLA1Task7();
__interrupt void CLA1Task8();

#endif //end of _CLA_H_ definition
