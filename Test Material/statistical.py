file = open("bit_stream.txt",'r')

ones = 0
zeros = 0

for line in file:
	values = line.split(" ")

	if(int(values[1]) == 1):
		ones = ones + 1
	else:
		zeros = zeros + 1

print("Number of zeros: "+str(zeros)+"\nNumber of ones: "+str(ones))
