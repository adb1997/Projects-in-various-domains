# -*- coding: utf-8 -*-
"""
Created on Wed Aug 16 18:14:35 2017

@author: Aditya
"""
import time
from urllib.request import urlopen
import requests

while True:
    response = urlopen('http://localhost/Workshop/room1.txt')
    status = response.read()
    print (status)
    if (status == 1):
        print ('led on')
    else:
        print ('led off')


              
    
