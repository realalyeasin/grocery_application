import 'dart:convert';
import 'package:grocery_application/Model/grocery_model.dart';
import 'package:http/http.dart' as http;

class Repo {
  static Future<GroceryModel?> getData() async {
    String url = 'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10';
    final response = await http.Client().get(Uri.parse(url));
    if(response.body != 200){
      throw Exception();
    } else {
      print(response.body);
      return groceryModelFromJson(utf8.decode(response.bodyBytes));
    }
  }
}