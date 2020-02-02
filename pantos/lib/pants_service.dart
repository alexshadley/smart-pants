import 'dart:async';
import 'package:http/http.dart' as http;

const PANTS_HOST = '192.168.43.60:5000';

Future<bool> getWalletStatus() {
  var completer = new Completer<bool>();

  var uri = Uri.http(PANTS_HOST, '/walletstatus');

  http.get(uri).then((response) {
    if (response.statusCode == 200) {
      var status = response.body.toLowerCase() == 'true';
      completer.complete(status);
    } else {
      completer.completeError('Request failed: ${response.body}');
    }
  });

  return completer.future;
}
