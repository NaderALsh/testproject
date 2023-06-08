import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testproject/constants/constant.dart';
import 'package:testproject/model/get_products_model.dart';

class Products_controller extends GetxController{
  bool loadingList = false;
  List<ProductData> productList = [];
  Products_controller(){
    getProducts();
  }

  void getProducts()async{
    loadingList = true;
    update();
    http.Response respone = await http.get(Uri.parse(path_products));
    List arr = json.decode(respone.body);
    for (int i = 0; i < arr.length; i++) {
      productList.add(ProductData(
        id: arr[i]["id"],
        title: arr[i]["title"],
        description: arr[i]["description"],
        price: arr[i]["price"],
        image: arr[i]["image"],
        rating: arr[i]["rating"],
        category: arr[i]["category"],
      ));
    }
    loadingList = false;
    update();
  }


}