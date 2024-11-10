import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/user_provider.dart';
import 'Screens/generator_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RandomUserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random User Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomUserScreen(),
    );
  }
}
