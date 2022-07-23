# See LICENSE.vyoma for details

import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test_mux(dut):
    """Test for mux2"""
    sel=1
    dut.sel.value=sel
    
    await Timer (2,units='ns')
    assert dut.x.value== mux(sel,inp0, inp1, inp2, inp3, inp4, inp5, inp6, inp7, inp8, 
           inp9, inp10, inp11, inp12, inp13, inp14, inp15, inp16, inp17,
           inp18, inp19, inp20, inp21, inp22, inp23, inp24, inp25, inp26,
           inp27, inp28, inp29, inp30),f'mux is incorrect: {dut.x.value}!=inp1'

@cocotb.test()
async def randomised_test_mux(dut):
    'test for two random multiple numbers'
    for i in range (31):
        sel=random.randint(0,31)
        dut.sel.value=sel
        await Timer(2,units='ns')
        assert dut.x.value == mux(sel,inp0, inp1, inp2, inp3, inp4, inp5, inp6, inp7, inp8, 
           inp9, inp10, inp11, inp12, inp13, inp14, inp15, inp16, inp17,
           inp18, inp19, inp20, inp21, inp22, inp23, inp24, inp25, inp26,
           inp27, inp28, inp29, inp30),'randomised test failed with:{sel}={x}'.format (sel=dut.sel.value,x=dut.x.value)  
