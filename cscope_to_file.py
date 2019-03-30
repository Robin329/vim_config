#!/bin/python 
import os 
save_file = open("cscope.files", 'w') 
for root, dirs, list in os.walk("./"): 
	for i in list: cur_path = os.path.abspath(root) 
	file_path = cur_path + '/' + i 
	save_file.write(file_path+'\n') 
save_file.close()

