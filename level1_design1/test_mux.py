# See LICENSE.vyoma for details

import cocotb
from cocotb.triggers import Timer
import random
from random import randint



@cocotb.test()
async def test_mux(dut):
    """Test for inp12"""
    dut.sel.value=12
    dut.inp12.value=random.randint(0,3)
    await Timer (2,units='ns')
    assert dut.out.value== dut.inp12.value,f'mux output is incorrect:{dut.inp12.value}!={dut.out.value}'

async def test_mux(dut):
    'Test for inp30'
    dut.sel.value=30
    dut.inp30.value=random.randint(0,3)
    await Timer (2,units='ns')
    assert dut.out.value==dut.inp30.value,f'mux output is incorrect:{dut.inp30.value}!={dut.out.value}'