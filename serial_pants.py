#!/usr/bin/env python

import time
import serial
from flask import Flask
app = Flask(__name__)

@app.route('/')
def display():
    serial_data = get_serial_data()

    return ("Data: " + serial_data)

def get_serial_data():
    ser = serial.Serial(
               port='/dev/ttyAMA0',
               baudrate = 9600,
               parity=serial.PARITY_NONE,
               stopbits=serial.STOPBITS_ONE,
               bytesize=serial.EIGHTBITS,
               timeout=1
           )
    counter=0
    str=""

    while (counter < 1000):
           x=ser.readline()
           str+=x.decode(encoding='UTF-8')
           counter+=1

if __name__=='__main__':
    app.run(debug=True, host='0.0.0.0')
