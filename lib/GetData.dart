import 'dart:convert';

import 'package:http/http.dart' as http;

Future getProducts() async {
  final productURI = Uri.parse("https://fakestoreapi.com/products?limit=7");

  final response = await http.get(productURI);
  dynamic responseJson = jsonDecode(response.body);

  return responseJson;
}
