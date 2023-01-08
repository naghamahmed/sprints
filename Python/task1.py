#Replaceing character in the giving string with givin index by split the string into two parts
#the first part "str[:index]" the characters from thr first till the new character(without the new char) then "+" the new character
#the second part "str[index+1:]" the rest string after the new character till the end
#Calling the function

def change_char(str, index, char):
    string= str[:index] + char + str[index+1:]
    print (string)


change_char("Abracadabra",5, "K")  # return Abrackdabra



