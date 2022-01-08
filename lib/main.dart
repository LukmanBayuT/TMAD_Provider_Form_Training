import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form/provider/list_provider.dart';
import 'package:provider_form/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ListProvider>(
          create: (context) => ListProvider(), child: const HomePage()),
    );
  }
}
