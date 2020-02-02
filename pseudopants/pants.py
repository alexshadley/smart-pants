import bluetooth

PHONE_NAME = 'SAMSUNG-SM-G950U'
PHONE_ADDR = '50:77:05:28:9E:48'

server_sock = bluetooth.BluetoothSocket(bluetooth.RFCOMM)

port = 1
server_sock.bind(("", port))
server_sock.listen(1)
print("listening on port ", port)

uuid = "1e0ca4ea-299d-4335-93eb-27fcfe7fa848"
bluetooth.advertise_service(server_sock, "Smart Pants", uuid)

client_sock, address = server_sock.accept()
print("Accepted connection from ", address)

data = client_sock.recv(1024)
print("received data: ", data)

client_sock.close()
server_sock.close()
