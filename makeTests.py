import sys

# get variables
var_str = input()
var_list = []
var = ""
for i in range(len(var_str)):
    if var_str[i] == ' ':     # ignore spaces
        i += 1
    elif var_str[i] == ',':   # append comma seperated variables
        var_list.append(var)
        var = ""
    elif i == len(var_str)-1: # append variable when at end of string
        var += var_str[i]
        var_list.append(var)
    else:
        var += var_str[i]     # handle multi character variables

# get binary numbers
bits = len(var_list)
binary_nums = []
test_list = []
for i in range(2**bits):
    # ignore '0b'
    curr_bin_num = bin(i)[2::]
    binary_nums.append('0'*(bits - len(curr_bin_num)) + curr_bin_num)
  
# print tests 
for i in range(2**bits):
    print("-- Test ", i, " --", sep="")
    
    for j in range(len(var_list)):
        print(var_list[j], " <= \'", binary_nums[i][j], "\';", sep="")

    print("wait for 10ns;", end="\n\n")
