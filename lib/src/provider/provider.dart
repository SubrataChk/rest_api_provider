import 'package:flutter/cupertino.dart';
import 'package:rest_api_provider/src/model/model.dart';
import 'package:rest_api_provider/src/service/service.dart';

class ApiProvider extends ChangeNotifier {
  List<ProductModel> newList = [];

  List<ProductModel> get getdata {
    return newList;
  }

  Future<List<ProductModel>> fetchAllData() async {
    newList = await ApiService().getData();
    return newList;
  }
}
