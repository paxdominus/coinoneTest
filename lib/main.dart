import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'funcs/apis.dart';
import 'model/data_list_model.dart';
import 'model/data_list_model2.dart';
import 'funcs/firebase_funcs.dart';
import 'view/login_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DataListModel()),
      ChangeNotifierProvider(create: (context) => DataListModel2())
    ],
    child: const MainApp(),
  ));
}

  bool isKeepLoggedIn = false ; 

class MainApp extends StatefulWidget {
  const MainApp({super.key});



  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    FirebaseFuncs().iniFirebase();
    Apis().getImagesData();
  
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child:  LoginPage(),
        ),
      ),
    );
  }

}
