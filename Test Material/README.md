# How to test the hdl Pseudo-Noise Generator
In order to test the PN implementation, the [bit_stream.txt](https://github.com/ariannagavioli/PNG/blob/master/Test%20Material/bit_stream.txt) file that contains the output stream of the hdl PN generator was created using the ModelSim tool and the [PNgenTB.vhd](https://github.com/ariannagavioli/PNG/blob/master/hdl/PNgenTB.vhd) file. In particular, the initial seed of the geneator has been set to `000000000000001`.

A first test consists in creating a [python program](https://github.com/ariannagavioli/PNG/blob/master/Test%20Material/simulation.py) that emulates the same generator. That being done, we can test the correctness of the hdl implementation by comparing the output of the latter program (called `simulation.txt`) and compare it with [bit_stream.txt](https://github.com/ariannagavioli/PNG/blob/master/Test%20Material/bit_stream.txt). This could be simply done with the Linux command `diff`, for example.

Other tests involve studying the periodicity of the implemented generator ([periodicity.py](https://github.com/ariannagavioli/PNG/blob/master/Test%20Material/periodicity.py)) and some statistical tests ([statistical.py](https://github.com/ariannagavioli/PNG/blob/master/Test%20Material/statistical.py), [couple_stat.py](https://github.com/ariannagavioli/PNG/blob/master/Test%20Material/couple_stat.py)).

For a better understanding, please consult the [project report](https://github.com/ariannagavioli/PNG/blob/master/Report.pdf), where everything is explained more in detail.
