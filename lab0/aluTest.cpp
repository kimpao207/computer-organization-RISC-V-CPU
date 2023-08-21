#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "Valu.h"
#include <cstdlib>
#include <ctime>

#define MAX_SIM_TIME 32
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
    Valu *dut = new Valu;

    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");

    srand( time(NULL) );

    while (sim_time < MAX_SIM_TIME) {
        int x = rand()%15;
        int y = rand()%15;
        dut->b = y;
        dut->a = x;
        dut->eval();
        m_trace->dump(sim_time);
        sim_time++;
        if(sim_time % 4 == 0)
            dut->s += 1;
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}