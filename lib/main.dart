import 'package:find_a_place/models/sale_home_tile.dart';
import 'package:find_a_place/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ForSaleProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FIND A PLACE',
        home: LoginScreen(),
      ),
    );
  }
}
