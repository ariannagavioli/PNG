v0 = 15*[0]		# first vector memorized in the
v0[0] = 1		# register (seed) = 000000000000001

v_current = v0
step = 0

simulation = open("simulation.txt",'w')

# We will write on the simulation file the ouput bit (v_current[14]) and number of step

simulation.write(str(step)+" "+str(v_current[14])+"\n")

'''
while the value in the register doesn't go back to the inital value
we can output a pseudorandom bitstream: when we get back the initial value,
the bitstream will repeat itself and we will have reached the number of 
steps of periodicity
'''

while ( (v0 != v_current) or (step == 0) ) :

	step = step + 1

	# Bits from 0 to 13 are to be shifted to the right, so the sequence is untouched
	slc = v_current[0:14]

	# Bit 0 will be the result of the xor operation done accordingly to the polynomial generator
	feed = v_current[1] + v_current[5] + v_current[6] + v_current[7] + v_current[9] + v_current[14]
	feed = (feed%2)

	# Update of the register
	v_current = [feed] + slc

	# Append the output bit to the simulation file
	simulation.write(str(step)+" "+str(v_current[14])+"\n")

print (v_current,step)
