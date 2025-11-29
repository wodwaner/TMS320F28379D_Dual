#include "Peripheral_Setup.h"
#include "F2837xD_Ipc_drivers.h"
#include "CLA_Config.h"

__interrupt void isr_cpu_timer0(void);
__interrupt void isr_adc(void);


//========== Globals variables of CLA ==========
#pragma SET_DATA_SECTION("CLAData")
uint16_t counter_CLA1 = 0;
float seno = 0;
float theta_CLA1 = 0;
//========== CLA to CPU variables =============
#pragma SET_DATA_SECTION("Cla1ToCpuMsgRAM")

//========== CPU to CLA variables =============
#pragma SET_DATA_SECTION("CpuToCla1MsgRAM")


//========== CPU Shared variables =============
#pragma SET_DATA_SECTION("VarsCpu1")
volatile float theta_cpu1 = 0;
volatile uint16_t counter_cpu1 = 0;
#pragma SET_DATA_SECTION("VarsCpu2")
volatile float theta_cpu2 = 0;
volatile uint16_t counter_cpu2 = 0;

//========== CPU variables ====================
#pragma SET_DATA_SECTION()

uint16_t adc1, adc2, adc3, adc4;
uint16_t counter_ADC = 0;
uint32_t counter1 = 0;
float cos = 0;

int main(void){
    InitSysCtrl();                              // Initialize System Control:
    DINT;                                       // Disable CPU interrupts
    InitPieCtrl();                              // Initialize the PIE control registers to their default state
    IER = 0x0000;                               // Disable CPU interrupts
    IFR = 0x0000;                               // Clear all CPU interrupt flags:
    DisablePeripheralClocks();                  // Disable all clocks

    EALLOW;
    //DevCfgRegs.CPUSEL6.bit.SPI_C = 1;       // Transfer ownership of SPIC to CPU02, pg 312 spruhm8i.pdf - Technical reference
    // pg 486 spruhm8i.pdf - Technical reference
    MemCfgRegs.GSxMSEL.bit.MSEL_GS11 = 1;
    MemCfgRegs.GSxMSEL.bit.MSEL_GS12 = 1;
    MemCfgRegs.GSxMSEL.bit.MSEL_GS13 = 1;
    MemCfgRegs.GSxMSEL.bit.MSEL_GS15 = 1;
    EDIS;

    InitPieVectTable();                     // Initialize the PIE vector table
    IpcRegs.IPCCLR.all = 0xFFFFFFFF;        // Clear IPC Flags

    EALLOW;
    CpuSysRegs.PCLKCR0.bit.CPUTIMER0 = 1;       // Enable timer clock
    PieVectTable.TIMER0_INT = &isr_cpu_timer0;  // Redirect function to interruption
    PieVectTable.ADCA1_INT = &isr_adc;          // Redirect function to interruption
    EDIS;

    // pg. 102 PIE Channel Mapping spruhm8i.pdf - Technical reference
    PieCtrlRegs.PIEIER1.bit.INTx7 = 1;          // Enable PieVector to Timer 0 interrupt
    PieCtrlRegs.PIEIER1.bit.INTx1 = 1;          // Enable PieVector to ADCA1 interrupt
    IER |= (M_INT1);                            // Enable lines of interrupt

    InitCpuTimers();                            // Initializae cpu timer
    ConfigCpuTimer(&CpuTimer0, 200, 1000000);   // Configure cpu timer0 with 200MHz and 1s
    CpuTimer0Regs.TCR.all = 0x4000;             // Enable timer 0

    Setup_GPIO();                               // Configure GPIOs
    Setup_ePWM();                               // Configure ePWM
    Setup_ADC_A();                              // Configure ADC A
    Setup_ADC_B();
    Setup_ADC_C();
    Setup_ADC_D();

    CLA1_ConfigCLAMemory();
    CLA1_InitCpu1Cla1();

    IpcRegs.IPCSET.bit.IPC5 = 1;            // Set IPC5 to CPU2
    while (IpcRegs.IPCSTS.bit.IPC4 == 0);  // Wait for CPU2 to set IPC4
    IpcRegs.IPCACK.bit.IPC4 = 1;

    EINT;                                       // Enable Global interrupt INTM
    ERTM;                                       // Enable Global realtime interrupt DBGM
    GpioDataRegs.GPADAT.bit.GPIO31 = 0;         // Turn off LED

    while(1){
        counter1++;
        counter_cpu1++;

    }// Infinite loop
    return 0;
}


// =================== ISR =======================
__interrupt void isr_cpu_timer0(void){
    GpioDataRegs.GPATOGGLE.bit.GPIO31 = 1;

    theta_cpu1 += 3.14159265/100.0;
    if(theta_cpu1 > (2.0*3.14159265)) theta_cpu1 -=  (2.0*3.14159265);

    cos = __cos(theta_cpu1);


    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}

__interrupt void isr_adc(void){

    counter_ADC++;

    // just to configure that the other adc have finished the conversion, it can be commented
    while(!AdcbRegs.ADCINTFLG.bit.ADCINT1);
    while(!AdccRegs.ADCINTFLG.bit.ADCINT1);
    while(!AdcdRegs.ADCINTFLG.bit.ADCINT1);

    adc1 = (int)AdcaResultRegs.ADCRESULT0;
    adc2 = (int)AdcbResultRegs.ADCRESULT0;
    adc3 = (int)AdccResultRegs.ADCRESULT0;
    adc4 = (int)AdcdResultRegs.ADCRESULT0;


    // Clear Flags of ADC interruption
    AdcaRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;
    AdcbRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;
    AdccRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;
    AdcdRegs.ADCINTFLGCLR.bit.ADCINT1 = 1;
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}


//=========== ISR CLA (CLA_Config.h) ==============
// if set, it is executed at the end of the Task

__interrupt void CLA1_isr1(void){
    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr2(void){
    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr3(void){
    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr4(void){

    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr5(void){
    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr6(void){
    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr7(void){
    asm(" ESTOP0");
    PieCtrlRegs.PIEACK.all = PIEACK_GROUP11;
}

__interrupt void CLA1_isr8(void){
    asm(" ESTOP0");
}

