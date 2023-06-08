import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testproject/constants/constant.dart';
import 'package:testproject/core.dart/binding.dart';
import 'package:testproject/pages/productsview.dart';
import 'package:testproject/registertion/login.dart';
import 'package:testproject/test.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  G_use_id_val = prefs.getString(G_use_id);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home:G_use_id_val == null ? const Login() : const Productsview(),
    );
  }
}
