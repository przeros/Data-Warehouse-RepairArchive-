
f = open("time.txt", "w")
for i in range(24):
	f.write(str(i+1)+"|"+str(i)+"\n")
f.close()

dni = [31,28,31,30,31,30,31,31,30,31,30,31]
f = open("date.txt", "w")
id = 1
for i in range(1950,2022):
	for j in range(1,13):
		for k in range(1,dni[j-1]+1):
			day = ""
			month = ""
			if(k < 10):
				day = "0" + str(k)
			else:
				day = str(k)
			if(j < 10):
				month = "0" + str(j)
			else:
				month = str(j)

			date = str(i) + "-" + month + "-" + day

			f.write(str(id)+"|"+date+"|"+str(i)+"|"+month+"|"+day+"\n")
			id += 1
f.close()