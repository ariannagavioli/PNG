file = open("bit_stream.txt",'r')

oneone = 0
zerozero = 0
zeroone = 0
onezero = 0

step = 0

for line in file:
	values = line.split(" ")

	if(step == 0):
		previous = int(values[1])
		step = step + 1
		continue

	if(int(values[1]) == 1):

		if(previous == 1):
			oneone = oneone + 1
		else:
			onezero = onezero + 1

	if(int(values[1]) == 0):

		if(previous == 0):
			zerozero = zerozero + 1
		else:
			zeroone = zeroone + 1

	step = step + 1
	previous = int(values[1])



print("Number of (0,0): "+str(zerozero))
print("Number of (0,1): "+str(zeroone))
print("Number of (1,0): "+str(onezero))
print("Number of (1,1): "+str(oneone))