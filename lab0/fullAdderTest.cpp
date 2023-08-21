#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "VfullAdder.h"

#define MAX_SIM_TIME 20
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
    VfullAdder *dut = new VfullAdder;

    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");
    int num[3] = {0};

    while (sim_time < MAX_SIM_TIME) {
        dut->cin = num[2];
        dut->b = num[1];
        dut->a = num[0];
        dut->eval();
        m_trace->dump(sim_time);
        sim_time++;
        for(int i = 2;i >= 0;i--){
          num[i]++;
          if(num[i] < 2)
            break;
          num[i] = 0;
        }
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}