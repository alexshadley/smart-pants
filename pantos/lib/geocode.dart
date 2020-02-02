import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Coordinate {
  double x;
  double y;

  Coordinate(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

const API_BASE = 'us1.locationiq.com';
const API_PATH = '/v1/search.php';
const API_TOKEN = 'e680697f1991ec';

// SICK async support coming out from Dart
Future<Coordinate> geocode(String address) {
  var completer = new Completer<Coordinate>();

  var queryParameters = {'q': address, 'key': API_TOKEN, 'format': 'json'};
  var uri = Uri.https(API_BASE, API_PATH, queryParameters);

  print(uri.toString());

  http.get(uri).then((response) {
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      double latitiude = double.parse(data[0]['lat']);
      double longitude = double.parse(data[0]['lon']);

      print('output: $data');
      completer.complete(Coordinate(latitiude, longitude));
    } else {
      completer.completeError('Request failed: ${response.body}');
    }
  });

  return completer.future;
}
