/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

// the premise here is that we have a GPIO where channel 0 is the phase increment, and ch1 is resetn


#include <stdio.h>
#include <math.h>
#include "platform.h"
#include "xparameters.h"
#include "xuartps_hw.h"


#define UART_BASE (XPAR_PS7_UART_1_BASEADDR)


void main_menu()
{
    print("Instructor Solution.\r\n");
    print("\r\n");
    print("Press 'f' to tune to a new frequency\r\n");
    print("Press 'U/u' to increase frequency by 1000/100 Hz.\r\n");
    print("Press 'D/d' to decrease frequency by 1000/100 Hz.\r\n");
    print("Press 'r' to reset the phase.\r\n");
    print("Press [space] to repeat this menu.\r\n");
    print("SW0 is used to exercise both paths to the DAC: O = Unfiltered, 1 = Filtered\r\n");
    print("\r\n");
}




int main()
{
    char temp;
    int freq; //we�ll store frequency, and always convert to phase_inc. store as unsigned into to detect when we roll negative.
    unsigned int phase_inc;
	unsigned int new_freq, freq_changed;

    init_platform();
    print("\r\nUsing IIC to set registers on CODEC..\r\n");
    print("\r\nDone... Starting Lab 4 Application (Same as Lab 3 Application!).\r\n");
	print("\r\n");
    main_menu();

    

    while(1);
    cleanup_platform();
    return 0;
}
