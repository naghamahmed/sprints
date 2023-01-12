#while loop will check the sequence of the string and replace each sequence with empty string untill the string becomes empty
#If there is no pair present, then returns the YES otherwise NO

def isBalanced(string):
    while True:
        if '()' in string:
            string = string.replace('()', '')
        elif '{}' in string:
            string = string.replace('{}', '')
        elif '[]' in string:
            string = string.replace('[]', '')
        else:
            return "YES" if not string else "NO"


# Test code
string = "{[()]}"
print(isBalanced(string)) #retrun YES

string = "{[(]}"
print(isBalanced(string)) #return NO

string = "{{[[(())]]}}"
print(isBalanced(string)) #return YES
