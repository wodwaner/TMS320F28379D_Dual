#include "Peripheral_Setup.h"
#include "F2837xD_Ipc_drivers.h"
#include "CLA_Config.h"

__interrupt void isr_cpu_timer0(void);


//========== Globals variables of CLA ==========
#pragma SET_DATA_SECTION("CLAData")
uint16_t counter_CLA2 = 0;

//========== CLA to CPU variables =============
#pragma SET_DATA_SECTION("Cla1ToCpuMsgRAM")

//========== CPU to CLA variables =============
#pragma SET_DATA_SECTION("CpuToCla1MsgRAM")

//========== CPU Shared variables =============
#pragma SET_DATA_SECTION("VarsCpu1")
volatile float theta_cpu1;
volatile uint16_t counter_cpu1;
#pragma SET_DATA_SECTION("VarsCpu2")
volatile float theta_cpu2;
volatile uint16_t counter_cpu2;

//========== CPU variables ====================
#pragma SET_DATA_SECTION()
uint32_t counter2 = 0;

int main(void){
    InitSysCtrl();                              // Initialize System Control:
    DINT;                                       // Disable CPU interrupts
    InitPieCtrl();                              // Initialize the PIE control registers to their default state
    IER = 0x0000;                               // Disable CPU interrupts
    IFR = 0x0000;                               // Clear all CPU interrupt flags:
    DisablePeripheralClocks();                  // Disable all clocks
    InitPieVectTable();                         // Initialize the PIE vector table

    while(!MemCfgRegs.GSxMSEL.bit.MSEL_GS15){ }
    IpcRegs.IPCBOOTSTS = C2_BOOTROM_BOOTSTS_SYSTEM_READY;

    EALLOW;
    CpuSysRegs.PCLKCR0.bit.CPUTIMER0 = 1;       // Enable timer clock
    PieVectTable.TIMER0_INT = &isr_cpu_timer0;  // Redirect function to interruption
    EDIS;

    // pg. 102 PIE Channel Mapping spruhm8i.pdf - Technical reference
    PieCtrlRegs.PIEIER1.bit.INTx7 = 1;          // Enable PieVector to Timer 0 interrupt
    IER |= (M_INT1);                            // Enable lines of interrupt

    InitCpuTimers();                            // Initializae cpu timer
    ConfigCpuTimer(&CpuTimer0, 200, 1000000);   // Configure cpu timer0 with 200MHz and 1s
    CpuTimer0Regs.TCR.all = 0x4000;             // Enable timer 0

    CLA1_ConfigCLAMemory();
    CLA1_InitCpu1Cla1();

    while (IpcRegs.IPCSTS.bit.IPC5 == 0) ;  // Wait for CP1 to set IPC5
    IpcRegs.IPCACK.bit.IPC5 = 1;
    IpcRegs.IPCSET.bit.IPC4 = 1;            // Let CPU1 know that CPU2 is ready, set IPC4 to release CPU1

    EINT;                                       // Enable Global interrupt INTM
    ERTM;                                       // Enable Global realtime interrupt DBGM
    GpioDataRegs.GPBDAT.bit.GPIO34 = 0;         // Turn off LED

    while(1){
        counter2++;
        counter_cpu2++;
    }// Infinite loop
    return 0;
}


// =================== ISR =======================
__interrupt void isr_cpu_timer0(void){
    GpioDataRegs.GPBTOGGLE.bit.GPIO34 = 1;
    Cla1ForceTask1();

    theta_cpu2 += 3.14159265/100.0;
    if(theta_cpu2 > (2.0*3.14159265)) theta_cpu2 -=  (2.0*3.14159265);

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

