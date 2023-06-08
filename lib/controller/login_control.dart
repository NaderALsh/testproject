import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/constants/constant.dart';
import 'package:testproject/constants/style.dart';
import 'package:testproject/pages/productsview.dart';

class Login_controller extends GetxController{
  bool loading = false;
    void login(Map map) async {
      try{
        loading = true ;
        update();
      http.Response respone = await http.post(Uri.parse(path_login), body: map);
      // print(json.decode(respone.body));
      loading = false;
      Get.offAll(Productsview());
      update();
      }
      catch(e){
        Get.snackbar('', 'عذرا حدث خطأ ما يرجى محاولة مرة أخرى',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: bluedark,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 3)); 
      }
  }


}