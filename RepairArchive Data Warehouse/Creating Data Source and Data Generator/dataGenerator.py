import random as rand
import datetime

# parts

part_id = [1, 200000]
part_id_database = []

part_types = ["nose", "cockpit", "engine", "fuselage", "wing", "tail", "rudder", "tailplane", "fin", "aileron",
              "landing gear", "nosewheel", "exit", "emergency exit", "overhead locker", "air vent", "seat", "window", "curb", "converter"]

part_models = ['zrobb', 'ovlirfw', 'lomauxp', 'fgrnx', 'jonbtnz', 'yirpzdr', 'pmlpnl', 'ujhzaqe', 'agqtr', 'droqxq',
               'qxjmoyk', 'pnstdp', 'mekytuql',
               'xjfsvc', 'keohk', 'nwfxdvat', 'hzlvwi', 'fwddfb', 'bmabky', 'cahwl', 'ijcqab', 'ommwxytq', 'grfyvtpt',
               'zltmn', 'blcog', 'sczmjeue',
               'tdxyuydu', 'hjmbjce', 'kprsu', 'snuti', 'zikkj', 'kqrgrqar', 'tnwych', 'clmnq', 'vxsnk', 'kirutw',
               'fsmsw', 'imhqqp', 'lvtzwcwa', 'wemfw',
               'dhmtinqn', 'trjcnf', 'tthvm', 'vzeix', 'robrdlol', 'nptvkb', 'xuqhvn', 'nlqbv', 'otmhyw', 'bfqinsou',
               'ljizbit', 'hmyttjh', 'mbyjmes', 'hfeonott',
               'xgoiacgo', 'qdfpnjb', 'grukrpl', 'xjdcb', 'jdijw', 'nlldokon', 'trzghpa', 'myfql', 'apsnayi', 'apdpr',
               'zyzny', 'mhzkgsl', 'raqnc', 'fdjiy', 'jtfrnq',
               'ilyobqjl', 'vgpkja', 'hqkirgti', 'lbsjf', 'tbiyvym', 'evsdv', 'knhxy', 'moyulop', 'bfgghwev',
               'ewhptapm', 'llaamlwc', 'syjuew', 'zbkyuic', 'zjslryr',
               'juvtyym', 'adfmtb', 'jottfwvh', 'oritijk', 'zrhtgwe', 'iaxpmwnb', 'wjcptvsg', 'nitgy', 'vpygq',
               'qeytqq', 'phtrb', 'dfharbgu', 'xvkqff', 'oxixgo',
               'yscmu', 'tuzprz', 'yqdhcgq', 'kczqkn', 'cjobnsc', 'fyhhsb', 'smbsvqoa', 'gdoukd', 'qqgezvku', 'groqw',
               'ssfedq', 'ufvgfah', 'savztoq', 'bqhjwh',
               'zmqdrhku', 'wfmog', 'qamnpvpi', 'cazfreka', 'pjnfq', 'osubfrym', 'wgjblw', 'zkejfyfw', 'pndvj',
               'oxefhg', 'ilvcce', 'meqwty', 'wsvrsg', 'kmwgteig',
               'lqfumf', 'dcfzoee', 'jfuzsli', 'suorkgy', 'qcqytp', 'liyemav', 'pkagkk', 'rvjvpqyn', 'zwmyrqw',
               'ztgifam', 'iubusyv', 'cjuwd', 'xxfpud', 'nzncilgy',
               'caheu', 'bhyqcdu', 'zcwtetr', 'pjpodcv', 'sddyysc', 'xqzwvvi', 'yzzydj', 'oykfvoes', 'kthaun',
               'jhrtlyva', 'mwqpo', 'ujsold', 'taekqvx', 'bdnyw',
               'gbpwqgzg', 'vuxswul', 'oycwyfr', 'pogzp', 'wcwks', 'akylzgof', 'cyvausy', 'rkcfhb', 'cetgdht',
               'mimlbbfr', 'qwnzlxv', 'dgadqvtz', 'abcnzgte', 'dlejv',
               'vbjhp', 'fervyh', 'jekuj', 'jbixkgvz', 'tcrslgm', 'gdmnros', 'vrjgy', 'sptxaat', 'qmrrakp', 'ruvwjfp',
               'oblps', 'cgraxnee', 'mvfwk']

part_cost = [500, 100000]

part_type_database = []
part_model_database = []
part_cost_database = []
part_production_date = []
part_production_date = []

start_date = datetime.date(1970, 1, 1)
end_date = datetime.date(2010, 12, 30)

time_between_dates = end_date - start_date
days_between_dates = time_between_dates.days

charArray = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'v', 'u', 'w', 'x', 'y', 'z', '0', '1',
             '2', '3', '4', '5', '6', '7', '8', '9']
