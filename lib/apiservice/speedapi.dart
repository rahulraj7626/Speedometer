import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future speedApi() async {
  var mapResponse;

  http.Response response;
  response = await http.get(
    Uri.parse('192.168.1.19/mat/data.php'),
  );
  if (response.statusCode == 200) {
    mapResponse = jsonDecode(response.body);
  } else {}
}
