import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup/controllers/authentication.dart';
import 'package:startup/widgets/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      title: "StartUp",
      home: FutureBuilder(
        future: authController.checkUserLoggedIn(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.hasData) {
            return Text("${snapshot.data}");
          }
          return LoadingWidget();
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