randomModel = ''
checkValidModel = []
f = open("parts1.txt", "w")
for i in range(200000):
    part_id_database.append(i+1)
    x = rand.randint(0, len(part_models)-1)
    part_type_database.append(part_types[int(x / 9)])
    modelLength = rand.randint(3, 15)
    for j in range(modelLength):
        randomLetter = rand.randint(0, len(charArray) - 1)
        randomModel += charArray[randomLetter]
    while randomModel in checkValidModel:
        randomLetter = rand.randint(0, len(charArray) - 1)
        randomModel += charArray[randomLetter]
    part_model_database.append(randomModel)
    checkValidModel.append(randomModel)
    randomModel = ''
    part_cost_database.append(rand.randint(part_cost[0], part_cost[1]))
    random_number_of_days = rand.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    part_production_date.append(random_date)
    f.write("|"+part_model_database[i]+"|"+part_type_database[i]+"|"+str(part_cost_database[i])+"|"+str(part_production_date[i])+"\n")
checkValidModel.clear()
f.close()

'''
print(part_type_database)
print(part_model_database)
print(part_cost_database)
print(part_production_date)
'''

# parts_used_in_repair


parts_used_in_reapir_code_of_repair = []
parts_used_in_reapir_part_id = []
checkValid = []
iterator = 0
f = open("parts_used_in_repairs1.txt", "w")
for i in range(1, 1000001):
    number = rand.randint(1, 5)
    for j in range(number):
        x = rand.randint(1, 200000)
        while x in checkValid:
            x = rand.randint(1, 200000)
        checkValid.append(x)
        parts_used_in_reapir_code_of_repair.append(i)
        parts_used_in_reapir_part_id.append(x)
        iterator += 1
    checkValid.clear()
parts_used_in_reapir_code_of_repair.sort()

for i in range(iterator):
    f.write(str(parts_used_in_reapir_code_of_repair[i])+"|"+str(parts_used_in_reapir_part_id[i])+"\n")
f.close()

# planes

plane_id = [1, 2000]
plane_id_database = []

plane_model = ["Airbus A320","Boeing 737","Boeing 777","Airbus A330","Boeing 737","Boeing 787","Embraer E-jets","Bombardier Q400","Bombardier Dash 8","Embraer ERJ 145","Saab 340","Airbus A350"]
plane_type =["Narrow-body","Wide-body","Regional","Commuter"]
plane_type_database = []
plane_model_database = []
capasity = []
planes_year_of_production = []

f = open("planes1.txt", "w")
for i in range(2000):
    plane_id_database.append(i + 1)
    x = rand.randint(0, 11)
    plane_type_database.append(plane_type[int(x / 3)])
    plane_model_database.append(plane_model[x])
    capasity.append(rand.randint(50, 300))
    planes_year_of_production.append(rand.randint(1950, 2008))
    f.write("|"+str(plane_model_database[i])+"|"+str(plane_type_database[i])+"|"+str(capasity[i])+"|"+str(planes_year_of_production[i])+"\n")
f.close()

# repairs

code_of_repair = [1, 1000000]
code_of_repair_database = []

start_dates = []
end_dates = []
repair_times = []
repair_costs = []
repairs_plane_id = []

for i in range(code_of_repair[1]):
    repairs_plane_id.append(rand.randint(1, 2000))

start_date = datetime.datetime(2010, 1, 1, 0, 0, 0)
end_date = datetime.datetime(2019, 12, 30, 23, 59, 59)

time_between_dates = end_date - start_date
seconds_between_dates = time_between_dates.seconds
days_between_dates = time_between_dates.days


f = open("repairs1.txt", "w")
for i in range(1000000):
    code_of_repair_database.append(i + 1)
    # start_date
    random_number_of_days = rand.randrange(days_between_dates)

    random_number_of_seconds = rand.randrange(seconds_between_dates)
    random_date = datetime.timedelta(days=random_number_of_days) + start_date + datetime.timedelta(
        seconds=random_number_of_seconds)
    start_dates.append(random_date)

    # end_date
    daytime = rand.randrange(1, 20)
    secondtime = rand.randrange(30000, 84000)
    endingDate = random_date + datetime.timedelta(days=daytime) + datetime.timedelta(seconds=secondtime)
    end_dates.append(endingDate)

    repairTime = (endingDate - random_date)
    repairTimeDays = repairTime.days
    repair_times.append(repairTimeDays)

    repairCost = rand.randint(50000, 5000000)
    repair_costs.append(repairCost)

    f.write("|"+str(start_dates[i])+"|"+str(end_dates[i])+"|"+str(
        repair_times[i])+"|"+str(repair_costs[i])+"|"+str(repairs_plane_id[i])+"\n")
f.close()

# making_repairs

making_repairs_code_of_repair = []
making_repairs_mechanic_id = []
checkValid = []
iterator = 0
f = open("making_repairs1.txt", "w")
for i in range(1, 1000001):
    number = rand.randint(1,5)
    for j in range(number):
        x = rand.randint(1,1500)
        while x in checkValid:
            x = rand.randint(1, 1500)
        checkValid.append(x)
        making_repairs_code_of_repair.append(i)
        making_repairs_mechanic_id.append(x)
        iterator += 1
    checkValid.clear()
making_repairs_code_of_repair.sort()

