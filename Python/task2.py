#if the first or the second condition is true that means the year is a leap year "it will return true"
#else the year is not a leap year "it will return false"

def is_leap(year):


    if ((year % 400 == 0) and (year % 100 == 0)) or ((year % 4 == 0) and (year % 100 != 0)):
        return("true")


    else:
        return("false")

year = int(input("Enter a year: "))
print(is_leap(year))

#print(is_leap(2000)) #return true
#print(is_leap(1800)) #return false
