# Pseudo-Random Noise Generator
The aim of this project is to implement a PseudoNoise Generator for CDMA transmissions using the VHDL language and synthesize it on the Zync FPGA. The generator must comply with the following specifications:
1. the generator must be a 15-stage PN generator;
2. the generator must follow the characteristic polynomial x^15 + x^13 + x^9 + x^8 + x^7 + x^5 + 1

## VHDL implementation
The VHDL implementation is available in the [hdl](https://github.com/ariannagavioli/PNG/tree/master/hdl) folder. 

## Tests
After a ModelSim simulation, some tests have been executed on the output of the generator. The test code is available in the `Test Material` folder.

## Documentation
For a better understanding of the project, [here's](https://github.com/ariannagavioli/PNG/blob/master/Report.pdf) its report.
