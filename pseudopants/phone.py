import bluetooth

bd_addr = "88:B1:11:57:5E:99"

port = 1

sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
sock.connect((bd_addr, port))

sock.send("hello!!")

sock.close()
