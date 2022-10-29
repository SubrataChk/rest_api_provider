import 'dart:convert';

import 'package:rest_api_provider/src/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future getData() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        List<ProductModel> productData = [];
        var data = jsonDecode(response.body);
        // print(data);

        for (var i in data) {
          productData.add(ProductModel.fromJson(i));
        }
        return productData;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