for i in range(iterator):
    f.write(str(making_repairs_code_of_repair[i])+"|"+str(making_repairs_mechanic_id[i])+"\n")
f.close()

# mechanics
mechanic_id = [1, 1000]
mechanic_id_database = []

mechanic_name=["Harry","Oliver","Jack","Charlie","Jacob","Thomas","Alfie","Riley","William",
               "James","Joshua","George","Ethan","Noah ","Samuel","Amelia","Olivia","Jessica",
               "Emily","Lily","Ava","Mia","Isla","Sophie","Evie","Isabella","Ruby","Poppy","Grace","Sophia"]

mechanic_surname=["Smith","Johnson","Williams","Brown","Jones","Garcia","Miller","Davis","Rodriguez","Martinez","Hernandez",
                  "Lopez","Gonzalez","Wilson","Anderson","Thomas","Taylor","Moore","Jackson","Martin","Lee","Perez","Thompson","White",
                  "Harris","Sachez","Clark","Ramirez","Lewis","Robinson", "Hamilton", "Hilde", "Alaves", "Pumpkinson", "Mendel", "Armstrong",
                  "Malibu", "Zorg", "Cobain", "Frusciante", "Kiedis", "Carlsen", "Balzary", "Mayer", "Hendrix", "Clapton", "Morello", "Slash", "Emmanuel", "Brzęczek"]

mechanic_name_database = []
mechanic_surname_database = []
age = []
employment_date = []
mechanic_salary=["5000","7000","11000","15000","22000"]
mechanic_salary_database=[]

start_date1 = datetime.date(1970, 1, 1)
end_date1 = datetime.date(2010, 12, 30)
time_between_dates = end_date1 - start_date1
days_between_dates = time_between_dates.days

nameCounter = 0
surnameCounter = 0
f = open("mechanics1.txt", "w")
for i in range(1500):
    mechanic_id_database.append(i + 1)
    mechanic_name_database.append(mechanic_name[nameCounter])
    mechanic_surname_database.append(mechanic_surname[surnameCounter])
    surnameCounter += 1
    if surnameCounter > (len(mechanic_surname) - 1):
        surnameCounter = 0
        nameCounter += 1
    age.append(rand.randint(18, 65))
    random_number_of_days = rand.randrange(days_between_dates)
    random_date = start_date1 + datetime.timedelta(days=random_number_of_days)
    employment_date.append(random_date)
    x = rand.randint(0, 4)
    mechanic_salary_database.append(mechanic_salary[x])
    f.write("|"+str(mechanic_name_database[i])+"|"+str(mechanic_surname_database[i])+"|"+str(age[i])+"|"+str(employment_date[i])+"|"+str(mechanic_salary_database[i])+"\n")
f.close()

date_of_birth = []
company_position = ["junior","standard","advanced","expert","boss"]
company_position_database = []
phone_number = []
email = []
email_rand = ["@gmail.com","@wp.pl","@amazon.com"]

f = open("mechanics1excel.txt", "w")
f2 = open("mechanics2excel.txt","w")
for i in range(1500):
  x = rand.randint(0, 4)
  mechanic_salary_database.append(mechanic_salary[x])
  date_of_birth.append(employment_date[i]-datetime.timedelta(days=age[i]*365))
  company_position_database.append(company_position[x])
  x = rand.randint(100000000,999999999)
  phone_number.append(x)
  x = rand.randint(0,2)
  email.append(mechanic_name_database[i] + "." + mechanic_surname_database[i] + email_rand[x])
  f.write(str(mechanic_id_database[i])+"|"+str(mechanic_name_database[i])+"|"+str(mechanic_surname_database[i])+"|"+str(mechanic_salary_database[i])+"|"+str(date_of_birth[i])+"|"+str(company_position_database[i])+"|"+str(phone_number[i])+"|"+str(email[i])+"\n")
  f2.write(str(mechanic_id_database[i])+"|"+str(mechanic_name_database[i])+"|"+str(mechanic_surname_database[i])+"|"+str(mechanic_salary_database[i])+"|"+str(date_of_birth[i])+"|"+str(company_position_database[i])+"|"+str(phone_number[i])+"|"+str(email[i])+"\n")
f.close()

'''
print(mechanic_name_database)
print(mechanic_surname_database)
print(age)
print(employment_date)
'''

# tests
code_of_test = [1, 4000000]
code_of_test_databse = []
test_names = []
date_of_test = []
result = []
description = []
tests_code_of_repair = []

f = open("tests1.txt", "w")
for i in range(1000000):
    code_of_test_databse.append(i+1)
    test_names.append("plane id: "+str(repairs_plane_id[int(i)]))
    date_of_test.append(end_dates[int(i)])
    res = rand.randint(1, 10)
    if (res < 9):
        result.append("Success")
    else:
        result.append("Failure")
    description.append(" result: "+str(result[i]))
    tests_code_of_repair.append(code_of_repair_database[int(i)])

    f.write("|"+str(test_names[i])+"|"+str(result[i])+"|"+str(description[i])+"|"+str(tests_code_of_repair[i])+"\n")
f.close()