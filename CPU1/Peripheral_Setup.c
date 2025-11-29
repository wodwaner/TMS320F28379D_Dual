/*
 * Peripheral_Setup.c
 */
#include "Peripheral_Setup.h"

void Setup_GPIO(void){
    // pg 959 Table Mux, pg 965 Registers and  spruhm8i.pdf - Technical reference
    EALLOW;
    // LED 31 A, 2
    // LED 34 B, 1
    GpioCtrlRegs.GPAGMUX2.bit.GPIO31 = 0;
    GpioCtrlRegs.GPAMUX2.bit.GPIO31 = 0;

    GpioCtrlRegs.GPBGMUX1.bit.GPIO34 = 0;
    GpioCtrlRegs.GPBMUX1.bit.GPIO34 = 0;

    GpioCtrlRegs.GPAPUD.bit.GPIO31 = 1;
    GpioCtrlRegs.GPBPUD.bit.GPIO34 = 1;

    GpioCtrlRegs.GPADIR.bit.GPIO31 = 1;
    GpioCtrlRegs.GPBDIR.bit.GPIO34 = 1;

    GpioCtrlRegs.GPBCSEL1.bit.GPIO34 = GPIO_MUX_CPU2;
    GpioCtrlRegs.GPACSEL4.bit.GPIO31 = GPIO_MUX_CPU1;

    //PWM 1A e 1B
    GpioCtrlRegs.GPAGMUX1.bit.GPIO0 = 0;
    GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO0 = 1;

    GpioCtrlRegs.GPAGMUX1.bit.GPIO1 = 0;
    GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 1;
    GpioCtrlRegs.GPAPUD.bit.GPIO1 = 1;


    EDIS;
}

void Setup_ePWM(void){
    // pg 1978 spruhm8i.pdf - Technical reference
    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 0;
    CpuSysRegs.PCLKCR2.bit.EPWM1 = 1;
    EDIS;

    EPwm1Regs.TBPRD = 3000;                         // Set timer period, (200MHz/2)/(if up/down /2, else 1)/Freq PWM
    EPwm1Regs.CMPA.bit.CMPA = EPwm1Regs.TBPRD >> 1;
    EPwm1Regs.TBCTR = 0x0000;                       // Clear counter
    EPwm1Regs.TBPHS.bit.TBPHS = 0;                  // Phase is 0

    EPwm1Regs.TBCTL.bit.SYNCOSEL = TB_CTR_ZERO;
    EPwm1Regs.TBCTL.bit.CTRMODE = TB_COUNT_UPDOWN;  // Count up/down
    EPwm1Regs.TBCTL.bit.PHSEN = TB_DISABLE;         // Disable phase loading
    EPwm1Regs.TBCTL.bit.HSPCLKDIV = TB_DIV1;        // Clock ratio to SYSCLKOUT
    EPwm1Regs.TBCTL.bit.CLKDIV = TB_DIV1;

    EPwm1Regs.CMPCTL.bit.SHDWAMODE = CC_SHADOW;     // Load registers every ZERO
    EPwm1Regs.CMPCTL.bit.LOADAMODE = CC_CTR_ZERO_PRD;
    EPwm1Regs.CMPCTL.bit.SHDWBMODE = CC_SHADOW;     // Load registers every ZERO
    EPwm1Regs.CMPCTL.bit.LOADBMODE = CC_CTR_ZERO_PRD;

    EPwm1Regs.AQCTLA.bit.PRD = AQ_NO_ACTION;
    EPwm1Regs.AQCTLA.bit.ZRO = AQ_NO_ACTION;
    EPwm1Regs.AQCTLA.bit.CAU = AQ_CLEAR;            // set actions for EPWM1A
    EPwm1Regs.AQCTLA.bit.CAD = AQ_SET;

    EPwm1Regs.DBCTL.bit.POLSEL = DB_ACTV_HIC;       // Active Hi complementary
    EPwm1Regs.DBCTL.bit.OUT_MODE = DB_FULL_ENABLE;  // enable Dead-band module
    EPwm1Regs.DBFED.bit.DBFED = 10;                 // FED = 10 TBCLKs, x10ns
    EPwm1Regs.DBRED.bit.DBRED = 10;                 // RED = 10 TBCLKs,

    //Trigger ADC
    EPwm1Regs.ETSEL.bit.SOCAEN = 1;                 // Enable SOC on A group
    EPwm1Regs.ETSEL.bit.SOCASEL = ET_CTR_PRDZERO;   // Dispara ADC no topo
    EPwm1Regs.ETPS.bit.SOCAPRD = ET_1ST;            // Trigger on every event

    EALLOW;
    CpuSysRegs.PCLKCR0.bit.TBCLKSYNC = 1;
    EDIS;
}

