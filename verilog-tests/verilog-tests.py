#!/usr/bin/env python3

import sys

# TODO: implement usage

# get variables
var_str = input()
var_str = var_str.replace(" ", "") # remove all white spaces
var_list = [] # holds variables
var = ""
for var in var_str.split(sep=','): # seperate variables
    # further seperate variables with assigned states
    var_list.append(var.split(sep='='))

# get binary numbers
bits = len(var_list)
binary_nums = []
for i in range(2**bits):
    # ignore '0b'
    curr_bin_num = bin(i)[2::]
    binary_nums.append('0'*(bits - len(curr_bin_num)) + curr_bin_num)

# create list of tests that reflects assigned states
test_list = []
for i in range(len(binary_nums)):
    curr_test = ""
    for j in range(len(var_list)): # check all variables for assigned states
        if len(var_list[j]) == 1:
            curr_test += binary_nums[i][j]
        if len(var_list[j]) == 2: # handle assigned states
            curr_test += var_list[j][1]

    test_list.append(curr_test)

# get rid of duplicate tests and sort
test_set = list(set(test_list))
test_set.sort()
print(test_set)

# print tests 
for i in range(len(test_set)):
    print("-- Test ", i, " --", sep="")
    
    for j in range(len(var_list)):
        print(var_list[j][0], " <= \'", test_set[i][j], "\';", sep="")

    print("wait for 10ns;", end="\n\n")