void Setup_ADC_A(void){
    // pg 1592 spruhm8i.pdf - Technical reference
    Uint16 acqps;
    EALLOW;
    CpuSysRegs.PCLKCR13.bit.ADC_A = 1;
    AdcaRegs.ADCCTL2.bit.PRESCALE = 6;          // set ADCCLK divider to /4
    AdcSetMode(ADC_ADCA, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcaRegs.ADCCTL1.bit.INTPULSEPOS = 1;       // Set pulse um ciclo antes do resultado
    AdcaRegs.ADCCTL1.bit.ADCPWDNZ = 1;          // power up the ADC
    DELAY_US(1000);                             // delay for 1ms to allow ADC time to power up
    // determine minimum acquisition window (in SYSCLKS) based on resolution
    if(ADC_RESOLUTION_12BIT == AdcaRegs.ADCCTL2.bit.RESOLUTION)
        acqps = 14;                             // 75ns
    else                                        // resolution is 16-bit
        acqps = 63;                             // 320ns

    AdcaRegs.ADCSOC0CTL.bit.CHSEL = 5;          //SOC0 will convert pin ADCINA5 (66)
    AdcaRegs.ADCSOC0CTL.bit.ACQPS = acqps;                  //sample window is 15 SYSCLK cycles
    AdcaRegs.ADCSOC0CTL.bit.TRIGSEL = TRIG_SEL_ePWM1_SOCA;  //trigger on ePWM1 SOCA

    AdcaRegs.ADCSOC1CTL.bit.CHSEL = 4;          //SOC1 will convert pin ADCINA4 (69)
    AdcaRegs.ADCSOC1CTL.bit.ACQPS = acqps;
    AdcaRegs.ADCSOC1CTL.bit.TRIGSEL = AdcaRegs.ADCSOC0CTL.bit.TRIGSEL;

    //pg 1569 spruhm8i.pdf - Technical reference
    AdcaRegs.ADCINTSEL1N2.bit.INT1SEL = 1;      // end of SOC1 will set INT1 flag
    AdcaRegs.ADCINTSEL1N2.bit.INT1E = 1;        // enable INT1 flag
    AdcaRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;      // make sure INT1 flag is cleared

    EDIS;
}

void Setup_ADC_B(void){
    // pg 1592 spruhm8i.pdf - Technical reference
    Uint16 acqps;
    EALLOW;
    //write configurations
    CpuSysRegs.PCLKCR13.bit.ADC_B = 1;
    AdcbRegs.ADCCTL2.bit.PRESCALE = 6;                      // Set ADCCLK divider to /4
    AdcSetMode(ADC_ADCB, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcbRegs.ADCCTL1.bit.INTPULSEPOS = 1;                   // Set pulse positions to late
    AdcbRegs.ADCCTL1.bit.ADCPWDNZ = 1;                      // power up the ADC
    DELAY_US(1000);                                         // delay for > 1ms to allow ADC time to power up

    //determine minimum acquisition window (in SYSCLKS) based on resolution
    if(ADC_RESOLUTION_12BIT == AdcbRegs.ADCCTL2.bit.RESOLUTION){
        acqps = 14;     //75ns
    }else{
        //resolution is 16-bit
        acqps = 63; //320ns
    }
    //Select the channels to convert and end of conversion flag ADCB
    AdcbRegs.ADCSOC0CTL.bit.CHSEL = 5;                     //SOC0 will convert pin ADCINB5 (65)
    AdcbRegs.ADCSOC0CTL.bit.ACQPS = acqps;                  //sample window is 100 SYSCLK cycles
    AdcbRegs.ADCSOC0CTL.bit.TRIGSEL = TRIG_SEL_ePWM1_SOCA;  //trigger

    //pg 1569 spruhm8i.pdf - Technical reference
    AdcbRegs.ADCINTSEL1N2.bit.INT1SEL = 0;                  // End of SOC0 will set INT1 flag
    AdcbRegs.ADCINTSEL1N2.bit.INT1E = 1;                    // Disable INT1 flag
    AdcbRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;                  // Make sure INT1 flag is cleared
    EDIS;
}

void Setup_ADC_C(void){
    // pg 1592 spruhm8i.pdf - Technical reference
    Uint16 acqps;
    EALLOW;
    //write configurations
    CpuSysRegs.PCLKCR13.bit.ADC_C = 1;
    AdccRegs.ADCCTL2.bit.PRESCALE = 6;                      // Set ADCCLK divider to /4
    AdcSetMode(ADC_ADCC, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdccRegs.ADCCTL1.bit.INTPULSEPOS = 1;                   // Set pulse positions to late
    AdccRegs.ADCCTL1.bit.ADCPWDNZ = 1;                      // power up the ADC
    DELAY_US(1000);                                         // delay for > 1ms to allow ADC time to power up

    //determine minimum acquisition window (in SYSCLKS) based on resolution
    if(ADC_RESOLUTION_12BIT == AdccRegs.ADCCTL2.bit.RESOLUTION){
        acqps = 14;     //75ns
    }else{
        //resolution is 16-bit
        acqps = 63; //320ns
    }
    //Select the channels to convert and end of conversion flag ADCC
    AdccRegs.ADCSOC0CTL.bit.CHSEL = 4;                     //SOC0 will convert pin ADCINC4  (67)
    AdccRegs.ADCSOC0CTL.bit.ACQPS = acqps;                  //sample window is 100 SYSCLK cycles
    AdccRegs.ADCSOC0CTL.bit.TRIGSEL = TRIG_SEL_ePWM1_SOCA;  //trigger

    //pg 1569 spruhm8i.pdf - Technical reference
    AdccRegs.ADCINTSEL1N2.bit.INT1SEL = 0;                  // End of SOC0 will set INT1 flag
    AdccRegs.ADCINTSEL1N2.bit.INT1E = 1;                    // Disable INT1 flag
    AdccRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;                  // Make sure INT1 flag is cleared
    EDIS;
}

void Setup_ADC_D(void){
    // pg 1592 spruhm8i.pdf - Technical reference
    Uint16 acqps;
    EALLOW;
    //write configurations
    CpuSysRegs.PCLKCR13.bit.ADC_D = 1;
    AdcdRegs.ADCCTL2.bit.PRESCALE = 6;                      // Set ADCCLK divider to /4
    AdcSetMode(ADC_ADCD, ADC_RESOLUTION_12BIT, ADC_SIGNALMODE_SINGLE);
    AdcdRegs.ADCCTL1.bit.INTPULSEPOS = 1;                   // Set pulse positions to late
    AdcdRegs.ADCCTL1.bit.ADCPWDNZ = 1;                      // power up the ADC
    DELAY_US(1000);                                         // delay for > 1ms to allow ADC time to power up

    //determine minimum acquisition window (in SYSCLKS) based on resolution
    if(ADC_RESOLUTION_12BIT == AdcdRegs.ADCCTL2.bit.RESOLUTION){
        acqps = 14;     //75ns
    }else{
        //resolution is 16-bit
        acqps = 63; //320ns
    }
    //Select the channels to convert and end of conversion flag ADCB
    AdcdRegs.ADCSOC0CTL.bit.CHSEL = 15 ;                     //SOC0 will convert pin ADCIN15  (63)
    AdcdRegs.ADCSOC0CTL.bit.ACQPS = acqps;                  //sample window is 100 SYSCLK cycles
    AdcdRegs.ADCSOC0CTL.bit.TRIGSEL = TRIG_SEL_ePWM1_SOCA;  //trigger

    //pg 1569 spruhm8i.pdf - Technical reference
    AdcdRegs.ADCINTSEL1N2.bit.INT1SEL = 0;                  // End of SOC0 will set INT1 flag
    AdcdRegs.ADCINTSEL1N2.bit.INT1E = 1;                    // Disable INT1 flag
    AdcdRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;                  // Make sure INT1 flag is cleared
    EDIS;
}
